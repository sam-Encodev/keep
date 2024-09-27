import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class About extends ConsumerWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              style: iconButtonStyle(),
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.arrow_back, size: 30),
              color: Colors.white,
              onPressed: () => context.pop(),
            ),
          )),
      body: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    buildText(font),
                    buildText(icons),
                    buildText(author),
                    buildText(designer),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                child: Column(
                  children: [
                    FilledButton(
                        onPressed: () =>
                            {ref.read(authNotifierProvider.notifier).logout()},
                        style: buttonStyle(),
                        child: const Text(signOut,
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 20))),
                    const SizedBox(height: 10),
                    buildText(version),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
