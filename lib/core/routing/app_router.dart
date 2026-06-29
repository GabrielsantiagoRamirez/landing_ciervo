import 'package:go_router/go_router.dart';

import '../../features/delete_account/pages/delete_account_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/not_found/pages/not_found_page.dart';
import '../../features/privacy/pages/privacy_page.dart';
import '../../features/support/pages/support_page.dart';
import '../../features/terms/pages/terms_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => const NotFoundPage(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/privacy',
      builder: (context, state) => const PrivacyPage(),
    ),
    GoRoute(
      path: '/terms',
      builder: (context, state) => const TermsPage(),
    ),
    GoRoute(
      path: '/delete-account',
      builder: (context, state) => const DeleteAccountPage(),
    ),
    GoRoute(
      path: '/support',
      builder: (context, state) => const SupportPage(),
    ),
  ],
);
