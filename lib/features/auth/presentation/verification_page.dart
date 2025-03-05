import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cE0DEDE,
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: AppColors.cE0DEDE,
        backgroundColor: AppColors.cE0DEDE,
        centerTitle: true,
        leading: const BackButtonAppBarWidget(),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

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
            ///TODO добавить обратный отсчет.
            const AutoSizeText(
              "Введите код из SMS",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Gap(16),
            Text(
              "Мы отправили код на ваш номер",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Gap(32),
            PinCodeTextField(
              appContext: context,
              length: 4,
              // controller: _pinController,
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
                selectedColor: AppColors.cA5BE76,
                inactiveColor: Colors.grey,
              ),
            ),
            Gap(MediaQuery.of(context).size.height * 0.1),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: AppColors.c05A84F,
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
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const AutoSizeText(
                'Подтвердить ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            )
            ///DOTO доделать обратный отсчет
            // _timerSeconds > 0
            //     ? Text("Запросить код повторно через $_timerSeconds сек.")
            //     : GestureDetector(
            //   onTap: () {
            //     _startTimer();
            //   },
            //   child: Text(
            //     "Отправить код повторно",
            //     style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
