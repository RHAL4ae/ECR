import 'package:flutter/material.dart';
import '../../models/car_model.dart';
import '../widgets/car_card.dart';
import 'car_detail_screen.dart';

class CarListScreen extends StatelessWidget {
  final List<CarModel> cars = [
    CarModel(
      name: 'Sunny',
      manufacturer: 'Nissan',
      startYear: 2021,
      endYear: 2024,
      imageUrl: 'assets/images/nissan_sunny.jpg',
    ),
    CarModel(
      name: 'Corolla',
      manufacturer: 'Toyota',
      startYear: 2015,
      endYear: 2018,
      imageUrl: 'assets/images/toyota_corolla.jpg',
    ),
    CarModel(
      name: 'Pegas',
      manufacturer: 'Kia',
      startYear: 2024,
      imageUrl: 'assets/images/kia_pegas.jpg',
    ),
    CarModel(
      name: 'Yaris',
      manufacturer: 'Toyota',
      startYear: 2012,
      imageUrl: 'assets/images/toyota_yaris.jpg',
    ),
    CarModel(
      name: 'Seltos',
      manufacturer: 'Kia',
      startYear: 2024,
      imageUrl: 'assets/images/kia_seltos.jpg',
    ),
    CarModel(
      name: 'Sportage',
      manufacturer: 'Kia',
      startYear: 2024,
      imageUrl: 'assets/images/kia_sportage.jpg',
    ),
    CarModel(
      name: 'Carnival',
      manufacturer: 'Kia',
      startYear: 2024,
      imageUrl: 'assets/images/kia_carnival.jpg',
    ),
    CarModel(
      name: 'Sorento',
      manufacturer: 'Kia',
      startYear: 2024,
      imageUrl: 'assets/images/kia_sorento.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Catalog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: cars.length,
          itemBuilder: (context, index) {
            final car = cars[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarDetailScreen(car: car),
                  ),
                );
              },
              child: CarCard(car: car),
            );
          },
        ),
      ),
    );
  }
}
