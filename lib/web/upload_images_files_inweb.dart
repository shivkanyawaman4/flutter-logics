// import 'dart:io';

// import 'package:flutter/material.dart';

// class UploadFileImageWeb extends StatefulWidget {
//   const UploadFileImageWeb({ Key? key }) : super(key: key);

//   @override
//   State<UploadFileImageWeb> createState() => _UploadFileImageWebState();
// }

// class _UploadFileImageWebState extends State<UploadFileImageWeb> {
//   File? file;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ElevatedButton(onPressed: (){}, child: Text('Upload Image')),
      
//     );
//   }
//   void _pickFile() async {
//     print("Picking file");
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf', 'doc', 'docx'],
//     );
//     if (result == null) {
//       return;
//     }
//     fileName = result.files.first.name;
//     file = result.files.first;
//     // setState(() {});

//     // _openFile(file);
//   }

//   uploadFile() async {
//     if (file != null) {
//       if (kIsWeb) {
//         Reference _reference =
//             FirebaseStorage.instance.ref().child("Applications/${file!.name}");
//         await _reference
//             .putData(
//           file!.bytes!,
//         )
//             .whenComplete(() async {
//           await _reference.getDownloadURL().then((url) {
//             applicationData['resume'] = url;
//             applicationData['position'] = widget.details['jobTitle'];
//             applicationsCol.update({
//               applicationsCollection: FieldValue.arrayUnion([applicationData])
//             });
            
//             Fluttertoast.showToast(msg: "Application Submitted Successfully");
//             Navigator.pop(context);
//           });
//         });
//       } else {
//         final destination = "Applications/" + file!.path!.split('/').last;

//         UploadTask? task =
//             FirebaseMethods.uploadFile(destination, File(file!.path!));
//         if (task == null) return;
//         final snapshot = await task.whenComplete(() {});

//         await snapshot.ref.getDownloadURL().then((url) {
//           applicationData['resume'] = url;
//           applicationData['position'] = widget.details['jobTitle'];
//           applicationsCol.update({
//             applicationsCollection: FieldValue.arrayUnion([applicationData])
//           });
//           // print('***************************');
//           // print(applicationData);
//           // applicationsCol.set({
//           //   applicationsCollection: [applicationData]
//           // });

//           // setState(() {
//           //   applicationData = {};
//           // });
//           Fluttertoast.showToast(msg: "Application Submitted Successfully");
//           Navigator.pop(context);
//         });
//       }
//     } else {
//       Fluttertoast.showToast(msg: "Please select an image");
//     }
// }

