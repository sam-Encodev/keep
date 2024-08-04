import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Image',
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                    SizedBox(height: 50),
                    Text(
                      textHead,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 15),
                    Text(
                      textBody,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 150,
                        child: Icon(
                          Icons.minimize,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => context.pop(),
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
                        onPressed: () => context.push("/welcome/third"),
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
