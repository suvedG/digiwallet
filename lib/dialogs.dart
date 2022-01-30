import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Dialogs {
  static showDiag(
      {required BuildContext context,
      required String title,
      required String field1,
      required String field2,
      required String field3,
      required String field4}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: field1,
                          border: const OutlineInputBorder(),
                          hintText: field2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: field3,
                          border: const OutlineInputBorder(),
                          hintText: field4),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Submit"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            textStyle: const TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            textStyle: const TextStyle(color: Colors.white)),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  static showFlightDiag(
      {required BuildContext context,
      required String title,
      required String field1,
      required String field2,
      required String field3,
      required String field4,
      required String field5,
      required String field6}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: field1,
                          border: const OutlineInputBorder(),
                          hintText: field2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: field3,
                          border: const OutlineInputBorder(),
                          hintText: field4),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: field5,
                          border: const OutlineInputBorder(),
                          hintText: field6),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Search"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            textStyle: const TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            textStyle: const TextStyle(color: Colors.white)),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  static showTop({required BuildContext context, required String message}) {
    showTopSnackBar(context, CustomSnackBar.info(message: message));
  }
}
