import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_management/core/common/models/complaint_screen_type.dart';
import 'package:home_management/features/activity/presentation/advertisement_page.dart';
import 'package:home_management/features/activity/voting/presentation/single/single_poll_page.dart';
import 'package:home_management/features/activity/voting/presentation/voting_page.dart';
import 'package:home_management/features/activity/presentation/voting_page.dart';
import 'package:home_management/features/announcements/presentation/announcement_details_page.dart';
import 'package:home_management/features/announcements/presentation/announcements_page.dart';
import 'package:home_management/features/announcements/presentation/new_announcement_page.dart';
import 'package:home_management/features/auth/models/sing_in_response_dto.dart';
import 'package:home_management/features/auth/presentation/login_page.dart';
import 'package:home_management/features/auth/presentation/verification_page.dart';
import 'package:home_management/features/call_master/presentation/master_page.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaint/details_complaint/presentation/complaint_details.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaint/new_complaint_page.dart';
import 'package:home_management/features/complaints_suggestions/presentation/suggestion/suggestion_page.dart';
import 'package:home_management/features/home/presentation/home_screen.dart';
import 'package:home_management/features/knowledge_base/presentation/article_details/article_details_page.dart';
import 'package:home_management/features/knowledge_base/presentation/articles/knowledge_base_articles_page.dart';
import 'package:home_management/features/knowledge_base/presentation/categories/knowledge_base_categories_page.dart';
import 'package:home_management/features/knowledge_base/rules/presentation/rules_page.dart';
import 'package:home_management/features/notification/presentation/mobile_notification_page.dart';
import 'package:home_management/features/public_utilities/presentation/single_utility_bills/single_utility_bills_page.dart';
import 'package:home_management/features/public_utilities/presentation/utility_bills_page.dart';

import '../../features/complaints_suggestions/presentation/complaint/complaints_page.dart';
import '../../features/knowledge_base/rules/presentation/rules_details.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/login',
          page: LoginRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/home',
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: '/notification',
          page: NotificationRoute.page,
        ),
        AutoRoute(
          path: '/utility_bills',
          page: UtilityBillsRoute.page,
        ),
        AutoRoute(
          path: '/complaints_page',
          page: ComplaintsRoute.page,
        ),
        AutoRoute(
          path: '/complaint_details_page',
          page: ComplaintDetailsRoute.page,
        ),
        AutoRoute(
          path: '/new_complaint_page',
          page: NewComplaintRoute.page,
        ),
        AutoRoute(
          path: '/verification_page',
          page: VerificationRoute.page,
        ),
        AutoRoute(
          path: '/suggestion_page',
          page: SuggestionRoute.page,
        ),
        AutoRoute(
          path: '/call_master_page',
          page: CallMasterRoute.page,
        ),
        AutoRoute(
          path: '/knowledge_base_page',
          page: KnowledgeBaseCategoriesRoute.page,
        ),
        AutoRoute(
          path: '/knowledge_base_articles_page',
          page: KnowledgeBaseArticlesRoute.page,
        ),
        AutoRoute(
          path: '/knowledge_base_article_details_page',
          page: ArticleDetailsRoute.page,
        ),
        AutoRoute(
          path: '/rules_page',
          page: RulesRoute.page,
        ),
        AutoRoute(
          path: '/rule_details_page',
          page: RulesDetailsRoute.page,
        ),
        AutoRoute(
          path: '/voting_page',
          page: VotingRoute.page,
        ),
        AutoRoute(
          path: '/announcements',
          page: AnnouncementsRoute.page,
        ),
        AutoRoute(
          path: '/new_announcement',
          page: NewAnnouncementRoute.page,
        ),
        AutoRoute(
          path: '/announcement_details',
          page: AnnouncementDetailsRoute.page,
        ),
        AutoRoute(
          path: '/single_utility_bills_page',
          page: SingleUtilityBillsRoute.page,
        ),
        AutoRoute(
          path: '/single_vote_page',
          page: SingleVoteRoute.page,
        ),
      ];
}
