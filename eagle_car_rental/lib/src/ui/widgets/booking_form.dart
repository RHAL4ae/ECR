import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import '../../../models/booking_model.dart';
import '../../../services/firestore_service.dart';
import 'package:provider/provider.dart';

class BookingForm extends StatefulWidget {
  const BookingForm({super.key});

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _pickupDate;
  DateTime? _returnDate;
  String? _name;
  String? _phone;
  String? _email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'الاسم الكامل',
              prefixIcon: const Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال الاسم';
              }
              return null;
            },
            onSaved: (value) => _name = value,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'رقم الهاتف',
              prefixIcon: const Icon(Icons.phone),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال رقم الهاتف';
              }
              return null;
            },
            onSaved: (value) => _phone = value,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'البريد الإلكتروني',
              prefixIcon: const Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال البريد الإلكتروني';
              }
              if (!value.contains('@')) {
                return 'الرجاء إدخال بريد إلكتروني صحيح';
              }
              return null;
            },
            onSaved: (value) => _email = value,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'تاريخ الاستلام',
                    prefixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                      locale: const Locale('ar', 'SA'),
                    );
                    if (picked != null && picked != _pickupDate) {
                      setState(() {
                        _pickupDate = picked;
                      });
                    }
                  },
                  readOnly: true,
                  controller: TextEditingController(
                    text: _pickupDate != null
                        ? DateFormat('yyyy/MM/dd').format(_pickupDate!)
                        : '',
                  ),
                  validator: (value) {
                    if (_pickupDate == null) {
                      return 'الرجاء اختيار تاريخ الاستلام';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'تاريخ الإرجاع',
                    prefixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onTap: () async {
                    if (_pickupDate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('الرجاء اختيار تاريخ الاستلام أولاً')),
                      );
                      return;
                    }
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _pickupDate!.add(const Duration(days: 1)),
                      firstDate: _pickupDate!.add(const Duration(days: 1)),
                      lastDate: _pickupDate!.add(const Duration(days: 365)),
                      locale: const Locale('ar', 'SA'),
                    );
                    if (picked != null && picked != _returnDate) {
                      setState(() {
                        _returnDate = picked;
                      });
                    }
                  },
                  readOnly: true,
                  controller: TextEditingController(
                    text: _returnDate != null
                        ? DateFormat('yyyy/MM/dd').format(_returnDate!)
                        : '',
                  ),
                  validator: (value) {
                    if (_returnDate == null) {
                      return 'الرجاء اختيار تاريخ الإرجاع';
                    }
                    if (_returnDate!.isBefore(_pickupDate!)) {
                      return 'تاريخ الإرجاع يجب أن يكون بعد تاريخ الاستلام';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                if (_pickupDate != null && _returnDate != null) {
                  final booking = BookingModel(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    carId: ModalRoute.of(context)!.settings.arguments as String,
                    userId: 'user_${DateTime.now().millisecondsSinceEpoch}',
                    pickupDate: _pickupDate!,
                    returnDate: _returnDate!,
                    status: 'pending',
                    totalAmount: calculateTotalAmount(_pickupDate!, _returnDate!),
                  );
                  
                  context.read<FirestoreService>().createBooking(booking);
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('تم حجز السيارة بنجاح')),
                  );
                  
                  Navigator.pop(context);
                }
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'تأكيد الحجز',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  double calculateTotalAmount(DateTime pickupDate, DateTime returnDate) {
    final difference = returnDate.difference(pickupDate).inDays;
    final car = ModalRoute.of(context)!.settings.arguments as CarModel;
    return difference * car.pricePerDay;
  }
}
