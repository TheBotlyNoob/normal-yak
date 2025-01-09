import 'package:flutter/material.dart';

import 'dart:core';

import 'package:normal_yak/src/rust/api/matrix.dart';
import 'package:normal_yak/src/rust/api/util.dart';
import 'package:normal_yak/src/rust/frb_generated.dart';
import 'package:normal_yak/components/futureloader.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Normal Yak')),
        body: FutureLoader(
          future: RustLib.init(),
          builder: (context, _) => const CorePage(),
        ),
      ),
    );
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
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: client == null
                ? HomeserverForm(
                    onSubmit: (homeserver) => setState(() {
                          _client =
                              MatrixClient.newInstance(homeserver: homeserver);
                        }))
                : FutureLoader<MatrixClient>(
                    future: client,
                    builder: (context, client) {
                      return Provider<MatrixClient>(
                          create: (_) => client, child: const LoginPage());
                    })));
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final client = context.read<MatrixClient>();
    return FutureLoader<LoginTypes>(
        future: client.loginTypes(),
        builder: (context, data) {
          final types = data.inner;
          return Form(
            key: _formkey,
            child: Column(
                children: [
              types.hasPassword() ? UsernamePasswordLogin() : null,
              types.hasSso() ? SsoLogin() : null,
            ].where((e) => e != null).toList()),
          );
        });
  }
}

class HomeserverForm extends StatefulWidget {
  const HomeserverForm({super.key, required this.onSubmit});

  final void Function(RustUrl homeserver) onSubmit;

  @override
  HomeserverFormState createState() => HomeserverFormState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class HomeserverFormState extends State<HomeserverForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  late RustUrl homeserver;

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: 'Homeserver URL'),
            initialValue: 'matrix.org',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter some text';
              }

              var modified = value;
              if (!value.contains("://")) {
                modified = "https://$value";
              }

              final maybeHomeserver = parseRustUrl(url: modified);

              if (maybeHomeserver != null &&
                  isRustUrlHttps(url: maybeHomeserver)) {
                homeserver = maybeHomeserver;
                return null;
              } else {
                return 'Please enter a valid, secure URL (insecure homeservers are unsupported at the moment)';
              }
            },
          ),
          const SizedBox(height: 100.0),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                setState(() {
                  isLoading = true;
                });
                widget.onSubmit(homeserver);
              }
            },
            child: isLoading
                ? const SpinKitThreeBounce(color: Colors.red)
                : const Text('Go to Login'),
          ),
        ],
      ),
    );
  }
}
