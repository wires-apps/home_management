import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/validators/validator_utils.dart';
import 'package:home_management/core/widgets/text_form_field.dart';
import 'package:home_management/feature/auth/bloc/auth_bloc.dart';
import 'package:home_management/generated/l10n.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.cE9F0E8,
      resizeToAvoidBottomInset: false,
      body: _LoginBody(),
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getValueForScreenType<double>(
            context: context,
            mobile: 30,
            tablet: MediaQuery.of(context).size.height * 0.02,
            desktop: MediaQuery.of(context).size.height * 0.03,
          ),
          vertical: getValueForScreenType<double>(
            context: context,
            mobile: MediaQuery.of(context).size.height * 0.02,
            tablet: MediaQuery.of(context).size.height * 0.02,
            desktop: 30,
          ),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: getValueForScreenType<double>(
          context: context,
          mobile: 30,
          tablet: MediaQuery.of(context).size.width * 0.26,
          desktop: MediaQuery.of(context).size.width * 0.36,
        )),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.current.login_screen_login_in_acc,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Gap(40),
            TextFieldEmail(),
            Gap(16),
            TextFieldPassword(),
            ForgetPasswordButton(),
            Gap(50),
            LogInButton()
          ],
        ),
      ),
    );
  }
}

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return InputTextField(
          onChanged: (email) => bloc.add(LoginEmailChanged()),
          controller: bloc.emailController,
          hintText: S.of(context).login_screen_email,
          errorText: state.needCheckEmail ? ValidatorUtils.validateEmail(bloc.emailController.text) : null,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return InputTextField(
          onChanged: (email) => bloc.add(LoginPasswordChanged()),
          controller: bloc.passwordController,
          hintText: S.of(context).login_screen_password,
          errorText:
              state.needCheckCorrectPassword ? ValidatorUtils.validatePassword(bloc.passwordController.text) : null,
          textInputAction: TextInputAction.done,
          obscureText: state.isObscured,
          suffixIconButton: IconButton(
            icon: Icon(state.isObscured ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              context.read<AuthBloc>().add(LoginTogglePasswordVisibility());
            },
          ),
        );
      },
    );
  }
}

class LogInButton extends StatelessWidget {
  const LogInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<AuthBloc>().add(LoginValidateField());
      },
      style: TextButton.styleFrom(
        backgroundColor: AppColors.c047839,
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.016,
          horizontal: getValueForScreenType<double>(
            context: context,
            mobile: MediaQuery.of(context).size.width * 0.3,
            tablet: MediaQuery.of(context).size.height * 0.03,
            desktop: 30,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        S.of(context).login_screen_login_in_title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getValueForScreenType<double>(
          context: context,
          mobile: MediaQuery.of(context).size.width * 0.3,
          tablet: 0,
          desktop: 0,
        ),
      ),
      //MediaQuery.of(context).size.width * 0.42
      child: TextButton(
        onPressed: () {
          context.read<AuthBloc>().add(LoginValidateField());
        },
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          overlayColor: Colors.green.shade100,
        ),
        child: Text(
          S.of(context).login_screen_forget_password,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 14,
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}
