import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_management/core/common/models/complaint_screen_type.dart';
import 'package:home_management/features/activity/presentation/advertisement_page.dart';
import 'package:home_management/features/activity/presentation/voting_page.dart';
import 'package:home_management/features/auth/models/sing_in_response_dto.dart';
import 'package:home_management/features/auth/presentation/login_page.dart';
import 'package:home_management/features/auth/presentation/verification_page.dart';
import 'package:home_management/features/call_master/presentation/master_page.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaint/new_complaint_page.dart';
import 'package:home_management/features/complaints_suggestions/presentation/suggestion/suggestion_page.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaint/details_complaint/presentation/complaint_details.dart';
import 'package:home_management/features/home/presentation/home_screen.dart';
import 'package:home_management/features/knowledge_base/presentation/knowledge_base_page.dart';
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
          page: KnowledgeBaseRoute.page,
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
          path: '/advertisement_page',
          page: AdvertisementRoute.page,
        ),
        AutoRoute(
          path: '/single_utility_bills_page',
          page: SingleUtilityBillsRoute.page,
        ),
      ];
}
