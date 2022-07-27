
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'add_contacts.dart';
import 'mainpage.dart';

Future main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ContactAdapter());
  Hive.registerAdapter(RelationshipAdapter());
  await Hive.openBox<Contact>(contactsBoxName);
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainPage(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Story Designer Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // RaisedButton(
            //   onPressed: () async {
            //     final picker = ImagePicker();
            //     await picker
            //         .getImage(source: ImageSource.gallery)
            //         .then((file) async {
            //       File editedFile =
            //           await Navigator.of(context).push(MaterialPageRoute(
            //               builder: (context) => StoryDesigner(
            //                     filePath: file!.path,
            //                   )));

            //       ------- you have editedFile

            //       print('editedFile: ' + editedFile.path);
            //     });
            //   },
            //   child: const Text('Pick Image'),
            // ),
            RaisedButton(
              onPressed: () async {
                final picker = ImagePicker();
                await picker
                    .getImage(source: ImageSource.gallery)
                    .then((file) async {
                  // File editedFile = await Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //         builder: (context) => DrawingAnimation()));

                  // ------- you have editedFile

                 // print('editedFile: ' + editedFile.path);
                });
              },
              child: const Text('Pick Image'),
            ),
          ],
        ),
      ),
    );
  }
}
