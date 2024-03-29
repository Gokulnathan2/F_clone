// import 'package:drop_down_list/drop_down_list.dart';
// import 'package:drop_down_list/model/selected_list_item.dart';
// import 'package:flutter/material.dart';
// import 'package:gokul_f/layouts/drop_down.dart';
// import 'package:gokul_f/layouts/stepper.dart';
// import 'package:gokul_f/model/selected_type.dart';
// import 'package:gokul_f/model/service_model.dart';

// //import 'constants.dart';

// class JobScreen2 extends StatefulWidget {
//   const JobScreen2({
//     Key? key,
//   }) : super(key: key);

//   @override
//   JobScreen2State createState() => JobScreen2State();
// }

// class JobScreen2State extends State<JobScreen2> {
//   /// This is list of city which will pass to the drop down.
//   final List<ServiceType> _listOfCities = [];

//   /// This is register text field controllers.
//   final TextEditingController _fullNameTextEditingController =
//       TextEditingController();
//   final TextEditingController _emailTextEditingController =
//       TextEditingController();
//   final TextEditingController _phoneNumberTextEditingController =
//       TextEditingController();
//   final TextEditingController _cityTextEditingController =
//       TextEditingController();
//   final TextEditingController _passwordTextEditingController =
//       TextEditingController();

//   @override
//   void dispose() {
//     super.dispose();
//     _fullNameTextEditingController.dispose();
//     _emailTextEditingController.dispose();
//     _phoneNumberTextEditingController.dispose();
//     _cityTextEditingController.dispose();
//     _passwordTextEditingController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 4, 31, 68),
//           title: const Text(
//             'Create Job Request',
//           ),
//           leading: (Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 // child: Positioned(
//                 //child: AppBar(

//                 child: IconButton(
//                   onPressed: () => Navigator.of(context).pop(),
//                   icon: Icon(
//                     Icons.arrow_back,
//                     color: Colors.white,
//                     size: 30,
//                   ),
//                 ),
//                 //   backgroundColor: Colors.transparent,
//                 //   elevation: 0.0,
//                 // ),
//                 // ),
//               ),
//             ],
//           ))),
//       body: SafeArea(
//         child: mainBody(),
//       ),
//     );
//   }

//   /// This is Main Body widget.
//   Widget mainBody() {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(
//             height: 30.0,
//           ),
//           // const Text(
//           //   ' kRegister',
//           //   style: TextStyle(
//           //     fontSize: 34.0,
//           //     fontWeight: FontWeight.bold,
//           //   ),
//           // ),
//           // const SizedBox(
//           //   height: 15.0,
//           // ),
//           AppTextField(
//             textEditingController: _cityTextEditingController,
//             title: 'Maintenance Category',
//             hint: 'Select',
//             isCitySelected: true,
//             cities: _listOfCities,
//           ),
//           AppTextField(
//             textEditingController: _cityTextEditingController,
//             title: 'Priority',
//             hint: 'Select',
//             isCitySelected: true,
//             cities: _listOfCities,
//           ),
//           // AppTextField(
//           //   textEditingController:  _cityTextEditingController,
//           //   title: 'Service Type',
//           //   hint: 'Select',
//           //   isCitySelected: true,
//           //   cities: _listOfCities,
//           // ),

//           AppTextField(
//             textEditingController: _passwordTextEditingController,
//             title: 'Brief Descripition',
//             hint: 'Description',
//             isCitySelected: false,
//           ),
//           AppTextField(
//             textEditingController: _passwordTextEditingController,
//             title: 'Detailed Descripition',
//             hint: 'Description',
//             isCitySelected: false,
//           ),
//           const SizedBox(
//             height: 15.0,
//           ),
//           _AppElevatedButton(),
//         ],
//       ),
//     );
//   }
// }

// /// This is Common App textfiled class.
// class AppTextField extends StatefulWidget {
//   final TextEditingController textEditingController;
//   final String title;
//   final String hint;
//   final bool isCitySelected;
//   final List<ServiceType>? cities;

//   const AppTextField({
//     required this.textEditingController,
//     required this.title,
//     required this.hint,
//     required this.isCitySelected,
//     this.cities,
//     Key? key,
//   }) : super(key: key);

//   @override
//   _AppTextFieldState createState() => _AppTextFieldState();
// }

// class _AppTextFieldState extends State<AppTextField> {
//   final TextEditingController _searchTextEditingController =
//       TextEditingController();

//   /// This is on text changed method which will display on city text field on changed.
//   void onTextFieldTap() {
//     DropDownState(
//       DropDownCopy(
//         bottomSheetTitle: const Text(
//           'kCities',
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
//         data: widget.cities ?? [],
//         selectedItems: (List<dynamic> selectedList) {
//           List<String> list = [];
//           for (var item in selectedList) {
//             if (item is SelectedListItem) {
//               list.add(item.name);
//             }
//           }
//           showSnackBar(list.toString());
//         },
//         //enableMultipleSelection: true,
//       ),
//     ).showModal(context);
//   }

//   void showSnackBar(String message) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(widget.title),
//         const SizedBox(
//           height: 5.0,
//         ),
//         TextFormField(
//           controller: widget.textEditingController,
//           cursorColor: Colors.black,
//           onTap: widget.isCitySelected
//               ? () {
//                   FocusScope.of(context).unfocus();
//                   onTextFieldTap();
//                 }
//               : null,
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: Colors.black12,
//             contentPadding:
//                 const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
//             hintText: widget.hint,
//             border: const OutlineInputBorder(
//               borderSide: BorderSide(
//                 width: 0,
//                 style: BorderStyle.none,
//               ),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(8.0),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 15.0,
//         ),
//       ],
//     );
//   }
// }

// /// This is common class for 'REGISTER' elevated button.
// class _AppElevatedButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       height: 60.0,
//       child: ElevatedButton(
//         onPressed: () {},
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
