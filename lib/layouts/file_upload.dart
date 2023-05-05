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
import 'package:http/http.dart' as http;

class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  /// Variables
  // File? imageFile;
  List<File> _imageFiles = [];
  List<File>? _selectedImagePath;

  /// Widget
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          SizedBox(
            height: 30,
          ),
          _imageFiles.isNotEmpty
              ? GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  children: List.generate(_imageFiles.length, (index) {
                    return SingleChildScrollView(
                      child: Stack(
                        children: <Widget>[
                          Image.file(
                            _imageFiles[index],
                            fit: BoxFit.cover,
                            scale: 1.5,
                          ),
                          Positioned(
                            right: 38,
                            top: 5,
                            child: InkWell(
                              child: Icon(
                                Icons.cancel_outlined,
                                size: 20,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  _imageFiles.removeAt(index);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                )
              //)
              : Container(),
          // imageFile != null
          //     ? Stack(children: <Widget>[
          //         Image.file(
          //           imageFile!,
          //           fit: BoxFit.cover,
          //         ),
          //         Positioned(
          //           right: 5,
          //           top: 5,
          //           child: InkWell(
          //             child: Icon(
          //               Icons.cancel_outlined,
          //               size: 20,
          //               color: Colors.white,
          //             ),
          //             onTap: () {
          //               setState(() {
          //                 imageFile = null;
          //               });
          //             },
          //           ),
          //         ),
          //       ])
          //     : Container(),
        ],
      ),
    );
  }

  Future<void> _getFromGallery() async {
    List<XFile> xFiles = await ImagePicker().pickMultiImage(
      maxWidth: 150,
      maxHeight: 150,
    ); // pickMultiImage returns List<XFile>
    if (xFiles != null) {
      for (var i = 0; i < xFiles.length; i++) {
        print('pic');
        File file = File(xFiles[i].path);
        setState(() {
          _imageFiles.add(file);
        });
      }
    }
  }

  /// Get from gallery
  // Future _getFromGallery() async {
  //   XFile? pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 150,
  //     maxHeight: 150,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //     });
  //   }
  // }

  /// Get from Camera
  Future<void> _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 150,
      maxHeight: 150,
    );
    if (pickedFile == null) return;
    setState(() {
      _imageFiles.add(File(pickedFile.path));
    });
  }

  Future<void> _uploadImages() async {
    // Create a multipart request
    var request = http.MultipartRequest('POST', Uri.parse(''));

    // Add the images to the request
    for (var i = 0; i < _imageFiles.length; i++) {
      request.files.add(
          await http.MultipartFile.fromPath('images[]', _imageFiles[i].path));
    }

    // Send the request
    var response = await request.send();

    // Check if the request was successful
    if (response.statusCode == 200) {
      print('photo uploaded');
      // Do something with the response
    } else {
      // Handle the error
    }
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
