import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/bloc/widgets/snackbar_listener.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/routes/router.dart';
import 'package:home_management/features/auth/bloc/verification/verify_cubit.dart';
import 'package:home_management/features/auth/models/sing_in_response_dto.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key, this.model});

  final SignInResponseDto? model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VerifyCubit>()
        ..addDevice()
        ..startTimer(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<VerifyCubit, VerifyState>(
            listener: (context, state) {
              if (state.needToGoHomeScreen) {
                AutoRouter.of(context).replace(const HomeRoute());
              }
            },
          ),
          CubitSnackBarListener<VerifyCubit>()
        ],
        child: Scaffold(
          backgroundColor: AppColors.cEDEDEC,
          appBar: AppBar(
            elevation: 0,
            surfaceTintColor: AppColors.cEDEDEC,
            backgroundColor: AppColors.cEDEDEC,
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: const _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyCubit, VerifyState>(
      buildWhen: (prev, curr) =>
          prev.status != curr.status || prev.counter != curr.counter || prev.canResend != curr.canResend,
      builder: (context, state) {
        final cubit = context.read<VerifyCubit>();
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
                mobile: MediaQuery.of(context).size.height * 0.04,
                tablet: MediaQuery.of(context).size.height * 0.02,
                desktop: 30,
              ),
            ),
            margin: EdgeInsets.symmetric(
                horizontal: getValueForScreenType<double>(
              context: context,
              mobile: MediaQuery.of(context).size.width * 0.046,
              tablet: MediaQuery.of(context).size.width * 0.26,
              desktop: MediaQuery.of(context).size.width * 0.36,
            )),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const AutoSizeText(
                  'Введите код из SMS',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.c0C3462,
                  ),
                ),
                const Gap(16),
                const Text(
                  'Мы отправили код на ваш номер',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const Gap(32),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  controller: cubit.pinController,
                  keyboardType: TextInputType.number,
                  // onChanged: _onPinChanged,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 56,
                    fieldWidth: 56,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.grey.shade200,
                    inactiveFillColor: Colors.grey.shade100,
                    activeColor: AppColors.c72A9E1,
                    selectedColor: AppColors.cA8DEFF,
                    inactiveColor: Colors.grey,
                  ),
                ),
                Gap(MediaQuery.of(context).size.height * 0.03),
                Text(
                  state.canResend ? "Можно отправить снова" : "Повторная отправка через ${state.counter} секунд",
                  style: const TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                const Gap(20),
                ElevatedButton(
                  onPressed: state.canResend ? () => context.read<VerifyCubit>().resendSms() : null,
                  child: Text(
                    'Отправить SMS снова',
                    style: TextStyle(
                      color: state.canResend ? AppColors.c0084EF : Colors.grey,
                    ),
                  ),
                ),
                const Gap(20),
                _VerificationButton(cubit: cubit),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VerificationButton extends StatelessWidget {
  const _VerificationButton({
    required this.cubit,
  });

  final VerifyCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyCubit, VerifyState>(
      buildWhen: (prev, curr) => prev.isButtonEnabled != curr.isButtonEnabled,
      builder: (context, state) {
        return TextButton(
          onPressed: state.isButtonEnabled ? () => cubit.logIn() : null,
          style: TextButton.styleFrom(
            backgroundColor: state.isButtonEnabled ? AppColors.c0084EF : AppColors.cE0DEDE,
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.016,
              horizontal: getValueForScreenType<double>(
                context: context,
                mobile: MediaQuery.of(context).size.width * 0.2,
                tablet: MediaQuery.of(context).size.width * 0.03,
                desktop: 30,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const AutoSizeText(
            'Подтвердить ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
        );
      },
    );
  }
}
