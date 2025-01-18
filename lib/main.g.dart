// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $landingPageRoute,
    ];

RouteBase get $landingPageRoute => GoRouteData.$route(
      path: '/',
      factory: $LandingPageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'login',
          factory: $MatrixSetupFormRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'credentials',
              factory: $LoginPageRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $LandingPageRouteExtension on LandingPageRoute {
  static LandingPageRoute _fromState(GoRouterState state) => LandingPageRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MatrixSetupFormRouteExtension on MatrixSetupFormRoute {
  static MatrixSetupFormRoute _fromState(GoRouterState state) =>
      MatrixSetupFormRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginPageRouteExtension on LoginPageRoute {
  static LoginPageRoute _fromState(GoRouterState state) => LoginPageRoute(
        homeserver: state.uri.queryParameters['homeserver'],
      );

  String get location => GoRouteData.$location(
        '/login/credentials',
        queryParams: {
          if (homeserver != null) 'homeserver': homeserver,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
