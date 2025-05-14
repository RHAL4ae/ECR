import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/booking_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createBooking(BookingModel booking) async {
    try {
      final bookingData = booking.toMap();
      await _firestore.collection('bookings').add(bookingData);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BookingModel>> getBookings() async {
    try {
      final snapshot = await _firestore.collection('bookings').orderBy('createdAt', descending: true).get();
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['pickupDate'] = DateTime.parse(data['pickupDate']);
        data['returnDate'] = DateTime.parse(data['returnDate']);
        data['createdAt'] = DateTime.parse(data['createdAt']);
        return BookingModel.fromMap(data, doc.id);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }
}
