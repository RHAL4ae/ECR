import 'package:flutter/material.dart';
import '../../../models/car_model.dart';
import '../../screens/car_detail_screen.dart';

class CarCard extends StatelessWidget {
  final CarModel car;

  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CarDetailScreen(car: car),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  car.imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                car.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                car.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.attach_money, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    '${car.pricePerDay} ريال/يوم',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
