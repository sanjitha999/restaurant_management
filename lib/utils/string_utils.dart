import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StringUtils {
  static bool isNullOrEmpty(String? str) {
    return str == null || str.isEmpty;
  }
}

String currencyFormatWithSpace(dynamic value) {
  final currencyFormatter =
      NumberFormat.currency(locale: 'HI', symbol: "", decimalDigits: 0);
  return "₹ ${currencyFormatter.format(value)}";
}

String convertToTitleCase(String input) {
  final buffer = StringBuffer();
  for (int i = 0; i < input.length; i++) {
    if (i > 0 && input[i].toUpperCase() == input[i] && input[i] != ' ') {
      buffer.write(' '); // Add space before uppercase letters
    }
    buffer.write(i == 0 ? input[i].toUpperCase() : input[i]);
  }
  return buffer.toString();
}

String convertDateFormat(String date) {
  try {
    // Parse the input date string (format: DD/MM/YYYY)
    final inputFormat = RegExp(r'^(\d{2})/(\d{2})/(\d{4})$');
    final match = inputFormat.firstMatch(date);

    if (match != null) {
      final day = match.group(1)!;
      final month = match.group(2)!;
      final year = match.group(3)!;

      // Return the date in YYYY-DD-MM format
      return '$year-$day-$month';
    } else {
      throw FormatException('Invalid date format');
    }
  } catch (e) {
    // Handle invalid input gracefully
    debugPrint('Error converting date: $e');
    return '';
  }
}

