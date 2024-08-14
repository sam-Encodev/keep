import 'package:flutter/material.dart';
import 'package:keep/utilities/styles.dart';
import 'package:dots_indicator/dots_indicator.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  static const skip = "Skip";
  static const textHead = "Stay productive note-taking";
  static const textBody =
      "Stay productive on the go by ensuring you never forget anything important or vital";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        actions: [
          FilledButton(
              onPressed: () => {},
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
              Center(
                child: Column(
                  children: [
                    buildSVG("blog_header.svg"),
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  DotsIndicator(
                    dotsCount: 3,
                    position: 1,
                    decorator: dotsStyle(),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => {},
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                Colors.deepPurpleAccent),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            )),
                        icon: const Icon(
                          Icons.arrow_left,
                          size: 35,
                        ),
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () => {},
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
