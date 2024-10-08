import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/routes/route_names.dart';
import 'package:keep/utilities/styles.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black87,
        ),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSVG("error_404.svg"),
              const SizedBox(height: 10),
              FilledButton(
                  onPressed: () => context.go(RouteNames.home),
                  style: buttonStyle(),
                  child: const Text(goBack,
                      style: TextStyle(color: Colors.redAccent, fontSize: 20))),
            ],
          ),
        ),
      ),
    );
  }
}
