class CarModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double pricePerDay;
  final String type;
  final int seats;
  final String transmission;
  final bool isAvailable;

  CarModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.pricePerDay,
    required this.type,
    required this.seats,
    required this.transmission,
    required this.isAvailable,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'pricePerDay': pricePerDay,
      'type': type,
      'seats': seats,
      'transmission': transmission,
      'isAvailable': isAvailable,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
      pricePerDay: (map['pricePerDay'] as num).toDouble(),
      type: map['type'] as String,
      seats: map['seats'] as int,
      transmission: map['transmission'] as String,
      isAvailable: map['isAvailable'] as bool,
    );
  }
}
