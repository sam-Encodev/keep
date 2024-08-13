import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/logger.dart';
import 'package:keep/utilities/switch_color.dart';

class EditNote extends StatelessWidget {
  const EditNote({super.key});

  static const title = "Title";
  static const placeholder = "Type something...";

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
        ),
        actions: [
          IconButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black87),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
            icon: const Icon(Icons.circle),
            color: Colors.lightGreenAccent,
            onPressed: () => _colorPickerDialog(context),
          ),
          IconButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black87),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
            icon: const Icon(Icons.save),
            color: Colors.white,
            onPressed: () => _saveChangesDialog(context),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black87,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ListView(
                shrinkWrap: true,
                children: const <Widget>[
                  SizedBox(height: 30),
                  TextField(
                      style: TextStyle(color: Colors.white, fontSize: 55),
                      maxLines: 1,
                      maxLength: 10,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white, fontSize: 55),
                        hintText: title,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      )),
                  TextField(
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      maxLines: 10,
                      decoration: InputDecoration(
                        focusColor: Colors.cyan,
                        hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                        hintText: placeholder,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> _saveChangesDialog(BuildContext context) {
  const prompt = "Do you want to save changes?";
  const yes = "Yes";
  const no = "No";

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Icon(
          Icons.info,
          color: Colors.white,
        ),
        content: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
                prompt,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            )
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all(const Size(120, 40)),
                backgroundColor: WidgetStateProperty.all(Colors.redAccent),
                elevation: WidgetStateProperty.all(0),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              child: const Text(no,
                  style: TextStyle(color: Colors.white, fontSize: 20))),
          FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all(const Size(120, 40)),
                backgroundColor: WidgetStateProperty.all(Colors.white),
                elevation: WidgetStateProperty.all(0),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              child: const Text(yes,
                  style: TextStyle(color: Colors.redAccent, fontSize: 20))),
        ],
      );
    },
  );
}

Future<void> _colorPickerDialog(BuildContext context) {
  const pickColor = "Pick a color";
  const colors = [
    {
      "name": 'red',
    },
    {
      "name": 'orange',
    },
    {
      "name": 'yellow',
    },
    {
      "name": 'green',
    },
    {
      "name": 'blue',
    },
    {
      "name": 'indigo',
    },
    {
      "name": 'white',
    }
  ];

  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Center(
            child: Text(
              pickColor,
              style: TextStyle(color: Colors.white),
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: colors
                .map((e) => TextButton.icon(
                      //  print(e.values.last);
                      onPressed: () => Foo.func(),
                      icon: ClipOval(
                          child: Container(
                              height: 30,
                              width: 30,
                              color: SwitchColor.switchColor(e.values.first))),
                      label: Text(
                        e.values.first.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ))
                .toList(),
          ),
        );
      });
}
