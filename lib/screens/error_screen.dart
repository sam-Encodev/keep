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
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.all(standardSpacing),
        width: double.maxFinite,
        height: double.maxFinite,
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSVG("error_404.svg"),
              const SizedBox(height: standardSpacing),
              FilledButton(
                  onPressed: () => context.go(RouteName.home),
                  style: buttonStyle(context),
                  child:
                      Text(goBack, style: TextStyle(fontSize: standardFont))),
            ],
          ),
        ),
      ),
    );
  }
}
