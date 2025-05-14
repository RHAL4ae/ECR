import 'package:flutter/foundation.dart';
import '../models/car.dart';

class BookingProvider with ChangeNotifier {
  Car? _selectedCar;
  DateTime? _startDate;
  DateTime? _endDate;
  String? _pickupLocation;
  String? _dropoffLocation;

  Car? get selectedCar => _selectedCar;
  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;
  String? get pickupLocation => _pickupLocation;
  String? get dropoffLocation => _dropoffLocation;

  void setSelectedCar(Car car) {
    _selectedCar = car;
    notifyListeners();
  }

  void setStartDate(DateTime date) {
    _startDate = date;
    notifyListeners();
  }

  void setEndDate(DateTime date) {
    _endDate = date;
    notifyListeners();
  }

  void setPickupLocation(String location) {
    _pickupLocation = location;
    notifyListeners();
  }

  void setDropoffLocation(String location) {
    _dropoffLocation = location;
    notifyListeners();
  }

  void clearBooking() {
    _selectedCar = null;
    _startDate = null;
    _endDate = null;
    _pickupLocation = null;
    _dropoffLocation = null;
    notifyListeners();
  }

  double calculateTotalPrice() {
    if (_startDate == null || _endDate == null || _selectedCar == null) {
      return 0.0;
    }

    final days = _endDate!.difference(_startDate!).inDays + 1;
    return _selectedCar!.pricePerDay * days;
  }
}
