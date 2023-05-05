// import 'dart:developer';
// import 'package:get/get.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:gokul_f/bloc/text_controller_%20access.dart';
// import 'package:gokul_f/layouts/drop_down.dart';
// import 'package:gokul_f/layouts/drop_down_location.dart';
// import 'package:gokul_f/layouts/stepper.dart';
// import 'package:gokul_f/layouts/try_nd_error.dart';
// //import 'package:gokul_f/model/Location.dart';
// import 'package:gokul_f/model/service_model.dart';
// import 'package:gokul_f/screens/login/view/job2.dart';
// import 'package:gokul_f/services/create_job_service.dart';
// import 'package:gokul_f/layouts/constants.dart';

// import '../model/Location.dart';
// import '../model/selected_type.dart';
// import '../repository/Loction_repo.dart';

// //import 'constants.dart';

// class JobScreen extends StatefulWidget {
//   const JobScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   JobScreenState createState() => JobScreenState();
// }

// class JobScreenState extends State<JobScreen> {
//   dynamic cj;
//   ServiceType? ser;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   /// This is register text field controllers.
//   final TextEditingController _servicetypeTextEditingController =
//       TextEditingController();
//   final TextEditingController _properyTextEditingController =
//       TextEditingController();
//   final TextEditingController _locationTextEditingController =
//       TextEditingController();
//   final TextEditingController _descripitionTextEditingController =
//       TextEditingController();
//   final TextEditingController _detailedDescripitionTextEditingController =
//       TextEditingController();

//   // @override
//   // void dispose() {
//   //   super.dispose();
//   //   _servicetypeTextEditingController.dispose();
//   //   _properyTextEditingController.dispose();
//   //   _locationTextEditingController.dispose();
//   //   _descripitionTextEditingController.dispose();
//   //   _detailedDescripitionTextEditingController.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(child: mainBody()),
//     );
//   }

//   /// This is Main Body widget.
//   Widget mainBody() {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // AppTextField(
//           //   textEditingController: _servicetypeTextEditingController,
//           //   title: 'Service Type',
//           //   hint: 'Select',
//           //   isCitySelected: true,

//           //   //cities: _listOfCities,
//           // ),

//           AppTextField1(),

//           // AppTextField2(
//           //   textEditingController: _locationTextEditingController,
//           //   title: 'Location',
//           //   hint: 'Select tenant & unit',
//           //   isCitySelected: true,
//           //   cities: locationData,
//           // ),
//           // AppTextField3(
//           //   textEditingController: _descripitionTextEditingController,
//           //   title: 'Brief Descripition',
//           //   hint: 'Description',
//           // ),
//           // AppTextField4(
//           //   textEditingController: _detailedDescripitionTextEditingController,
//           //   title: 'Detailed Descripition',
//           //   hint: 'Description',
//           // ),
//           // const SizedBox(
//           //   height: 15.0,
//           // ),
//           //  _AppElevatedButton(),
//         ],
//       ),
//     );
//   }
// }

// /// This is Common App textfiled class.
// // class AppTextField extends StatefulWidget {
// //   final TextEditingController textEditingController;
// //   final String title;
// //   final String hint;
// //   final bool isCitySelected;
// //   //final List<SelectedListItem>? cities;

// //   const AppTextField({
// //     required this.textEditingController,
// //     required this.title,
// //     required this.hint,
// //     required this.isCitySelected,
// //     // this.cities,
// //     Key? key,
// //   }) : super(key: key);

// //   @override
// //   _AppTextFieldState createState() => _AppTextFieldState();
// // }

// // class _AppTextFieldState extends State<AppTextField> {
// //   final TextEditingController _searchTextEditingController =
// //       TextEditingController();

// //   late List<dynamic> service;
// //   ServiceType? ser;
// //   List<dynamic> _listOfCities = [];
// //   String? dropdownValue;
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     _getData();
// //     // _getData1();
// //   }

// //   void _getData() async {
// //     service = (await CreateJobService().createJobService());
// //     print(service);
// //     Future.delayed(const Duration(seconds: 0)).then((value) => setState(
// //           () {},
// //         ));
// //     print('hi');

// //     print(service[0]['name']);
// //     print(ser);
// //     print(_listOfCities);
// //     // print("welcome${ser?.name}");
// //     // print(_listOfCities[0].name);
// //   }

