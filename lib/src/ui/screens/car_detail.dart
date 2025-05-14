import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../models/car.dart';
import '../../providers/booking_provider.dart';
import '../booking_form_screen.dart';

class CarDetailScreen extends StatelessWidget {
  final Car car;

  const CarDetailScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.model),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Carousel
            SizedBox(
              height: 300,
              child: CarouselSlider(
                items: car.images.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
              ),
            ),

            // Specifications
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.model,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildSpecItem(
                        context,
                        icon: Icons.calendar_today,
                        label: AppLocalizations.of(context)!.year,
                        value: car.year.toString(),
                      ),
                      const SizedBox(width: 16),
                      _buildSpecItem(
                        context,
                        icon: Icons.directions_car,
                        label: AppLocalizations.of(context)!.transmission,
                        value: car.isAutomatic
                            ? AppLocalizations.of(context)!.automatic
                            : AppLocalizations.of(context)!.manual,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildSpecItem(
                        context,
                        icon: Icons.attach_money,
                        label: AppLocalizations.of(context)!.pricePerDay,
                        value: '${car.pricePerDay} ${AppLocalizations.of(context)!.currency}',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Book Now Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<BookingProvider>().setSelectedCar(car);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookingFormScreen(),
                      ),
                    );
                  },
                  child: Text(AppLocalizations.of(context)!.bookNow),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
