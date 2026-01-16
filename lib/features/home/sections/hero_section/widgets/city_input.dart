import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/data/cities.dart';

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
  List<String> _suggestions = [];

  static const double _itemHeight = 48;
  static const double _maxHeight = 240;

  void _onChanged(String value) {
    if (!mounted) return;

    if (value.isEmpty) {
      _removeOverlay();
      return;
    }

    _suggestions = indianCities
        .where((city) => city.toLowerCase().contains(value.toLowerCase()))
        .toList();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _suggestions.isNotEmpty) {
        _showOverlay();
      }
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
      builder: (context) {
        return Stack(
          children: [
            // 🔹 Outside tap detector
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: _removeOverlay,
              ),
            ),

            // 🔹 Dropdown
            CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: const Offset(0, 58),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: _getWidth(),
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: _suggestions.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final city = _suggestions[index];

                      return InkWell(
                        onTap: () {
                          widget.controller.text = city;
                          _removeOverlay();
                        },
                        child: SizedBox(
                          height: _itemHeight,
                          child: Row(
                            children: [
                              const SizedBox(width: 12),

                              // 📍 Leading icon
                              const Icon(
                                Icons.location_city,
                                size: 18,
                                color: AppColors.primaryBlue,
                              ),

                              const SizedBox(width: 12),

                              // City name
                              Expanded(
                                child: Text(
                                  city,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              // ➜ Trailing icon
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: Colors.grey,
                              ),

                              const SizedBox(width: 12),
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
