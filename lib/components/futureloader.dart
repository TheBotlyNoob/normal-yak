import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FutureLoader<T> extends StatelessWidget {
  final Future<T> future;
  final Function(BuildContext, T) builder;

  const FutureLoader({super.key, required this.future, required this.builder});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return builder(context, snapshot.data as T);
        } else if (snapshot.hasError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Error'),
                  content: Text(snapshot.error.toString()),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Close'),
                    ),
                  ],
                );
              });
          return const SizedBox.shrink();
        } else {
          return const Center(
            child: SpinKitSpinningLines(color: Colors.blue),
          );
        }
      },
    );
  }
}
