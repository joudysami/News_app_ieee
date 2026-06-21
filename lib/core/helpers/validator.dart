class AppValidators {
  static String? NameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
      return 'Please enter a valid name';
    }

    return null;
  }

  static String? EmailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

    if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }

    return null;
  }

  static String? PasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    final RegExp passwordRegExp = RegExp(r'^(?=.*[A-Z]).{8,}$');

    if (!passwordRegExp.hasMatch(value)) {
      return 'Password must be 8+ chars and 1 uppercase letter';
    }

    return null;
  }

  static String? ConfirmPasswordValidator(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }
}
