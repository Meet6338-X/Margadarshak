/// The navigation of the app.
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/core/l10n/l10n.dart';
import '../ui/features/auth/views/login_view.dart';
import '../ui/features/discover/views/career_detail_view.dart';
import '../ui/features/discover/views/discover_view.dart';
import '../ui/features/facilitator/views/class_detail_view.dart';
import '../ui/features/facilitator/views/facilitator_view.dart';
import '../ui/features/facilitator/views/module_editor_view.dart';
import '../ui/features/learn/views/learn_view.dart';
import '../ui/features/onboarding/views/onboarding_view.dart';
import '../ui/features/opportunities/views/opportunities_view.dart';
import '../ui/features/opportunities/views/opportunity_detail_view.dart';
import '../ui/features/profile/views/profile_view.dart';
import 'session_controller.dart';

/// Builds the router of the app.
///
/// The redirect is driven by the session, so a student who is not signed in
/// never sees a screen that needs a profile.
GoRouter createRouter(SessionController session) {
  return GoRouter(
    initialLocation: '/',
    refreshListenable: session,
    redirect: (context, state) {
      final location = state.matchedLocation;

      if (!session.isReady) {
        return location == '/' ? null : '/';
      }

      if (!session.isSignedIn) {
        return location == '/login' ? null : '/login';
      }

      if (session.needsOnboarding) {
        return location == '/onboarding' ? null : '/onboarding';
      }

      if (location == '/' || location == '/login' || location == '/onboarding') {
        return session.isFacilitator ? '/facilitator' : '/discover';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const _SplashView(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => OnboardingView(
          studentId: session.user?.userId ?? '',
          onSaved: session.refreshProfile,
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Scaffold(
            body: navigationShell,
            bottomNavigationBar: NavigationBar(
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: (index) => navigationShell.goBranch(index),
              destinations: [
                NavigationDestination(
                  icon: const Icon(Icons.explore_outlined),
                  selectedIcon: const Icon(Icons.explore),
                  label: context.l10n.navDiscover,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.workspace_premium_outlined),
                  selectedIcon: const Icon(Icons.workspace_premium),
                  label: context.l10n.navOpportunities,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.play_circle_outline),
                  selectedIcon: const Icon(Icons.play_circle),
                  label: context.l10n.navLearn,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.person_outline),
                  selectedIcon: const Icon(Icons.person),
                  label: context.l10n.navProfile,
                ),
              ],
            ),
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/discover',
                builder: (context, state) => const DiscoverView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/opportunities',
                builder: (context, state) => const OpportunitiesView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/learn',
                builder: (context, state) => const LearnView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileView(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/opportunity/:id',
        builder: (context, state) => OpportunityDetailView(
          opportunityId: state.pathParameters['id'] ?? '',
        ),
      ),
      GoRoute(
        path: '/career/:id',
        builder: (context, state) => CareerDetailView(
          careerId: state.pathParameters['id'] ?? '',
        ),
      ),
      GoRoute(
        path: '/facilitator',
        builder: (context, state) => const FacilitatorView(),
      ),
      GoRoute(
        path: '/facilitator/class/:classId',
        builder: (context, state) => ClassDetailView(
          classId: state.pathParameters['classId'] ?? '',
        ),
      ),
      GoRoute(
        path: '/facilitator/module/new',
        builder: (context, state) => const ModuleEditorView(),
      ),
    ],
  );
}

/// The screen shown while the session is being resolved.
class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(context.l10n.appTitle),
            const SizedBox(height: 4),
            Text(context.l10n.appTagline),
          ],
        ),
      ),
    );
  }
}
