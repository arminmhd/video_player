extension StringExtension on String {
  bool get isEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  bool get isPasswordValid {
    return length >= 6;
  }

  String get capitalize {
    if (isEmpty) return this;

    return this[0].toUpperCase() + substring(1);
  }
}
