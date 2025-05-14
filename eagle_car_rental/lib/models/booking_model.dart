class BookingModel {
  final String id;
  final String carId;
  final String userId;
  final DateTime pickupDate;
  final DateTime returnDate;
  final String status;
  final double totalAmount;

  BookingModel({
    required this.id,
    required this.carId,
    required this.userId,
    required this.pickupDate,
    required this.returnDate,
    required this.status,
    required this.totalAmount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'carId': carId,
      'userId': userId,
      'pickupDate': pickupDate.toIso8601String(),
      'returnDate': returnDate.toIso8601String(),
      'status': status,
      'totalAmount': totalAmount,
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      id: map['id'] as String,
      carId: map['carId'] as String,
      userId: map['userId'] as String,
      pickupDate: DateTime.parse(map['pickupDate'] as String),
      returnDate: DateTime.parse(map['returnDate'] as String),
      status: map['status'] as String,
      totalAmount: (map['totalAmount'] as num).toDouble(),
    );
  }
}