// //   /// This is on text changed method which will display on city text field on changed.
// //   void onTextFieldTap() {
// //     DropDownState(
// //       DropDownCopy(
// //         bottomSheetTitle: Text(
// //           'Service Type',
// //           style: TextStyle(
// //             fontWeight: FontWeight.bold,
// //             fontSize: 20.0,
// //           ),
// //         ),
// //         submitButtonChild: const Text(
// //           'Done',
// //           style: TextStyle(
// //             fontSize: 16,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         data: service,
// //         selectedItems: (List<dynamic> selectedList) {
// //           List<String> list = [];
// //           for (var item in selectedList) {
// //             if (item is dynamic) {
// //               list.add(item['name']);
// //               print(item['name']);
// //               String name = item['name'];
// //               setState(() {
// //                 // list[0] = dropdownValue!;
// //                 widget.textEditingController.text = name;
// //               });
// //               print(service);
// //               print(list);
// //             }
// //           }
// //           showSnackBar(list.toString());
// //         },
// //         //enableMultipleSelection: true,
// //       ),
// //     ).showModal(context);
// //   }

// //   void showSnackBar(String message) {
// //     ScaffoldMessenger.of(context)
// //         .showSnackBar(SnackBar(content: Text(message)));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           widget.title,
// //           style: TextStyle(
// //               fontWeight: FontWeight.bold,
// //               fontSize: 15.0,
// //               color: Color.fromARGB(255, 20, 56, 103)),
// //         ),
// //         const SizedBox(
// //           height: 5.0,
// //         ),
// //         TextFormField(
// //           //initialValue: dropdownValue,

// //           readOnly: true,
// //           controller: widget.textEditingController,
// //           //  cursorColor: Colors.black,
// //           onTap: widget.isCitySelected
// //               ? () {
// //                   FocusScope.of(context).unfocus();
// //                   onTextFieldTap();

// //                   //CreateJobService().createJobService();
// //                 }
// //               : null,
// //           decoration: InputDecoration(
// //             contentPadding:
// //                 const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 10),
// //             hintText: widget.hint,
// //             hintStyle: const TextStyle(fontSize: 14, color: Colors.black45),
// //             suffixIcon: const Icon(
// //               Icons.keyboard_arrow_down_sharp,
// //               size: 30,
// //             ),
// //             border: const OutlineInputBorder(
// //               borderSide: BorderSide(),
// //               borderRadius: BorderRadius.all(
// //                 Radius.circular(8.0),
// //               ),
// //             ),
// //           ),
// //           validator: (value) {
// //             if (value!.isEmpty) {
// //               return "Enter email id";
// //             } else {
// //               return "Enter valid email";
// //             }
// //           },
// //         ),
// //         const SizedBox(
// //           height: 12.0,
// //         ),
// //       ],
// //     );
// //   }

// //   // @override
// //   // void dispose() {
// //   //   super.dispose();
// //   //   widget.textEditingController.dispose();
// //   // }
// // }

// class AppTextField1 extends StatefulWidget {
//   const AppTextField1({
//     Key? key,
//   }) : super(key: key);

//   @override
//   AppTextFieldState1 createState() => AppTextFieldState1();
// }

// class AppTextFieldState1 extends State<AppTextField1> {
//   final TextEditingController _searchTextEditingController =
//       TextEditingController();
//   final TextEditingController servicetypeTextEditingController =
//       TextEditingController();
//   // final TextBloc _textBloc = TextBloc();
//   // final TextControllers text = TextControllers();
//   final TextEditingController _properyTextEditingController =
//       TextEditingController();
//   final TextEditingController _locationTextEditingController =
//       TextEditingController();
//   final TextEditingController _descripitionTextEditingController =
//       TextEditingController();
//   final TextEditingController _detailedDescripitionTextEditingController =
//       TextEditingController();

//   late List<dynamic> service;
//   late List<dynamic> property;
//   dynamic locData;
//   List<dynamic>? locationData;

//   String? id;
//   ServiceType? ser;

//   String? dropdownValue;
// //final MyBloc _myBloc = MyBloc();
//   List<dynamic> _listOfCities = [];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
// //  servicetypeTextEditingController.addListener(() {
// //       _myBloc.updateText(servicetypeTextEditingController.text);
// //     });
//     _getDataProperty();
//     _getDataService();
//     //iD(id);
//   }

//   void _getDataService() async {
//     service = (await CreateJobService().createJobService());
//     print(service);
//     Future.delayed(const Duration(seconds: 0)).then((value) => setState(
//           () {},
//         ));
//     print('hi');

//     print(service[0]['name']);
//     print(ser);
//     print(_listOfCities);
//     // print("welcome${ser?.name}");
//     // print(_listOfCities[0].name);
//   }

