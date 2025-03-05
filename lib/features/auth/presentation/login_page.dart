import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/routes/router.dart';
import 'package:home_management/core/validators/validator_utils.dart';
import 'package:home_management/core/widgets/buttons/login_button.dart';
import 'package:home_management/core/widgets/text_form_field.dart';
import 'package:home_management/features/auth/bloc/auth_bloc.dart';
import 'package:home_management/generated/l10n.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.cE0DEDE,
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
            mobile: MediaQuery.of(context).size.width * 0.06,
            tablet: MediaQuery.of(context).size.width * 0.02,
            desktop: MediaQuery.of(context).size.height * 0.03,
          ),
          vertical: getValueForScreenType<double>(
            context: context,
            mobile: MediaQuery.of(context).size.height * 0.03,
            tablet: MediaQuery.of(context).size.height * 0.02,
            desktop: 30,
          ),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: getValueForScreenType<double>(
          context: context,
          mobile: MediaQuery.of(context).size.width * 0.036,
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
            AutoSizeText(
              S.current.login_screen_login_in_acc,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: AppColors.c224795,
              ),
            ),
            const Gap(40),
            const _EmailTextField(),
            const Gap(16),
            const _PasswordTextField(),
            const Gap(16),
            const _PhoneTextField(),
            const _ForgetPasswordButton(),
            const Gap(50),
            LogInButton(
              onPressed: () {
                context.pushRoute(const VerificationRoute());

                // context.read<AuthBloc>().add(LoginValidateField());
              },
              title: S.of(context).login_screen_login_in_title,
            )
          ],
        ),
      ),
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

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

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return InputTextField(
          onChanged: (email) => bloc.add(LoginPasswordChanged()),
          controller: bloc.passwordController,
          hintText: S.of(context).login_screen_password,
          errorText: state.needCheckCorrectPassword
              ? ValidatorUtils.validateCredentials(bloc.passwordController.text, needCheckPhone: false)
              : null,
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

class _PhoneTextField extends StatelessWidget {
  const _PhoneTextField();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return InputTextField(
          onChanged: (email) => bloc.add(LoginPasswordChanged()),
          controller: bloc.phoneController,
          inputFormatters: [bloc.maskFormatter],
          hintText: S.of(context).login_screen_phone,
          textInputType: TextInputType.number,
          errorText: state.needCheckCorrectPassword
              ? ValidatorUtils.validateCredentials(
                  bloc.phoneController.text,
                  needCheckPhone: true,
                )
              : null,
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}

class _ForgetPasswordButton extends StatelessWidget {
  const _ForgetPasswordButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getValueForScreenType<double>(
          context: context,
          mobile: MediaQuery.of(context).size.width * 0.36,
          tablet: 0,
          desktop: 0,
        ),
      ),
      //MediaQuery.of(context).size.width * 0.42
      child: TextButton(
        onPressed: () {
          context.pushRoute(const HomeRoute());
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
