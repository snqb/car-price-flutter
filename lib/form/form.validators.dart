import 'messages.dart';

class FormValidators {
  static String validateYear(dynamic inputValue) {
    final year = int.tryParse(inputValue) ?? 0;
    return !(year > 1960 && year <= DateTime.now().year) ? INVALID_YEAR : null;
  }

  static String validateMileage(dynamic inputValue) {
    final mileage = int.tryParse(inputValue) ?? 0;
    return !(mileage > 0 && mileage < 800000) ? INVALID_MILEAGE : null;
  }

  static String validateCapacity(dynamic inputValue) {
    final capacity = int.tryParse(inputValue) ?? 0;
    return !(capacity > 0.5 && capacity < 6.5) ? INVALID_CAPACITY : null;
  }
}

final formValidators = FormValidators();
