import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

class FutureLoader<T> extends StatefulWidget {
  final Future<T> Function() future;
  final Function(BuildContext, T) builder;

  const FutureLoader({super.key, required this.future, required this.builder});

  @override
  State<FutureLoader<T>> createState() => FutureLoaderState<T>();
}

class FutureLoaderState<T> extends State<FutureLoader<T>> {
  late final Future<T> future = widget.future();
  bool hasError = false;

  Widget dialogBuilder(error, context) => ShadDialog.alert(
        title: const Text('Error'),
        description: Text(error.toString()),
        actions: [
          ShadButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return FutureBuilder(
      future: future.catchError((error) async {
        if (mounted && !hasError) {
          hasError = true;
          await showShadDialog(
              context: context,
              builder: (context) => dialogBuilder(error, context));
        }

        return error;
      }),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && !hasError) {
          return widget.builder(context, snapshot.data as T);
        } else if (snapshot.hasError && !hasError) {
          hasError = true;
          showShadDialog(
              context: context,
              builder: (context) => dialogBuilder(snapshot.error, context));
          return const SizedBox.shrink();
        } else {
          return Center(
            child: SpinKitSpinningLines(
                color: theme.primaryAlertTheme.iconColor ??
                    theme.textTheme.h1.color ??
                    const ShadSlateColorScheme.dark().primary),
          );
        }
      },
    );
  }
}
