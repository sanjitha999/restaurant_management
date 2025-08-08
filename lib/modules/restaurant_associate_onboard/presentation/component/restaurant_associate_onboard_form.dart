import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_management/generated/l10n.dart';
import 'package:resturant_management/modules/restaurant_associate_onboard/bloc/restaurant_associate_onboard_bloc.dart';
import 'package:resturant_management/theme/spacing.dart';

class RestaurantAssociateOnboardForm extends StatefulWidget {
  const RestaurantAssociateOnboardForm({super.key});

  @override
  State<RestaurantAssociateOnboardForm> createState() =>
      _RestaurantAssociateOnboardFormState();
}

class _RestaurantAssociateOnboardFormState
    extends State<RestaurantAssociateOnboardForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  String? _selectedGender; // Default gender
  String? _selectedRole; // Default role
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _mobileFocus = FocusNode();
  final FocusNode _dateOfBirthFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNameField(),
          SizedBoxSpacing.height24,
          _buildPasswordField(),
          SizedBoxSpacing.height24,
          _buildFirstNameField(),
          SizedBoxSpacing.height24,
          _buildLastNameField(),
          SizedBoxSpacing.height24,
          _buildMobileField(),
          SizedBoxSpacing.height24,
          _buildGenderChips(),
          SizedBoxSpacing.height24,
          _buildDateOfBirthField(),
          SizedBoxSpacing.height24,
          _buildRoleDropdown(),
          SizedBoxSpacing.height24,
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      focusNode: _nameFocus,
      controller: _usernameController,
      decoration: InputDecoration(
        labelText: Strings.of(context).userName,
      ),
      onChanged: (name) {
        BlocProvider.of<RestaurantAssociateOnboardBloc>(context)
            .add(NameInput(Name: name));
      },
      onFieldSubmitted: (_) => _passwordFocus.requestFocus(),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      focusNode: _passwordFocus,
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: Strings.of(context).password,
      ),
      onChanged: (password) {
        BlocProvider.of<RestaurantAssociateOnboardBloc>(context)
            .add(PasswordInput(password: password));
      },
      onFieldSubmitted: (_) => _firstNameFocus.requestFocus(),
    );
  }

  Widget _buildFirstNameField() {
    return TextFormField(
      focusNode: _firstNameFocus,
      controller: _firstNameController,
      decoration: InputDecoration(
        labelText: Strings.of(context).firstName,
      ),
      onChanged: (firstName) {
        BlocProvider.of<RestaurantAssociateOnboardBloc>(context)
            .add(FirstNameInput(firstName: firstName));
      },
      onFieldSubmitted: (_) => _lastNameFocus.requestFocus(),
    );
  }

  Widget _buildLastNameField() {
    return TextFormField(
      focusNode: _lastNameFocus,
      controller: _lastNameController,
      decoration: InputDecoration(
        labelText: Strings.of(context).lastName,
      ),
      onChanged: (lastName) {
        BlocProvider.of<RestaurantAssociateOnboardBloc>(context)
            .add(LastNameInput(lastName: lastName));
      },
      onFieldSubmitted: (_) => _mobileFocus.requestFocus(),
    );
  }

  Widget _buildMobileField() {
    return TextFormField(
      focusNode: _mobileFocus,
      controller: _mobileController,
      decoration: InputDecoration(
        labelText: Strings.of(context).mobileNumber,
      ),
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      onChanged: (mobile) {
        BlocProvider.of<RestaurantAssociateOnboardBloc>(context)
            .add(MobileInput(mobile: mobile));
      },
      onFieldSubmitted: (_) => _dateOfBirthFocus.requestFocus(),
    );
  }

  Widget _buildRoleDropdown() {
    // final roles = ['Restaurant Manager', 'Restaurant Owner'];
    return BlocBuilder<RestaurantAssociateOnboardBloc,
        RestaurantAssociateOnboardState>(
      buildWhen: (previous, current) => current is RolesFetchedState,
      builder: (context, state) {
        if (state is RolesFetchedState) {
          var roles = state.roles;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.of(context).role,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBoxSpacing.height8,
              DropdownButtonFormField<String>(
                value: _selectedRole,
                items: roles.map((role) {
                  return DropdownMenuItem<String>(
                    value: role,
                    child: Text(role),
                  );
                }).toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: Strings.of(context).selectRole,
                ),
                onChanged: (role) {
                  setState(() {
                    _selectedRole = role;
                  });
                  BlocProvider.of<RestaurantAssociateOnboardBloc>(context)
                      .add(RoleInput(role: role!));
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.of(context)
                        .roleRequired; // Add this key to intl file
                  }
                  return null;
                },
              ),
            ],
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildGenderChips() {
    final genders = ['Female', 'Male', 'Other'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.of(context).gender,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBoxSpacing.height8,
        Wrap(
          spacing: 20,
          children: genders.map((gender) {
            return ChoiceChip(
              label: Text(gender),
              selected: _selectedGender == gender,
              onSelected: (isSelected) {
                if (isSelected) {
                  setState(() {
                    _selectedGender = gender;
                  });
                  BlocProvider.of<RestaurantAssociateOnboardBloc>(context)
                      .add(GenderInput(gender: gender));
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDateOfBirthField() {
    return TextFormField(
      controller: _dateOfBirthController,
      focusNode: _dateOfBirthFocus,
      readOnly: true,
      // Prevent manual input
      decoration: InputDecoration(
        labelText: Strings.of(context).dateOfBirth,
      ),
      onTap: () async {
        DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900), // Adjust as needed
          lastDate: DateTime.now(),
        );
        if (selectedDate != null) {
          // Format the date as dd/MM/yyyy and set it in the TextField
          final formattedDate =
              '${selectedDate.day.toString().padLeft(2, '0')}/'
              '${selectedDate.month.toString().padLeft(2, '0')}/'
              '${selectedDate.year}';
          _dateOfBirthController.text = formattedDate;

          // Notify the Bloc about the selected date
          BlocProvider.of<RestaurantAssociateOnboardBloc>(context)
              .add(DateOfBirthInput(dob: formattedDate));
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Strings.of(context)
              .dateOfBirthRequired; // Add this key to intl file
        }
        return null;
      },
    );
  }
}
