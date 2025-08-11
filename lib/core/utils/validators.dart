
class Validators {
  static final RegExp _emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
  );

  // Updated regex to support both Saudi and Egyptian formats
  static final RegExp _saudiPhoneRegex = RegExp(r'^((\+966|966|0)?5[0-9]{8})$');
  static final RegExp _egyptPhoneRegex = RegExp(r'^((\+20|20|0)?1[0-9]{9})$');

  static final RegExp _passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~`)\%\-(_+=\|}{\[/?,><.";\:|])[A-Za-z\d!@#\$&*~`)\%\-(_+=\|}{\[/?,><.";\:|]{8,}$',
  );

  static final RegExp _usernameRegex = RegExp(r'^[a-zA-Z0-9_]{3,20}$');

  static String? validateEmail(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    if (!_emailRegex.hasMatch(value)) {
      return errorMessage;
    }
    return null;
  }

  static String? validatePhone(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }

    // Remove all non-digit characters for validation
    final cleanedValue = value.replaceAll(RegExp(r'[^\d]'), '');

    // Check Saudi format
    if (_saudiPhoneRegex.hasMatch(cleanedValue) ||
        _saudiPhoneRegex.hasMatch(value)) {
      return null;
    }

    // Check Egyptian format
    if (_egyptPhoneRegex.hasMatch(cleanedValue) ||
        _egyptPhoneRegex.hasMatch(value)) {
      return null;
    }

    return errorMessage;
  }

  /// Validate international phone number format based on country
  static String? validateInternationalPhone(
    String? value,
    String errorMessage,
  ) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }

    // Comprehensive regex for Egypt and Saudi Arabia phone numbers
    // Egypt patterns:
    // - +201[0125][0-9]{8} (international format)
    // - 01[0125][0-9]{8} (local format)
    // - 00201[0125][0-9]{8} (international with 00)
    // Saudi Arabia patterns:
    // - (009665|9665|+9665|05|5)(5|0|3|6|4|9|1|8|7)[0-9]{7} (various formats)
    final regex = RegExp(
      r'^(\+201[0125][0-9]{8}|01[0125][0-9]{8}|00201[0125][0-9]{8}|(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)[0-9]{7})$',
    );

    // Clean the input but keep + and leading zeros for pattern matching
    final cleanedValue = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');

    if (regex.hasMatch(cleanedValue)) {
      return null; // Valid number
    }

    return errorMessage;
  }

  /// Validate phone number completeness based on country code
  static String? validatePhoneCompleteness(
    String? phoneNumber,
    String? countryCode,
    String errorMessage,
  ) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return errorMessage;
    }

    if (countryCode == null || countryCode.isEmpty) {
      return 'Please select a country';
    }

    // Remove all non-digit characters for length checking
    final cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

    switch (countryCode) {
      case '+966': // Saudi Arabia
        // Saudi mobile numbers: should be 9 digits (5XXXXXXXX)
        // or 10 digits with area code (05XXXXXXXX)
        if (cleanedNumber.length == 9 && cleanedNumber.startsWith('5')) {
          return null; // Valid
        } else if (cleanedNumber.length == 10 &&
            cleanedNumber.startsWith('05')) {
          return null; // Valid with area code
        } else {
          return 'Saudi phone number should be 9 digits starting with 5 (e.g., 512345678)';
        }

      case '+20': // Egypt
        // Egyptian mobile numbers: should be 10 digits (1XXXXXXXXX)
        // or 11 digits with area code (01XXXXXXXXX)
        if (cleanedNumber.length == 10 && cleanedNumber.startsWith('1')) {
          return null; // Valid
        } else if (cleanedNumber.length == 11 &&
            cleanedNumber.startsWith('01')) {
          return null; // Valid with area code
        } else {
          return 'Egyptian phone number should be 10 digits starting with 1 (e.g., 1012345678)';
        }

      default:
        return 'Unsupported country code';
    }
  }

  static String? validatePassword(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      return 'login.password_required';
    }
    if (!_passwordRegex.hasMatch(value)) {
      return 'login.password_invalid';
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    String? password,
    String errorMessage,
  ) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    if (value != password) {
      return errorMessage;
    }
    return null;
  }

  static String? validateUsername(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    if (!_usernameRegex.hasMatch(value)) {
      return errorMessage;
    }
    return null;
  }

  /// Validate phone number and country code together
  static String? validatePhoneWithCode(
    String? phoneNumber,
    String? countryCode,
    String errorMessage,
  ) {
    // Check if country code is provided
    if (countryCode == null || countryCode.isEmpty) {
      return 'Please select a country for your phone number';
    }

    // Check if phone number is provided
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return errorMessage;
    }

    // Validate completeness based on country
    return validatePhoneCompleteness(phoneNumber, countryCode, errorMessage);
  }

  static String? validateRequired(String? value, String errorMessage) {
    if (value == null || value.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }
}
