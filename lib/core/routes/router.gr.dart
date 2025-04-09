// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AdvertisementPage]
class AdvertisementRoute extends PageRouteInfo<void> {
  const AdvertisementRoute({List<PageRouteInfo>? children})
    : super(AdvertisementRoute.name, initialChildren: children);

  static const String name = 'AdvertisementRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AdvertisementPage();
    },
  );
}

/// generated route for
/// [ArticleDetailsPage]
class ArticleDetailsRoute extends PageRouteInfo<ArticleDetailsRouteArgs> {
  ArticleDetailsRoute({
    Key? key,
    required int articleId,
    List<PageRouteInfo>? children,
  }) : super(
         ArticleDetailsRoute.name,
         args: ArticleDetailsRouteArgs(key: key, articleId: articleId),
         initialChildren: children,
       );

  static const String name = 'ArticleDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ArticleDetailsRouteArgs>();
      return ArticleDetailsPage(key: args.key, articleId: args.articleId);
    },
  );
}

class ArticleDetailsRouteArgs {
  const ArticleDetailsRouteArgs({this.key, required this.articleId});

  final Key? key;

  final int articleId;

  @override
  String toString() {
    return 'ArticleDetailsRouteArgs{key: $key, articleId: $articleId}';
  }
}

/// generated route for
/// [CallMasterPage]
class CallMasterRoute extends PageRouteInfo<void> {
  const CallMasterRoute({List<PageRouteInfo>? children})
    : super(CallMasterRoute.name, initialChildren: children);

  static const String name = 'CallMasterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CallMasterPage();
    },
  );
}

/// generated route for
/// [ComplaintDetailsPage]
class ComplaintDetailsRoute extends PageRouteInfo<ComplaintDetailsRouteArgs> {
  ComplaintDetailsRoute({
    Key? key,
    required ComplaintScreenType page,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
         ComplaintDetailsRoute.name,
         args: ComplaintDetailsRouteArgs(key: key, page: page, id: id),
         initialChildren: children,
       );

  static const String name = 'ComplaintDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ComplaintDetailsRouteArgs>();
      return ComplaintDetailsPage(key: args.key, page: args.page, id: args.id);
    },
  );
}

class ComplaintDetailsRouteArgs {
  const ComplaintDetailsRouteArgs({
    this.key,
    required this.page,
    required this.id,
  });

  final Key? key;

  final ComplaintScreenType page;

  final int id;

  @override
  String toString() {
    return 'ComplaintDetailsRouteArgs{key: $key, page: $page, id: $id}';
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
/// [KnowledgeBaseArticlesPage]
class KnowledgeBaseArticlesRoute
    extends PageRouteInfo<KnowledgeBaseArticlesRouteArgs> {
  KnowledgeBaseArticlesRoute({
    Key? key,
    required int categoryId,
    List<PageRouteInfo>? children,
  }) : super(
         KnowledgeBaseArticlesRoute.name,
         args: KnowledgeBaseArticlesRouteArgs(key: key, categoryId: categoryId),
         initialChildren: children,
       );

  static const String name = 'KnowledgeBaseArticlesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<KnowledgeBaseArticlesRouteArgs>();
      return KnowledgeBaseArticlesPage(
        key: args.key,
        categoryId: args.categoryId,
      );
    },
  );
}

class KnowledgeBaseArticlesRouteArgs {
  const KnowledgeBaseArticlesRouteArgs({this.key, required this.categoryId});

  final Key? key;

  final int categoryId;

  @override
  String toString() {
    return 'KnowledgeBaseArticlesRouteArgs{key: $key, categoryId: $categoryId}';
  }
}

/// generated route for
/// [KnowledgeBaseCategoriesPage]
class KnowledgeBaseCategoriesRoute extends PageRouteInfo<void> {
  const KnowledgeBaseCategoriesRoute({List<PageRouteInfo>? children})
    : super(KnowledgeBaseCategoriesRoute.name, initialChildren: children);

  static const String name = 'KnowledgeBaseCategoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const KnowledgeBaseCategoriesPage();
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
class NotificationRoute extends PageRouteInfo<NotificationRouteArgs> {
  NotificationRoute({Key? key, required int id, List<PageRouteInfo>? children})
    : super(
        NotificationRoute.name,
        args: NotificationRouteArgs(key: key, id: id),
        initialChildren: children,
      );

  static const String name = 'NotificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotificationRouteArgs>();
      return NotificationPage(key: args.key, id: args.id);
    },
  );
}

class NotificationRouteArgs {
  const NotificationRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'NotificationRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [RulesDetailsPage]
class RulesDetailsRoute extends PageRouteInfo<void> {
  const RulesDetailsRoute({List<PageRouteInfo>? children})
    : super(RulesDetailsRoute.name, initialChildren: children);

  static const String name = 'RulesDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RulesDetailsPage();
    },
  );
}

/// generated route for
/// [RulesPage]
class RulesRoute extends PageRouteInfo<void> {
  const RulesRoute({List<PageRouteInfo>? children})
    : super(RulesRoute.name, initialChildren: children);

  static const String name = 'RulesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RulesPage();
    },
  );
}

/// generated route for
/// [SingleUtilityBillsPage]
class SingleUtilityBillsRoute
    extends PageRouteInfo<SingleUtilityBillsRouteArgs> {
  SingleUtilityBillsRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
         SingleUtilityBillsRoute.name,
         args: SingleUtilityBillsRouteArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'SingleUtilityBillsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SingleUtilityBillsRouteArgs>();
      return SingleUtilityBillsPage(key: args.key, id: args.id);
    },
  );
}

class SingleUtilityBillsRouteArgs {
  const SingleUtilityBillsRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'SingleUtilityBillsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [SingleVotePage]
class SingleVoteRoute extends PageRouteInfo<SingleVoteRouteArgs> {
  SingleVoteRoute({Key? key, required int id, List<PageRouteInfo>? children})
    : super(
        SingleVoteRoute.name,
        args: SingleVoteRouteArgs(key: key, id: id),
        initialChildren: children,
      );

  static const String name = 'SingleVoteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SingleVoteRouteArgs>();
      return SingleVotePage(key: args.key, id: args.id);
    },
  );
}

class SingleVoteRouteArgs {
  const SingleVoteRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'SingleVoteRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [SuggestionPage]
class SuggestionRoute extends PageRouteInfo<void> {
  const SuggestionRoute({List<PageRouteInfo>? children})
    : super(SuggestionRoute.name, initialChildren: children);

  static const String name = 'SuggestionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SuggestionPage();
    },
  );
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

/// generated route for
/// [VotingPage]
class VotingRoute extends PageRouteInfo<void> {
  const VotingRoute({List<PageRouteInfo>? children})
    : super(VotingRoute.name, initialChildren: children);

  static const String name = 'VotingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const VotingPage();
    },
  );
}
