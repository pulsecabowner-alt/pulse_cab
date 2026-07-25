import 'package:pulse_cab/core/model/car_model.dart';
import 'package:pulse_cab/core/model/route_model.dart';
import 'package:pulse_cab/core/services/firebase_service.dart';

class RouteRepository {
  final FirebaseService _firebaseService = FirebaseService();

  Future<List<RouteModel>> getRoutes() async {
    final snapshot = await _firebaseService.getRoutes();

    return snapshot.docs.map((doc) {
      return RouteModel.fromJson(doc.data(), doc.id);
    }).toList();
  }

  Future<List<CarModel>> getCars() async {
    return _firebaseService.getCars();
  }

  Future<CarModel?> getCar(String carId) async {
    return _firebaseService.getCar(carId);
  }
}
