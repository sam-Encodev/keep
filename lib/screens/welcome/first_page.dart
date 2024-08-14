import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/styles.dart';
import 'package:dots_indicator/dots_indicator.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  static const skip = "Skip";
  static const textHead = "Intuitive note-taking";
  static const textBody =
      "Effortlessly organize your thought and ideas by keeping your important information at your fingertips.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        actions: [
          FilledButton(
              onPressed: () => context.pushReplacement('/'),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.white),
                elevation: WidgetStateProperty.all(0),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              child: const Text(
                skip,
                style: TextStyle(color: Colors.redAccent),
              ))
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildSVG("illustration.svg"),
                  const SizedBox(height: 50),
                  const Text(
                    textHead,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    textBody,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  DotsIndicator(
                    dotsCount: 3,
                    position: 0,
                    decorator: dotsStyle(),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () => context.push("/welcome/second"),
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                Colors.deepPurpleAccent),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            )),
                        icon: const Icon(
                          Icons.arrow_right,
                          size: 35,
                        ),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
