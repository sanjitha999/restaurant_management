import 'package:resturant_management/utils/string_utils.dart';

extension StringExtension on String {
  // note: `this` refers to the current value
  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';

  String get allInCaps => toUpperCase();

  String get capitalizeFirstOfEach =>
      trimExtraSpace.split(" ").map((str) => str.inCaps).join(" ");

  String lastChars(int n) => length > 0 ? substring(length - n) : "";

  String get capitalizeFirstOnly {
    final String trimmedString = trimExtraSpace;
    return isNotEmpty
        ? trimmedString.substring(0, 1).toUpperCase() +
        trimmedString.substring(1)
        : '';
  }

  String get getSnakeCase {
    final exp = RegExp('(?<=[a-z])[A-Z]');
    return replaceAllMapped(exp, (m) => '_${m.group(0)}').toLowerCase();
  }

  /// Replace String with one space if it contain more than  one space.
  String get trimExtraSpace => replaceAll(RegExp(r"\s+"), ' ');

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  /// Return Upper case for frist character
  /// eg:- John Doe
  /// Output:- JD
  String get toUpperFirstChar {
    List<String> str = [];
    String name = '';
    if (isEmpty) return '';
    str = split(' ');
    str.removeWhere((element) => StringUtils.isNullOrEmpty(element));
    if (str.length >= 2 && str[0].isNotEmpty && str[1].isNotEmpty) {
      name = str[0].substring(0, 1).toUpperCase() +
          str[1].substring(0, 1).toUpperCase();
    } else if (str.isNotEmpty) {
      name = str[0].substring(0, 1).toUpperCase();
    }
    return name;
  }

  bool isGreater(String other) {
    return compareTo(other) == 1;
  }

  bool isEqual(String other) {
    return compareTo(other) == 0;
  }

  bool isLesser(String other) {
    return compareTo(other) == -1;
  }

  bool isGreaterOrEqual(String other) {
    return isGreater(other) || isEqual(other);
  }

  bool isLesserOrEqual(String other) {
    return isLesser(other) || isEqual(other);
  }

  bool toBoolean() {
    if (toLowerCase() == "true" || toLowerCase() == "1") {
      return true;
    } else if (toLowerCase() == "false" || toLowerCase() == "0") {
      return false;
    }
    return false;
  }

  String get groupIntoFours {
    final buffer = StringBuffer();
    for (int i = 0; i < length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(this[i]);
    }
    return buffer.toString().toUpperCase().replaceAll('X', '•');
  }
}