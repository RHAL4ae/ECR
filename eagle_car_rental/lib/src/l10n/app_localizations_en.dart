// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get bookingFormTitle => 'Booking Form';

  @override
  String get fullNameLabel => 'Full Name';

  @override
  String get phoneLabel => 'Phone Number';

  @override
  String get emailLabel => 'Email';

  @override
  String get notesLabel => 'Any Notes';

  @override
  String get successMessage => 'Booking submitted successfully!';

  @override
  String get requiredField => 'This field is required';

  @override
  String get validEmail => 'Please enter a valid email address';

  @override
  String get selectDate => 'Select Date';

  @override
  String get errorSubmitting => 'Error submitting booking';

  @override
  String get close => 'Close';

  @override
  String get ok => 'OK';
}
