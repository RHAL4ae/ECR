import 'package:flutter/material.dart';
import '../../../models/car_model.dart';
import '../../widgets/car_card.dart';
import '../../widgets/booking_form.dart';

class CarDetailScreen extends StatelessWidget {
  final CarModel car;

  const CarDetailScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarCard(car: car),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'تفاصيل السيارة',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildDetailItem(
                    context,
                    Icons.car_rental,
                    'نوع السيارة',
                    car.type,
                  ),
                  _buildDetailItem(
                    context,
                    Icons.people,
                    'عدد المقاعد',
                    '${car.seats} مقعد',
                  ),
                  _buildDetailItem(
                    context,
                    Icons.directions_car,
                    'ناقل الحركة',
                    car.transmission,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'احجز الآن',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const BookingForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(BuildContext context, IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
