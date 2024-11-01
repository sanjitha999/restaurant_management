import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/generated/l10n.dart';
import 'package:resturant_management/modules/resturant_onboarding/bloc/restaurant_onboarding_bloc.dart';
import 'package:resturant_management/theme/spacing.dart';

class RestaurantOwnerForm extends StatefulWidget {
  const RestaurantOwnerForm({super.key});

  @override
  State<RestaurantOwnerForm> createState() => _RestaurantOwnerFormState();
}

class _RestaurantOwnerFormState extends State<RestaurantOwnerForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _nameController.text = BlocProvider.of<RestaurantOnboardingBloc>(context).ownerName ?? '';
    _phoneNoController.text = BlocProvider.of<RestaurantOnboardingBloc>(context).ownerNo ?? '';
    _emailController.text = BlocProvider.of<RestaurantOnboardingBloc>(context).ownerEmail ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNameField(),
          SizedBoxSpacing.height24,
          _buildPhoneField(),
          SizedBoxSpacing.height24,
          _buildEmailField(),
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      focusNode: _nameFocus,
      controller: _nameController,
      decoration: InputDecoration(
        labelText: Strings.of(context).ownerName,
      ),
      onChanged: (name) {
        BlocProvider.of<RestaurantOnboardingBloc>(context)
            .add(OwnerNameInput(name: name));
      },
      onFieldSubmitted: (name) {
        _phoneFocus.requestFocus();
      },
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
      focusNode: _phoneFocus,
      controller: _phoneNoController,
      onChanged: (number) {
        BlocProvider.of<RestaurantOnboardingBloc>(context)
            .add(OwnerNumberInput(number: number));
      },
      onFieldSubmitted: (number) {
        _emailFocus.requestFocus();
      },
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // Allow only digits
        LengthLimitingTextInputFormatter(10), // Limit to 10 digits
      ],
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: Strings.of(context).ownerPhoneNo,
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      focusNode: _emailFocus,
      controller: _emailController,
      onChanged: (emailId) {
        BlocProvider.of<RestaurantOnboardingBloc>(context)
            .add(OwnerEmailInput(emailId: emailId));
      },
      onFieldSubmitted: (emailId) {
        _emailFocus.unfocus();
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: Strings.of(context).ownerEmailId,
      ),
    );
  }
}
