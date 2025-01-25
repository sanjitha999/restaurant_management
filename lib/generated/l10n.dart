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

  /// `Fill in the menu details`
  String get fillInTheMenuDetails {
    return Intl.message(
      'Fill in the menu details',
      name: 'fillInTheMenuDetails',
      desc: '',
      args: [],
    );
  }

  /// `Menu Item Name`
  String get menuItemName {
    return Intl.message(
      'Menu Item Name',
      name: 'menuItemName',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Ingredients`
  String get ingredients {
    return Intl.message(
      'Ingredients',
      name: 'ingredients',
      desc: '',
      args: [],
    );
  }

  /// `Menu Type`
  String get menuType {
    return Intl.message(
      'Menu Type',
      name: 'menuType',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Subcategory`
  String get subcategory {
    return Intl.message(
      'Subcategory',
      name: 'subcategory',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Item type`
  String get itemType {
    return Intl.message(
      'Item type',
      name: 'itemType',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get userName {
    return Intl.message(
      'User Name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get adminName {
    return Intl.message(
      'Name',
      name: 'adminName',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth is required`
  String get dateOfBirthRequired {
    return Intl.message(
      'Date of birth is required',
      name: 'dateOfBirthRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid date in dd/mm/yy format`
  String get invalidDateOfBirth {
    return Intl.message(
      'Enter a valid date in dd/mm/yy format',
      name: 'invalidDateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Role`
  String get role {
    return Intl.message(
      'Role',
      name: 'role',
      desc: '',
      args: [],
    );
  }

  /// `Select Role`
  String get selectRole {
    return Intl.message(
      'Select Role',
      name: 'selectRole',
      desc: '',
      args: [],
    );
  }

  /// `Please select a role`
  String get roleRequired {
    return Intl.message(
      'Please select a role',
      name: 'roleRequired',
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
