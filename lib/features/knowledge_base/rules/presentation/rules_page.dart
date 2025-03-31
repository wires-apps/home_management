import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/routes/router.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaint/bloc/complaint_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class RulesPage extends StatelessWidget {
  const RulesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ComplaintBloc>(),
      child: BlocBuilder<ComplaintBloc, ComplaintState>(
          buildWhen: (prev, curr) => prev.page != curr.page || prev.status != curr.status || prev.image != curr.image,
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColors.cE0DEDE,
              appBar: AppBar(
                title: const Text('Общие правила'),
              ),
              body: const _Body(),
            );
          }),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getValueForScreenType<double>(
          context: context,
          mobile: MediaQuery.of(context).size.width * 0.06,
          tablet: MediaQuery.of(context).size.width * 0.16,
          desktop: MediaQuery.of(context).size.height * 0.4,
        ),
        vertical: MediaQuery.of(context).size.width * 0.06,
      ),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const _UtilityBillItem();
        },
      ),
    );
  }
}

class _UtilityBillItem extends StatelessWidget {
  const _UtilityBillItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: TextButton(
        onPressed: () {
          context.pushRoute(
            const RulesDetailsRoute(),
          );
        },
        style: TextButton.styleFrom(
          side: const BorderSide(color: Colors.green),
          backgroundColor: AppColors.cF7F9F7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            bottom: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: AutoSizeText(
                  'Правила пользования пространства для колясок и велосипедов',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
