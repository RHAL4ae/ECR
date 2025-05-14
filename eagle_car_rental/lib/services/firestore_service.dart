import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/car_model.dart';
import '../models/booking_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Cars collection reference
  CollectionReference get carsCollection => _firestore.collection('cars');
  
  // Bookings collection reference
  CollectionReference get bookingsCollection => _firestore.collection('bookings');

  // Get all available cars
  Stream<List<CarModel>> getAllAvailableCars() {
    return carsCollection
        .where('isAvailable', isEqualTo: true)
        .snapshots()
        .map((snapshot) => 
            snapshot.docs.map((doc) => CarModel.fromMap(doc.data())).toList());
  }

  // Get car by ID
  Future<CarModel?> getCarById(String carId) async {
    final doc = await carsCollection.doc(carId).get();
    if (doc.exists) {
      return CarModel.fromMap(doc.data()!);
    }
    return null;
  }

  // Create booking
  Future<void> createBooking(BookingModel booking) async {
    await bookingsCollection.doc(booking.id).set(booking.toMap());
    // Update car availability
    await carsCollection.doc(booking.carId).update({
      'isAvailable': false,
    });
  }

  // Update booking status
  Future<void> updateBookingStatus(String bookingId, String status) async {
    await bookingsCollection.doc(bookingId).update({
      'status': status,
    });
    // If status is completed, make car available again
    if (status == 'completed') {
      final booking = await bookingsCollection.doc(bookingId).get();
      await carsCollection.doc(booking['carId']).update({
        'isAvailable': true,
      });
    }
  }

  // Get user's bookings
  Stream<List<BookingModel>> getUserBookings(String userId) {
    return bookingsCollection
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) => 
            snapshot.docs.map((doc) => BookingModel.fromMap(doc.data())).toList());
  }
}
