class Car {
  final String id;
  final String model;
  final int year;
  final bool isAutomatic;
  final double pricePerDay;
  final List<String> images;
  final String description;
  final int seats;
  final String transmission;
  final String fuelType;
  final String category;

  Car({
    required this.id,
    required this.model,
    required this.year,
    required this.isAutomatic,
    required this.pricePerDay,
    required this.images,
    required this.description,
    required this.seats,
    required this.transmission,
    required this.fuelType,
    required this.category,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      model: json['model'],
      year: json['year'],
      isAutomatic: json['isAutomatic'],
      pricePerDay: json['pricePerDay'].toDouble(),
      images: List<String>.from(json['images']),
      description: json['description'],
      seats: json['seats'],
      transmission: json['transmission'],
      fuelType: json['fuelType'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'model': model,
      'year': year,
      'isAutomatic': isAutomatic,
      'pricePerDay': pricePerDay,
      'images': images,
      'description': description,
      'seats': seats,
      'transmission': transmission,
      'fuelType': fuelType,
      'category': category,
    };
  }
}
