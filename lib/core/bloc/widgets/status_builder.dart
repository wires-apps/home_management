import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';

import '../base_cubit.dart';

class BlocStatusBuilder<B extends BaseBloc> extends StatelessWidget {
  const BlocStatusBuilder.emptyWhenLoading({required Widget child, super.key})
      : success = child,
        loading = const SizedBox(),
        failure = child;

  const BlocStatusBuilder.loadingAndDefault({
    required Widget child,
    required this.loading,
    super.key,
  })  : success = child,
        failure = child;

  const BlocStatusBuilder.defaultLoading({
    required Widget child,
    super.key,
  })  : success = child,
        failure = child,
        loading = const Center(child: CircularProgressIndicator());

  const BlocStatusBuilder.all({
    required this.success,
    required this.loading,
    required this.failure,
    super.key,
  });

  final Widget success;
  final Widget loading;
  final Widget failure;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, BaseState>(
        buildWhen: (prev, curr) => prev.status != curr.status,
        builder: (context, state) {
          switch (state.status) {
            case BaseStatus.success:
              return success;
            case BaseStatus.loading:
              return loading;
            case BaseStatus.failure:
              return failure;
          }
        });
  }
}

class CubitStatusBuilder<B extends BaseCubit> extends StatelessWidget {
  const CubitStatusBuilder.emptyWhenLoading({required Widget child, super.key})
      : success = child,
        loading = const SizedBox(),
        failure = child;

  const CubitStatusBuilder.loadingAndDefault({
    required Widget child,
    required this.loading,
    super.key,
  })  : success = child,
        failure = child;

  const CubitStatusBuilder.defaultLoading({
    required Widget child,
    super.key,
  })  : success = child,
        failure = child,
        loading = const Center(child: CircularProgressIndicator());

  const CubitStatusBuilder.all({
    required this.success,
    required this.loading,
    required this.failure,
    super.key,
  });

  final Widget success;
  final Widget loading;
  final Widget failure;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, BaseState>(
        buildWhen: (prev, curr) => prev.status != curr.status,
        builder: (context, state) {
          switch (state.status) {
            case BaseStatus.success:
              return success;
            case BaseStatus.loading:
              return loading;
            case BaseStatus.failure:
              return failure;
          }
        });
  }
}
