import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pulse_cab/core/model/car_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Get all routes
  Future<QuerySnapshot<Map<String, dynamic>>> getRoutes() async {
    return await _firestore.collection('routes').orderBy('fromLocation').get();
  }

  /// Get single route
  Future<DocumentSnapshot<Map<String, dynamic>>> getRoute(
    String routeId,
  ) async {
    return await _firestore.collection('routes').doc(routeId).get();
  }

  /// Get all cars
  Future<List<CarModel>> getCars() async {
    final snapshot = await _firestore
        .collection('cars')
        .where('status', isEqualTo: true)
        .get();

    return snapshot.docs.map((doc) {
      return CarModel.fromJson(doc.data(), doc.id);
    }).toList();
  }

  Future<CarModel?> getCar(String carId) async {
    print('Searching : $carId');

    final doc = await _firestore.collection('cars').doc(carId).get();

    print('Exists : ${doc.exists}');
    print(doc.data());

    if (!doc.exists) return null;

    return CarModel.fromJson(doc.data()!, doc.id);
  }
}
