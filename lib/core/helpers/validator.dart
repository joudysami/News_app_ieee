class AppValidators {
  static EmailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (value.isNotEmpty && RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return null;
    } else {
      return 'Please enter a valid email';
    }
  }

  static PasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    final RegExp passwordRegExp = RegExp(r'^(?=.*[A-Z]).{8,}$');

    if (!passwordRegExp.hasMatch(value)) {
      return 'Password must be 8 characters and 1 upper letter';
    }
  }
}