//   void _getDataProperty() async {
//     property = (await CreateJobService().properties());
//     print(service);
//     setState(
//       () {},
//     );
//     print('hi');

//     print(service[0]['name']);

//     print(_listOfCities);
//   }

//   Future<void> locationGetData(id) async {
//     locData = (await (CreateJobService().location(id)));
//     // locData = await .fetchPosts(id);
// //final jsonData = LoctaionServiceType.fromJson(locData);
//     Future.delayed(const Duration(seconds: 0)).then((value) => setState(() {}));
//     print('location data : ${locData.toString()}');
//     locationData = locData;
//   }

//   /// This is on text changed method which will display on city text field on changed.
//   void onTextFieldTapService() {
//     DropDownState(
//       DropDownCopy(
//         bottomSheetTitle: Text(
//           'Service Type',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20.0,
//           ),
//         ),
//         submitButtonChild: const Text(
//           'Done',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         data: service,
//         selectedItems: (List<dynamic> selectedList) {
//           List<String> list = [];
//           for (var item in selectedList) {
//             if (item is dynamic) {
//               list.add(item['name']);
//               print(item['name']);
//               String name = item['name'];
//               setState(() {
//                 // list[0] = dropdownValue!;
//                 servicetypeTextEditingController.text = name;
//                 //text.emailController.value.text = name;
//               });
//               print(service);
//               print(list);
//               print('st${servicetypeTextEditingController.text}');
//             }
//           }
//           showSnackBar(list.toString());
//         },
//         //enableMultipleSelection: true,
//       ),
//     ).showModal(context);
//   }

//   /// This is on text changed method which will display on city text field on changed.
//   void onTextFieldTapProperty() async {
//     DropDownState(
//       DropDownCopy(
//         bottomSheetTitle: Text(
//           'Property',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20.0,
//           ),
//         ),
//         submitButtonChild: const Text(
//           'Done',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         data: property,
//         selectedItems: (List<dynamic> selectedList) async {
//           List<String> list = [];
//           for (var item in selectedList) {
//             if (item is dynamic) {
//               list.add(item['name']);
//               print(list);
//               print(item['id']);
//               setState(() {
//                 // list[0] = dropdownValue!;
//                 _properyTextEditingController.text = item['name'];
//               });
//               setState(() {
//                 id = item['id'];
//                 locationGetData(id);
//               });
//               print('aaaaa$id');
//             }
//           }
//           showSnackBar(list.toString());
//           // Navigator.pop(context, list);
//         },
//         //enableMultipleSelection: true,
//       ),
//     ).showModal(context);
//   }

//   void showSnackBar(String message) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }

//   void onTextFieldTapLoc() {
//     DropDownLocationState(
//       DropDownLocation(
//         bottomSheetTitle: Text(
//           'Location',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20.0,
//           ),
//         ),
//         submitButtonChild: const Text(
//           'Done',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         data: locationData,

//         selectedItems: (List<dynamic> selectedList) {
//           List<String> list = [];
//           for (var item in selectedList) {
//             if (item is dynamic) {
//               setState(() {
//                 _locationTextEditingController.text = item['address'];
//               });
//               list.add(item['address']);
//               print('list of item$list');
//               print(service);
//             }
//           }
//           showSnackBarLoc(list.toString());
//         },
//         //enableMultipleSelection: true,
//       ),
//     ).showModal(context);
//   }

//   void showSnackBarLoc(String message) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'ServiceType',
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 15.0,
//               color: Color.fromARGB(255, 20, 56, 103)),
//         ),
//         const SizedBox(
//           height: 5.0,
//         ),
//         TextFormField(
//           //initialValue: dropdownValue,

//           readOnly: true,
//           //  controller: text.emailController.value,
//           controller: servicetypeTextEditingController,

//           onTap: () {
//             FocusScope.of(context).unfocus();
//             onTextFieldTapService();

//             //CreateJobService().createJobService();
//           },
//           decoration: InputDecoration(
//             contentPadding:
//                 const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 10),
//             hintText: 'Select',
//             hintStyle: const TextStyle(fontSize: 14, color: Colors.black45),
//             suffixIcon: const Icon(
//               Icons.keyboard_arrow_down_sharp,
//               size: 30,
//             ),
//             border: const OutlineInputBorder(
//               borderSide: BorderSide(),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(8.0),
//               ),
//             ),
//           ),
//           validator: (value) {
//             if (value!.isEmpty) {
//               return "Enter email id";
//             } else {
//               return "Enter valid email";
//             }
//           },
//         ),
//         const SizedBox(
//           height: 12.0,
//         ),
//         Text(
//           'Property',
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 15.0,
//               color: Color.fromARGB(255, 20, 56, 103)),
//         ),
//         const SizedBox(
//           height: 5.0,
//         ),
//         TextFormField(
//           readOnly: true,
//           controller: _properyTextEditingController,
//           //cursorColor: Colors.black,
//           onTap: () {
//             FocusScope.of(context).unfocus();
//             onTextFieldTapProperty();

