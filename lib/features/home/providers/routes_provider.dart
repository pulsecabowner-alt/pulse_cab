import 'package:flutter/material.dart';
import 'package:pulse_cab/core/model/route_model.dart';
import 'package:pulse_cab/core/repositories/route_repository.dart';

class RoutesProvider extends ChangeNotifier {
  final RouteRepository _repository = RouteRepository();

  List<RouteModel> _routes = [];
  bool _isLoading = false;
  String? _error;

  List<RouteModel> get routes => _routes;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadRoutes() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _routes = await _repository.getRoutes();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    await loadRoutes();
  }

  RouteModel? getRouteById(String id) {
    try {
      return _routes.firstWhere((route) => route.id == id);
    } catch (_) {
      return null;
    }
  }

  List<RouteModel> searchRoutes(String keyword) {
    if (keyword.trim().isEmpty) return _routes;

    final query = keyword.toLowerCase();

    return _routes.where((route) {
      return route.fromLocation.toLowerCase().contains(query) ||
          route.toLocation.toLowerCase().contains(query);
    }).toList();
  }
}
