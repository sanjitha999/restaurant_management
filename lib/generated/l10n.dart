// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Strings {
  Strings();

  static Strings? _current;

  static Strings get current {
    assert(_current != null,
        'No instance of Strings was loaded. Try to initialize the Strings delegate before accessing Strings.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Strings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Strings();
      Strings._current = instance;

      return instance;
    });
  }

  static Strings of(BuildContext context) {
    final instance = Strings.maybeOf(context);
    assert(instance != null,
        'No instance of Strings present in the widget tree. Did you add Strings.delegate in localizationsDelegates?');
    return instance!;
  }

  static Strings? maybeOf(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  /// `Hello World`
  String get title {
    return Intl.message(
      'Hello World',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to our app!`
  String get greeting {
    return Intl.message(
      'Welcome to our app!',
      name: 'greeting',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant Details`
  String get restaurantDetails {
    return Intl.message(
      'Restaurant Details',
      name: 'restaurantDetails',
      desc: '',
      args: [],
    );
  }

  /// `Fill in the below details accurately`
  String get fillInTheBelow {
    return Intl.message(
      'Fill in the below details accurately',
      name: 'fillInTheBelow',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant Name`
  String get restaurantNane {
    return Intl.message(
      'Restaurant Name',
      name: 'restaurantNane',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant Phone No.`
  String get restaurantPhoneNo {
    return Intl.message(
      'Restaurant Phone No.',
      name: 'restaurantPhoneNo',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Pin your location in the map`
  String get pickLocation {
    return Intl.message(
      'Pin your location in the map',
      name: 'pickLocation',
      desc: '',
      args: [],
    );
  }

  /// `Confirm location`
  String get confirmLocation {
    return Intl.message(
      'Confirm location',
      name: 'confirmLocation',
      desc: '',
      args: [],
    );
  }

  /// `Owner Details`
  String get ownerDetails {
    return Intl.message(
      'Owner Details',
      name: 'ownerDetails',
      desc: '',
      args: [],
    );
  }

  /// `Fill in the restaurant owner details accurately`
  String get fillInTheRestaurantOwnerDetails {
    return Intl.message(
      'Fill in the restaurant owner details accurately',
      name: 'fillInTheRestaurantOwnerDetails',
      desc: '',
      args: [],
    );
  }

  /// `Owner Name`
  String get ownerName {
    return Intl.message(
      'Owner Name',
      name: 'ownerName',
      desc: '',
      args: [],
    );
  }

  /// `Owner Phone No.`
  String get ownerPhoneNo {
    return Intl.message(
      'Owner Phone No.',
      name: 'ownerPhoneNo',
      desc: '',
      args: [],
    );
  }

  /// `Owner EmailID`
  String get ownerEmailId {
    return Intl.message(
      'Owner EmailID',
      name: 'ownerEmailId',
      desc: '',
      args: [],
    );
  }

  /// `Proceed`
  String get proceed {
    return Intl.message(
      'Proceed',
      name: 'proceed',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `License Upload`
  String get licenseTitle {
    return Intl.message(
      'License Upload',
      name: 'licenseTitle',
      desc: '',
      args: [],
    );
  }

  /// `Upload images of the below mentioned license`
  String get licenseDesc {
    return Intl.message(
      'Upload images of the below mentioned license',
      name: 'licenseDesc',
      desc: '',
      args: [],
    );
  }

  /// `Facilities and amenities`
  String get amenities {
    return Intl.message(
      'Facilities and amenities',
      name: 'amenities',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get overview {
    return Intl.message(
      'Overview',
      name: 'overview',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Strings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Strings> load(Locale locale) => Strings.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
