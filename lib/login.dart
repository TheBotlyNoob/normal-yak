import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:normal_yak/src/rust/api/util.dart';
import 'package:provider/provider.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:normal_yak/components/futureloader.dart';
import 'package:normal_yak/src/rust/api/matrix.dart';

import 'package:normal_yak/main.dart';

@immutable
class MatrixSetupFormRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const App(child: MatrixSetupForm();
  }
}

class MatrixSetupForm extends StatefulWidget {
  const MatrixSetupForm({
    super.key,
  });

  @override
  MatrixSetupFormState createState() => MatrixSetupFormState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class MatrixSetupFormState extends State<MatrixSetupForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<ShadFormState>();

  late String homeserver;

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return ShadForm(
      key: _formKey,
      child: Column(
        children: <Widget>[
          ShadInputFormField(
            placeholder: const Text("Homeserver"),
            initialValue: 'matrix.org',
            validator: (value) {
              if (value.trim().isEmpty) {
                return 'Please enter some text';
              }

              var modified = value;
              if (!value.contains("://")) {
                modified = "https://$value";
              }

              final maybeHomeserver = parseRustUrl(url: modified);

              if (maybeHomeserver != null &&
                  isRustUrlHttps(url: maybeHomeserver)) {
                return null;
              } else {
                return 'Please enter a valid, secure URL (insecure homeservers are unsupported at the moment)';
              }
            },
            onSaved: (value) {
              if (value == null) return;

              homeserver = value;
            },
          ),
          const SizedBox(height: 100.0),
          ShadButton(
            onPressed: () {
              final form = _formKey.currentState!;
              // Validate returns true if the form is valid, or false otherwise.
              if (form.validate()) {
                form.save();
                print(LoginPageRoute(homeserver: homeserver).location);
                LoginPageRoute(homeserver: homeserver).go(context);
              }
            },
            child: const Text('Go to Login'),
          ),
        ],
      ),
    );
  }
}

@immutable
class LoginPageRoute extends GoRouteData {
  final String? homeserver;

  const LoginPageRoute({this.homeserver});

  Widget invalidHomeserver(BuildContext context) {
    return ShadDialog.alert(
      title: const Text('Error'),
      description: const Text('Invalid homeserver URL'),
      actions: [
        ShadButton(
          onPressed: () {
            Navigator.of(context)
              ..pop()
              ..pop();
          },
          child: const Text('Go Back'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    if (homeserver == null) {
      return invalidHomeserver(context);
    }

    var modified = homeserver!;
    if (!modified.contains("://")) {
      modified = "https://$modified";
    }

    final url = parseRustUrl(url: modified!);
    if (url == null || !isRustUrlHttps(url: url)) {
      return invalidHomeserver(context);
    }

    return App(child: FutureLoader<MatrixClient>(
        future: () => MatrixClient.newInstance(homeserver: url),
        builder: (context, client) => LoginPage(client: client)));
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.client});

  final MatrixClient client;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    return FutureLoader<LoginTypes>(
        future: () => widget.client.loginTypes(),
        builder: (context, data) {
          final types = data.inner;
          return Form(
            key: _formkey,
            child: Column(
                children: [
              types.hasPassword()
                  ? UsernamePasswordLogin(client: widget.client)
                  : null,
              types.hasSso()
                  ? SsoLogin(client: widget.client)
                  : null,
            ].whereType<Widget>().toList()),
          );
        });
  }
}

class UsernamePasswordLogin extends StatefulWidget {
  const UsernamePasswordLogin({super.key, required this.client});

  final MatrixClient client;

  @override
  UsernamePasswordLoginState createState() => UsernamePasswordLoginState();
}

class UsernamePasswordLoginState extends State<UsernamePasswordLogin> {
  final _formkey = GlobalKey<ShadFormState>();

  late String username;
  late String password;

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    final client = context.read<MatrixClient>();

    return ShadForm(
        key: _formkey,
        child: Column(
          children: [
            ShadInputFormField(
              placeholder: const Text("Username"),
              validator: (value) {
                if (value.trim().isEmpty) {
                  return 'Please enter some text';
                }
                username = value;
                return null;
              },
            ),
            ShadInputFormField(
              placeholder: const Text("Password"),
              validator: (value) {
                if (value.trim().isEmpty) {
                  return 'Please enter some text';
                }
                password = value;
                return null;
              },
            ),
            ShadButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  setState(() {
                    isLoading = true;
                  });
                }
              },
              child: const Text('Login'),
            ),
          ],
        ));
  }
}

class SsoLogin extends StatelessWidget {
  const SsoLogin({super.key, required this.client});

  final MatrixClient client;

  @override
  Widget build(BuildContext context) {
    return ShadButton.outline(
      onPressed: () {
        // TODO

        showShadDialog(
          context: context,
          builder: (BuildContext context) {
            return ShadDialog.alert(
              title: const Text('Not implemented'),
              description: const Text('This feature is not implemented yet.'),
              actions: [
                ShadButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      },
      child: const Text('Login with SSO'),
    );
  }
}
