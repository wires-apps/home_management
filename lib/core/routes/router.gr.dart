// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [ComplaintDetailsPage]
class ComplaintDetailsRoute extends PageRouteInfo<ComplaintDetailsRouteArgs> {
  ComplaintDetailsRoute({
    Key? key,
    required ComplaintScreenType page,
    List<PageRouteInfo>? children,
  }) : super(
         ComplaintDetailsRoute.name,
         args: ComplaintDetailsRouteArgs(key: key, page: page),
         initialChildren: children,
       );

  static const String name = 'ComplaintDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ComplaintDetailsRouteArgs>();
      return ComplaintDetailsPage(key: args.key, page: args.page);
    },
  );
}

class ComplaintDetailsRouteArgs {
  const ComplaintDetailsRouteArgs({this.key, required this.page});

  final Key? key;

  final ComplaintScreenType page;

  @override
  String toString() {
    return 'ComplaintDetailsRouteArgs{key: $key, page: $page}';
  }
}

/// generated route for
/// [ComplaintsPage]
class ComplaintsRoute extends PageRouteInfo<ComplaintsRouteArgs> {
  ComplaintsRoute({
    Key? key,
    required ComplaintScreenType page,
    List<PageRouteInfo>? children,
  }) : super(
         ComplaintsRoute.name,
         args: ComplaintsRouteArgs(key: key, page: page),
         initialChildren: children,
       );

  static const String name = 'ComplaintsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ComplaintsRouteArgs>();
      return ComplaintsPage(key: args.key, page: args.page);
    },
  );
}

class ComplaintsRouteArgs {
  const ComplaintsRouteArgs({this.key, required this.page});

  final Key? key;

  final ComplaintScreenType page;

  @override
  String toString() {
    return 'ComplaintsRouteArgs{key: $key, page: $page}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPage();
    },
  );
}

/// generated route for
/// [NewComplaintPage]
class NewComplaintRoute extends PageRouteInfo<NewComplaintRouteArgs> {
  NewComplaintRoute({
    Key? key,
    required ComplaintScreenType page,
    List<PageRouteInfo>? children,
  }) : super(
         NewComplaintRoute.name,
         args: NewComplaintRouteArgs(key: key, page: page),
         initialChildren: children,
       );

  static const String name = 'NewComplaintRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewComplaintRouteArgs>();
      return NewComplaintPage(key: args.key, page: args.page);
    },
  );
}

class NewComplaintRouteArgs {
  const NewComplaintRouteArgs({this.key, required this.page});

  final Key? key;

  final ComplaintScreenType page;

  @override
  String toString() {
    return 'NewComplaintRouteArgs{key: $key, page: $page}';
  }
}

/// generated route for
/// [NotificationPage]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
    : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationPage();
    },
  );
}

/// generated route for
/// [SuggestionPage]
class SuggestionRoute extends PageRouteInfo<SuggestionRouteArgs> {
  SuggestionRoute({
    Key? key,
    required ComplaintScreenType complaintScreenType,
    List<PageRouteInfo>? children,
  }) : super(
         SuggestionRoute.name,
         args: SuggestionRouteArgs(
           key: key,
           complaintScreenType: complaintScreenType,
         ),
         initialChildren: children,
       );

  static const String name = 'SuggestionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SuggestionRouteArgs>();
      return SuggestionPage(
        key: args.key,
        complaintScreenType: args.complaintScreenType,
      );
    },
  );
}

class SuggestionRouteArgs {
  const SuggestionRouteArgs({this.key, required this.complaintScreenType});

  final Key? key;

  final ComplaintScreenType complaintScreenType;

  @override
  String toString() {
    return 'SuggestionRouteArgs{key: $key, complaintScreenType: $complaintScreenType}';
  }
}

/// generated route for
/// [UtilityBillsPage]
class UtilityBillsRoute extends PageRouteInfo<void> {
  const UtilityBillsRoute({List<PageRouteInfo>? children})
    : super(UtilityBillsRoute.name, initialChildren: children);

  static const String name = 'UtilityBillsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UtilityBillsPage();
    },
  );
}

/// generated route for
/// [VerificationPage]
class VerificationRoute extends PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    Key? key,
    SignInResponseDto? model,
    List<PageRouteInfo>? children,
  }) : super(
         VerificationRoute.name,
         args: VerificationRouteArgs(key: key, model: model),
         initialChildren: children,
       );

  static const String name = 'VerificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerificationRouteArgs>(
        orElse: () => const VerificationRouteArgs(),
      );
      return VerificationPage(key: args.key, model: args.model);
    },
  );
}

class VerificationRouteArgs {
  const VerificationRouteArgs({this.key, this.model});

  final Key? key;

  final SignInResponseDto? model;

  @override
  String toString() {
    return 'VerificationRouteArgs{key: $key, model: $model}';
  }
}
