import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resturant_management/custom_widgets/primary_button.dart';
import 'package:resturant_management/modules/login/bloc/login_bloc.dart';
import 'package:resturant_management/navigation/routes.dart';
import 'package:resturant_management/theme/app_colors.dart';
import 'package:resturant_management/theme/font_consts.dart';
import 'package:resturant_management/theme/spacing.dart';

class LoginCardWidget extends StatefulWidget {
  const LoginCardWidget({super.key});

  @override
  State<LoginCardWidget> createState() => _LoginCardWidgetState();
}

class _LoginCardWidgetState extends State<LoginCardWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isHidden = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: AppColors.surface,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBoxSpacing.height10,
              _title(),
              SizedBoxSpacing.height20,
              _usernameField(),
              SizedBoxSpacing.height10,
              _passwordField(),
              SizedBoxSpacing.height18,
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return _button();
                },
              ),
              SizedBoxSpacing.height30,
            ],
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return const Text(
      "LOGIN",
      style: TextStyle(
        color: AppColors.accent,
        fontWeight: FontWeight.bold,
        fontSize: FontSize.size24,
      ),
    );
  }

  Widget _usernameField() {
    return TextField(
      controller: _usernameController,
      decoration: const InputDecoration(
        // // errorText: "Error",
        // errorText: null,
        // errorStyle: TextStyle(
        //   color: AppColors.errorColor,
        // ),
        // errorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     RadialDimensions.radius12,
        //   ),
        //   borderSide: BorderSide(
        //     color: AppColors.errorColor, // Border color when not focused
        //     width: 1,
        //   ),
        // ),
        labelText: 'User name',
        filled: true,
        // Enables background color
        fillColor: AppColors.background,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            RadialDimensions.radius12,
          ),
          borderSide: BorderSide(
            color: Colors.white, // Border color when not focused
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(RadialDimensions.radius12),
          borderSide: BorderSide(
            color: Colors.white, // Border color when not focused
            width: 1,
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
      obscureText: _isHidden,
      decoration: InputDecoration(
          labelText: 'Password',
          filled: true,
          // Enables background color
          fillColor: AppColors.background,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              RadialDimensions.radius12,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(RadialDimensions.radius12),
            borderSide: BorderSide(
              color: Colors.white, // Border color when not focused
              width: 1,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              _isHidden = !_isHidden;
              setState(() {});
            },
            child: Icon(
              _isHidden
                  ? Icons.remove_red_eye_rounded
                  : Icons.remove_red_eye_outlined,
            ),
          )),
    );
  }

  Widget _button() {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is ExceptionState) {
          Fluttertoast.showToast(msg: state.message);
          _usernameController.text = "";
          _passwordController.text = "";
        } else if (state is LoginSuccessState) {
          Navigator.of(context).pushReplacementNamed(Routes.dashboardRoute);
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            label: "Submit",
            isDisabled: false,
            isLoading: false,
            onPressed: () {
              BlocProvider.of<LoginBloc>(context).add(
                SubmitCredentials(
                  userName: _usernameController.text,
                  password: _passwordController.text,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