//             //CreateJobService().createJobService();
//           },
//           decoration: InputDecoration(
//             contentPadding:
//                 const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 10),
//             hintText: 'Select',
//             hintStyle: const TextStyle(fontSize: 14, color: Colors.black45),
//             suffixIcon: const Icon(
//               Icons.keyboard_arrow_down_sharp,
//               size: 30,
//             ),
//             border: const OutlineInputBorder(
//               borderSide: BorderSide(
//                 width: 0,
//                 //  style: BorderStyle.none,
//               ),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(8.0),
//               ),
//             ),
//           ),
//           validator: (value) {
//             if (value!.isEmpty) {
//               return "Enter email id";
//             } else {
//               return "Enter valid email";
//             }
//           },
//         ),
//         const SizedBox(
//           height: 12.0,
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Location',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15.0,
//                   color: Color.fromARGB(255, 20, 56, 103)),
//             ),
//             const SizedBox(
//               height: 5.0,
//             ),
//             TextFormField(
//               readOnly: true,
//               controller: _locationTextEditingController,
//               // cursorColor: Colors.black,
//               onTap: () {
//                 FocusScope.of(context).unfocus();
//                 onTextFieldTapLoc();

//                 //CreateJobService().createJobService();
//               },

//               decoration: InputDecoration(
//                 contentPadding: const EdgeInsets.only(
//                     left: 10, bottom: 10, top: 10, right: 10),
//                 hintText: 'Select',
//                 hintStyle: const TextStyle(fontSize: 14, color: Colors.black45),
//                 suffixIcon: const Icon(
//                   Icons.keyboard_arrow_down_sharp,
//                   size: 30,
//                 ),
//                 border: const OutlineInputBorder(
//                   borderSide: BorderSide(
//                     width: 0,
//                     // style: BorderStyle.none,
//                   ),
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(8.0),
//                   ),
//                 ),
//               ),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return "Enter email id";
//                 } else {
//                   return "Enter valid email";
//                 }
//               },
//             ),
//             const SizedBox(
//               height: 12.0,
//             ),
//             Text(
//               'Brief Descripition',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15.0,
//                   color: Color.fromARGB(255, 20, 56, 103)),
//             ),
//             const SizedBox(
//               height: 5.0,
//             ),
//             TextFormField(
//               // readOnly: true,
//               controller: _descripitionTextEditingController,

//               maxLines: 4,
//               decoration: InputDecoration(
//                 contentPadding: const EdgeInsets.only(
//                     left: 10, bottom: 10, top: 10, right: 10),
//                 hintText: 'Descripition',
//                 hintStyle: const TextStyle(fontSize: 14, color: Colors.black45),
//                 border: const OutlineInputBorder(
//                   borderSide: BorderSide(
//                     width: 0,
//                     //style: BorderStyle.none,
//                   ),
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(8.0),
//                   ),
//                 ),
//               ),
//               // validator: (value) {
//               //   if (value!.isEmpty) {
//               //     return "Enter email id";
//               //   } else {
//               //     return "Enter valid email";
//               //   }
//               // },
//             ),
//             const SizedBox(
//               height: 12.0,
//             ),
//             Text(
//               'Detailed Descripition',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15.0,
//                   color: Color.fromARGB(255, 20, 56, 103)),
//             ),
//             const SizedBox(
//               height: 5.0,
//             ),
//             TextFormField(
//               controller: _detailedDescripitionTextEditingController,
//               // cursorColor: Colors.black,

//               maxLines: 4,
//               decoration: InputDecoration(
//                 contentPadding: const EdgeInsets.only(
//                     left: 10, bottom: 10, top: 10, right: 10),
//                 hintText: 'Descripition',
//                 hintStyle: const TextStyle(fontSize: 14, color: Colors.black45),
//                 border: const OutlineInputBorder(
//                   borderSide: BorderSide(
//                     width: 0,
//                     //style: BorderStyle.none,
//                   ),
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(8.0),
//                   ),
//                 ),
//               ),
//               // validator: (value) {
//               //   if (value!.isEmpty) {
//               //     return "Enter email id";
//               //   } else {
//               //     return "Enter valid email";
//               //   }
//               // },
//             ),
//             const SizedBox(
//               height: 12.0,
//             ),
//           ],
//         ),
//       ],
//     );
//   }

  // @override
  // void dispose() {
  //   super.dispose();
  //   widget.textEditingController.dispose();
  //}

  // loadLocation(id) async {
  //   service = (await CreateJobService().location(id));
  //   Future.delayed(const Duration(seconds: 0)).then((value) => setState(
  //         () {},
  //       ));
  //   print(service);
  //   //return ser;
  // }
