// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'إيجار السيارات إيغل';

  @override
  String get homeWelcome => 'مرحباً بكم في إيغل لإيجار السيارات';

  @override
  String get carsTitle => 'السيارات المتاحة';

  @override
  String get bookNow => 'احجز الآن';

  @override
  String get contactUs => 'اتصل بنا';

  @override
  String get pickupDate => 'تاريخ الاستلام';

  @override
  String get returnDate => 'تاريخ الإرجاع';

  @override
  String get submit => 'إرسال';
}
