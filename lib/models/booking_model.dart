class BookingModel {
  final String fullName;
  final String phoneNumber;
  final String email;
  final DateTime pickupDate;
  final DateTime returnDate;
  final String notes;
  final String? id;
  final DateTime? createdAt;

  BookingModel({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.pickupDate,
    required this.returnDate,
    required this.notes,
    this.id,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'pickupDate': pickupDate.toIso8601String(),
      'returnDate': returnDate.toIso8601String(),
      'notes': notes,
      'createdAt': createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> map, [String? id]) {
    return BookingModel(
      id: id,
      fullName: map['fullName'] as String,
      phoneNumber: map['phoneNumber'] as String,
      email: map['email'] as String,
      pickupDate: DateTime.parse(map['pickupDate']),
      returnDate: DateTime.parse(map['returnDate']),
      createdAt: DateTime.parse(map['createdAt']),
      notes: map['notes'] as String,
    );
  }
}
