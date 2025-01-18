import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter/material.dart';

import 'dart:core';

import 'package:normal_yak/src/rust/api/matrix.dart';
import 'package:normal_yak/src/rust/api/util.dart';
import 'package:normal_yak/src/rust/frb_generated.dart';

import 'package:normal_yak/components/futureloader.dart';
import 'package:normal_yak/login.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

part 'main.g.dart';

void main() async {
  usePathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(routes: $appRoutes);

    return ShadApp.materialRouter(
      routerConfig: router,
    );
  }
}

@TypedGoRoute<LandingPageRoute>(path: '/', routes: [
  TypedGoRoute<MatrixSetupFormRoute>(path: 'login', routes: [
    TypedGoRoute<LoginPageRoute>(path: 'credentials'),
  ]),
])
@immutable
class LandingPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const App(child: LandingPage());
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Column(
      children: [
        Text('Welcome to Normal Yak!', style: theme.textTheme.h1Large),
        ShadButton(
          onPressed: () => MatrixSetupFormRoute().go(context),
          child: const Text('Go to Login'),
        ),
      ],
    );
  }
}

class App extends StatelessWidget {
  final Widget? child;

  const App({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Normal Yak')),
        body: FutureLoader(
          future: () => RustLib.init(),
          builder: (context, _) => child ?? const Text("404"),
        ));
  }
}

class CorePage extends StatefulWidget {
  const CorePage({super.key});

  @override
  CorePageState createState() => CorePageState();
}

class CorePageState extends State<CorePage> {
  Future<MatrixClient>? _client;

  @override
  Widget build(BuildContext context) {
    final client = _client;
    return client == null
        ? const MatrixSetupForm()
        : FutureLoader<MatrixClient>(
            future: () => client,
            builder: (context, client) {
              return Provider<MatrixClient>(
                  create: (_) => client,
                  child: const AlertDialog(
                    title: Text('Logged in to TODO'),
                  ));
            });
  }
}