//}

// class AppTextField3 extends StatefulWidget {
//   final TextEditingController textEditingController;
//   final String title;
//   final String hint;

//   //final List<SelectedListItem>? cities;

//   const AppTextField3({
//     required this.textEditingController,
//     required this.title,
//     required this.hint,

//     // this.cities,
//     Key? key,
//   }) : super(key: key);

//   @override
//   _AppTextFieldState3 createState() => _AppTextFieldState3();
// }

// class _AppTextFieldState3 extends State<AppTextField3> {
//   final TextEditingController _searchTextEditingController =
//       TextEditingController();
//   late List<dynamic> service;
//   ServiceType? ser;
//   List<dynamic> _listOfCities = [];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   /// This is on text changed method which will display on city text field on changed.

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           widget.title,
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 15.0,
//               color: Color.fromARGB(255, 20, 56, 103)),
//         ),
//         const SizedBox(
//           height: 5.0,
//         ),
//         TextFormField(
//           // readOnly: true,
//           controller: widget.textEditingController,

//           maxLines: 4,
//           decoration: InputDecoration(
//             contentPadding:
//                 const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
//             hintText: widget.hint,
//             hintStyle: const TextStyle(fontSize: 14, color: Colors.black45),
//             border: const OutlineInputBorder(
//               borderSide: BorderSide(
//                 width: 0,
//                 //style: BorderStyle.none,
//               ),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(8.0),
//               ),
//             ),
//           ),
//           // validator: (value) {
//           //   if (value!.isEmpty) {
//           //     return "Enter email id";
//           //   } else {
//           //     return "Enter valid email";
//           //   }
//           // },
//         ),
//         const SizedBox(
//           height: 12.0,
//         ),
//       ],
//     );
//   }

//   // @override
//   // void dispose() {
//   //   super.dispose();
//   //   widget.textEditingController.dispose();
//   // }
// }

// class AppTextField4 extends StatefulWidget {
//   final TextEditingController textEditingController;
//   final String title;
//   final String hint;

//   //final List<SelectedListItem>? cities;

//   const AppTextField4({
//     required this.textEditingController,
//     required this.title,
//     required this.hint,

//     // this.cities,
//     Key? key,
//   }) : super(key: key);

//   @override
//   _AppTextFieldState4 createState() => _AppTextFieldState4();
// }

// class _AppTextFieldState4 extends State<AppTextField4> {
//   final TextEditingController _searchTextEditingController =
//       TextEditingController();
//   late List<dynamic> service;
//   ServiceType? ser;
//   List<dynamic> _listOfCities = [];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   /// This is on text changed method which will display on city text field on changed.

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           widget.title,
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 15.0,
//               color: Color.fromARGB(255, 20, 56, 103)),
//         ),
//         const SizedBox(
//           height: 5.0,
//         ),
//         TextFormField(
//           controller: widget.textEditingController,
//           // cursorColor: Colors.black,

//           maxLines: 4,
//           decoration: InputDecoration(
//             contentPadding:
//                 const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
//             hintText: widget.hint,
//             hintStyle: const TextStyle(fontSize: 14, color: Colors.black45),
//             border: const OutlineInputBorder(
//               borderSide: BorderSide(
//                 width: 0,
//                 //style: BorderStyle.none,
//               ),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(8.0),
//               ),
//             ),
//           ),
//           // validator: (value) {
//           //   if (value!.isEmpty) {
//           //     return "Enter email id";
//           //   } else {
//           //     return "Enter valid email";
//           //   }
//           // },
//         ),
//         const SizedBox(
//           height: 12.0,
//         ),
//       ],
//     );
//   }

// @override
// void dispose() {
//   super.dispose();
//   widget.textEditingController.dispose();
// }
//}

/// This is common class for 'REGISTER' elevated button.
// class _AppElevatedButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       height: 40.0,
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.push(
//               context,
//               new MaterialPageRoute(
//                   builder: (BuildContext context) => new JobScreen2()));
//         },
//         child: const Text(
//           'Next',
//           style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
//         ),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Color.fromARGB(255, 222, 105, 70),
//           textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
