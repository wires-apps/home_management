import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/widgets/error_dialog.dart';
import 'package:home_management/core/widgets/snackbar/info_snackbar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../base_cubit.dart';

class BlocSnackBarListenerWithChild<B extends BaseBloc> extends StatelessWidget {
  const BlocSnackBarListenerWithChild({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, BaseState>(
      listener: (context, state) {
        final dialogInfo = state.dialogInfo;
        if (dialogInfo == null) return;
        showDialog(
          context: context,
          builder: (context) => ErrorDialog(
            title: dialogInfo.message,
          ),
        );
      },
      child: child,
    );
  }
}

class BlocSnackBarListener<B extends BaseBloc> extends BlocListener<B, BaseState> {
  BlocSnackBarListener({super.key})
      : super(
          listenWhen: (prev, curr) => prev.dialogInfo != curr.dialogInfo && curr.dialogInfo != null,
          listener: (context, state) {
            final dialogInfo = state.dialogInfo;
            if (dialogInfo == null) return;
            showDialog(
              context: context,
              builder: (context) => ErrorDialog(
                title: dialogInfo.message,
              ),
            );
          },
        );
}

class CubitSnackBarListenerWithChild<B extends BaseCubit> extends StatelessWidget {
  const CubitSnackBarListenerWithChild({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, BaseState>(
      listener: (context, state) {
        final dialogInfo = state.dialogInfo;
        if (dialogInfo == null) return;
        showDialog(
          context: context,
          builder: (context) => ErrorDialog(
            title: dialogInfo.message,
          ),
        );
      },
      child: child,
    );
  }
}

class CubitSnackBarListener<B extends BaseCubit> extends BlocListener<B, BaseState> {
  CubitSnackBarListener({super.key})
      : super(
          listenWhen: (prev, curr) => prev.dialogInfo != curr.dialogInfo && curr.dialogInfo != null,
          listener: (context, state) {
            final dialogInfo = state.dialogInfo;
            if (dialogInfo == null) return;
            showDialog(
              context: context,
              builder: (context) => ErrorDialog(
                title: dialogInfo.message,
              ),
            );
          },
        );
}

class BlocSuccessSnackBarListener<B extends BaseBloc> extends BlocListener<B, BaseState> {
  BlocSuccessSnackBarListener({super.key})
      : super(
          listenWhen: (prev, curr) => prev.dialogInfo != curr.dialogInfo && curr.dialogInfo != null,
          listener: (context, state) {
            final dialogInfo = state.dialogInfo;
            if (dialogInfo == null) return;
            showTopSnackBar(
              Overlay.of(context),
              InfoSnackbar(
                title: dialogInfo.title,
                message: dialogInfo.message,
              ),
            );
          },
        );
}

class BlocSuccessSnackBarListenerWithChild<B extends BaseBloc> extends StatelessWidget {
  const BlocSuccessSnackBarListenerWithChild({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, BaseState>(
      listener: (context, state) {
        final dialogInfo = state.dialogInfo;
        if (dialogInfo == null) return;
        showTopSnackBar(
            Overlay.of(context),
            InfoSnackbar(
              title: dialogInfo.title,
              message: dialogInfo.message,
            ));
      },
      child: child,
    );
  }
}
