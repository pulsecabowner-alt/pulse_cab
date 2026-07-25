import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/model/search_location_model.dart';
import 'package:pulse_cab/features/home/providers/location_provider.dart';

class CityInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String? errorText;

  const CityInput({
    super.key,
    required this.label,
    required this.controller,
    this.errorText,
  });

  @override
  State<CityInput> createState() => _CityInputState();
}

class _CityInputState extends State<CityInput> {
  final LayerLink _layerLink = LayerLink();

  OverlayEntry? _overlayEntry;

  List<SearchLocationModel> _suggestions = [];

  static const double _itemHeight = 48;
  static const double _maxHeight = 240;

  void _onChanged(String value) {
    if (!mounted) return;

    value = value.trim().toLowerCase();

    if (value.isEmpty) {
      _removeOverlay();
      return;
    }

    final provider = context.read<LocationProvider>();

    final List<SearchLocationModel> result = [];

    // Cities
    for (final city in provider.cities) {
      if (city.city.toLowerCase().contains(value)) {
        result.add(
          SearchLocationModel(
            title: city.city,
            subtitle: city.state,
            isAirport: false,
          ),
        );
      }
    }

    // Airports
    for (final airport in provider.airports) {
      if (airport.airportName.toLowerCase().contains(value) ||
          airport.cityName.toLowerCase().contains(value) ||
          airport.iata.toLowerCase().contains(value)) {
        result.add(
          SearchLocationModel(
            title: airport.airportName,
            subtitle: airport.cityName,
            isAirport: true,
            iataCode: airport.iata,
          ),
        );
      }
    }

    _suggestions = result.take(10).toList();

    if (_suggestions.isEmpty) {
      _removeOverlay();
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _showOverlay();
    });
  }

  void _showOverlay() {
    _removeOverlay();

    final overlay = Overlay.of(context);

    if (overlay == null) return;

    final height = (_suggestions.length * _itemHeight).clamp(
      _itemHeight,
      _maxHeight,
    );

    _overlayEntry = OverlayEntry(
      builder: (_) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: _removeOverlay,
              ),
            ),

            CompositedTransformFollower(
              link: _layerLink,
              offset: const Offset(0, 58),
              showWhenUnlinked: false,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: _getWidth(),
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: _suggestions.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (_, index) {
                      final item = _suggestions[index];

                      return InkWell(
                        onTap: () {
                          widget.controller.text = item.title;
                          _removeOverlay();
                          FocusScope.of(context).unfocus();
                        },
                        child: Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Row(
                            children: [
                              Icon(
                                item.isAirport
                                    ? Icons.flight_takeoff
                                    : Icons.location_city,
                                color: item.isAirport
                                    ? Colors.deepOrange
                                    : AppColors.primaryBlue,
                              ),

                              const SizedBox(width: 14),

                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    const SizedBox(height: 2),

                                    Text(
                                      item.isAirport
                                          ? "${item.subtitle} • ${item.iataCode}"
                                          : item.subtitle,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    overlay.insert(_overlayEntry!);
  }

  double _getWidth() {
    final renderBox = context.findRenderObject() as RenderBox?;
    return renderBox?.size.width ?? 300;
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextField(
        controller: widget.controller,
        onChanged: _onChanged,
        decoration: InputDecoration(
          labelText: widget.label,
          errorText: widget.errorText,
          filled: true,
          fillColor: AppColors.scaffoldBg,
          prefixIcon: const Icon(Icons.location_on_outlined),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
