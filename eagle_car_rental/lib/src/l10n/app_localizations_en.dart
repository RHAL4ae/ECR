// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Eagle Car Rental';

  @override
  String get homeWelcome => 'Welcome to Eagle Car Rental';

  @override
  String get carsTitle => 'Available Cars';

  @override
  String get bookNow => 'Book Now';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get pickupDate => 'Pickup Date';

  @override
  String get returnDate => 'Return Date';

  @override
  String get submit => 'Submit';
}
