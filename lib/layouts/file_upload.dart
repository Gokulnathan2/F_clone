// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ImagePickerPage extends StatefulWidget {
//   @override
//   _ImagePickerPageState createState() => _ImagePickerPageState();
// }

// class _ImagePickerPageState extends State<ImagePickerPage> {
//   /// Variables
//   File? imageFile;

//   /// Widget
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: imageFile == null
//           ? Container(
//               //    width: 30,
//               alignment: Alignment.center,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   ElevatedButton(
//                     onPressed: () {
//                       _getFromGallery();
//                     },
//                     child: Text("PICK FROM GALLERY"),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       _getFromCamera();
//                     },
//                     child: Text("PICK FROM CAMERA"),
//                   )
//                 ],
//               ),
//             )
//           : Container(
//               child: Image.file(
//                 imageFile!,
//                 fit: BoxFit.cover,
//               ),
//             ),
//     );
//   }

//   /// Get from gallery
//   Future _getFromGallery() async {
//     XFile? pickedFile = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//     }
//   }

//   /// Get from Camera
//   _getFromCamera() async {
//     final pickedFile = await ImagePicker().pickImage(
//       source: ImageSource.camera,
//       // maxWidth: 1800,
//       // maxHeight: 1800,
//     );
//     if (pickedFile == null) return;
//     imageFile = File(pickedFile.path);
//     setState(() {
//       this.imageFile = imageFile;
//     });
//     // if (pickedFile != null) {
//     //   setState(() {
//     //     imageFile = File(pickedFile.path);
//     //   });
//     // }
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  /// Variables
  File? imageFile;

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              'Add Photos',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Color.fromRGBO(20, 56, 103, 1)),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Container(
              alignment: const Alignment(-1, 0),
              // decoration: Decoration(),
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: 24.0,
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(20, 56, 103, 1))),
                onPressed: () {
                  _getFromCamera();
                },
                label: Text(
                  "Take Photo",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),

            SizedBox(
              width: 10,
            ),
            Container(
              alignment: const Alignment(-1, 0),
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.upload_file_outlined,
                  size: 24.0,
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(20, 56, 103, 1))),
                onPressed: () {
                  _getFromGallery();
                },
                label: Text(
                  "Upload Photo",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // Row(
            //   children: [
            //     Container(
            //       child: ElevatedButton.icon(
            //         icon: Icon(
            //           Icons.remove_circle_outline,
            //           size: 24.0,
            //         ),
            //         style: ButtonStyle(
            //             backgroundColor: MaterialStateProperty.all(
            //                 Color.fromRGBO(20, 56, 103, 1))),
            //         onPressed: () {
            //           setState(() {
            //             imageFile = null;
            //           });
            //         },
            //         label: Text(
            //           "Remove All",
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize: 15.0,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
        imageFile != null
            ? Stack(children: <Widget>[
                Image.file(
                  imageFile!,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: InkWell(
                    child: Icon(
                      Icons.cancel_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                    onTap: () {
                      setState(() {
                        imageFile = null;
                      });
                    },
                  ),
                ),
              ])
            : Container(),
      ],
    );
  }

  /// Get from gallery
  Future _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 150,
      maxHeight: 150,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 150,
      maxHeight: 150,
    );
    if (pickedFile == null) return;
    setState(() {
      imageFile = File(pickedFile.path);
    });
  }
}
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ImagePickerPage extends StatefulWidget {
//   @override
//   _ImagePickerPageState createState() => _ImagePickerPageState();
// }

// class _ImagePickerPageState extends State<ImagePickerPage> {
//   /// Variables

//   final ImagePicker imagePicker = ImagePicker();
//   List<XFile>? imageFileList = [];

//   void selectImages() async {
//     final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
//     if (selectedImages!.isNotEmpty) {
//       imageFileList!.addAll(selectedImages);
//     }
//     print("Image List Length:" + imageFileList!.length.toString());
//     setState(() {});
//   }

//   /// Widget
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ElevatedButton(
//           onPressed: () {
//             selectImages();
//           },
//           child: Text('Select Images'),
//         ),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GridView.builder(
//                 itemCount: imageFileList!.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3),
//                 itemBuilder: (BuildContext context, int index) {
//                   return Image.file(
//                     File(imageFileList![index].path),
//                     fit: BoxFit.cover,
//                   );
//                 }),
//           ),
//         ),
//       ],
//     );
//   }

//   /// Get from gallery

// }
