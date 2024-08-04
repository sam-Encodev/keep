import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class About extends StatelessWidget {
  const About({super.key});

  static const author = "Made by Samuel Martey";
  static const designer = "Designed by Samuel Martey";
  static const icons = "Icons - PNG and SVG";
  static const font = "Font - Nunito";
  static const signOut = "Sign out";
  static const version = "Version 1.0.0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.black87),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )),
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
                  children: const <Widget>[
                    Text(
                      author,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(designer,
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    Text(icons,
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    Text(font,
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  FilledButton(
                      onPressed: () => context.go("/login"),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.white),
                        minimumSize: WidgetStateProperty.all(
                            const Size(double.infinity, 40)),
                        elevation: WidgetStateProperty.all(0),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      child: const Text(signOut,
                          style: TextStyle(
                              color: Colors.redAccent, fontSize: 20))),
                  const SizedBox(height: 10),
                  const Text(version,
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            ],
          )),
    );
  }
}
