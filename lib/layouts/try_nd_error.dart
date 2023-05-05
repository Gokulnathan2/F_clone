// import 'package:drop_down_list/drop_down_list.dart';
// import 'package:flutter/material.dart';

// class MyDropDown extends DropDown {
//  final List<dynamic> data;

//   /// This will give the call back to the selected items from list.
//   final Function(List<dynamic>)? selectedItems;

//   /// [listBuilder] will gives [index] as a function parameter and you can return your own widget based on [index].
//   final Widget Function(int index)? listBuilder;

//   /// This will give selection choice for single or multiple for list.
//   final bool enableMultipleSelection;

//   /// This gives the bottom sheet title.
//   final Widget? bottomSheetTitle;

//   /// You can set your custom submit button when the multiple selection is enabled.
//   final Widget? submitButtonChild;

//   /// [searchWidget] is use to show the text box for the searching.
//   /// If you are passing your own widget then you must have to add [TextEditingController] for the [TextFormField].
//   final TextFormField? searchWidget;

//   /// [isSearchVisible] flag use to manage the search widget visibility
//   /// by default it is [True] so widget will be visible.
//   final bool isSearchVisible;

//   /// This will set the background color to the dropdown.
//   final Color dropDownBackgroundColor;

//   MyDropDown({
//       Key? key,
//     required this.data,
//     this.selectedItems,
//     this.listBuilder,
//     this.enableMultipleSelection = false,
//     this.bottomSheetTitle,
//     this.submitButtonChild,
//     this.searchWidget,
//     this.isSearchVisible = true,
//     this.dropDownBackgroundColor = Colors.transparent,
//   });
//   // Add your modifications or customizations here

// }

// class MyDropDownList extends DropDownState {
//   MyDropDown dropDown;
//    MyDropDownList(this.dropDown);
//   // Customizations go here
//   void showModal(context) {
//     showModalBottomSheet(
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
//       ),
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return MainBody(dropDown: dropDown);
//           },
//         );
//       },
//     );
//   }

// }
// class MainBody extends StatefulWidget {
//   final DropDown dropDown;

//   const MainBody({required this.dropDown, Key? key}) : super(key: key);

//   @override
//   State<MainBody> createState() => _MainBodyState();
// }

// class _MainBodyState extends State<MainBody> {
//   /// This list will set when the list of data is not available.
//   List<dynamic> mainList = [];

//   @override
//   void initState() {
//     super.initState();
//     mainList = widget.dropDown.data;
//     _setSearchWidgetListener();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       initialChildSize: 0.7,
//       minChildSize: 0.13,
//       maxChildSize: 0.9,
//       expand: false,
//       builder: (BuildContext context, ScrollController scrollController) {
//         return Column(
//           children: <Widget>[
//             Padding(
//               padding:
//                   const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   /// Bottom sheet title text
//                   Expanded(
//                       child: widget.dropDown.bottomSheetTitle ?? Container()),

//                   /// Done button
//                   Visibility(
//                     visible: widget.dropDown.enableMultipleSelection,
//                     child: Align(
//                       alignment: Alignment.centerRight,
//                       child: Material(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             List<dynamic> selectedList = widget
//                                 .dropDown.data
//                                 .where((element) => element.isSelected == true)
//                                 .toList();
//                             List<dynamic> selectedNameList = [];

//                             for (var element in selectedList) {
//                               selectedNameList.add(element);
//                             }

//                             widget.dropDown.selectedItems
//                                 ?.call(selectedNameList);
//                             _onUnFocusKeyboardAndPop();
//                           },
//                           child: widget.dropDown.submitButtonChild ??
//                               const Text('Done'),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             /// A [TextField] that displays a list of suggestions as the user types with clear button.
//             Visibility(
//               visible: widget.dropDown.isSearchVisible,
//               child: widget.dropDown.searchWidget ??
//                   AppTextField(
//                     dropDown: widget.dropDown,
//                     onTextChanged: _buildSearchList,
//                   ),
//             ),

//             /// Listview (list of data with check box for multiple selection & on tile tap single selection)
//             Expanded(
//               child: ListView.builder(
//                 controller: scrollController,
//                 itemCount: mainList.length,
//                 itemBuilder: (context, index) {
//                   bool isSelected = mainList[index].isSelected ?? false;
//                   return InkWell(
//                     child: Container(
//                       color: widget.dropDown.dropDownBackgroundColor,
//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
//                         child: ListTile(
//                           title: widget.dropDown.listBuilder?.call(index) ??
//                               Text(
//                                 mainList[index].name,
//                               ),
//                           trailing: widget.dropDown.enableMultipleSelection
//                               ? GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       mainList[index].isSelected = !isSelected;
//                                     });
//                                   },
//                                   child: isSelected
//                                       ? const Icon(Icons.check_box)
//                                       : const Icon(
//                                           Icons.check_box_outline_blank),
//                                 )
//                               : const SizedBox(
//                                   height: 0.0,
//                                   width: 0.0,
//                                 ),
//                         ),
//                       ),
//                     ),
//                     onTap: widget.dropDown.enableMultipleSelection
//                         ? null
//                         : () {
//                             widget.dropDown.selectedItems
//                                 ?.call([mainList[index]]);
//                             _onUnFocusKeyboardAndPop();
//                           },
//                   );
//                 },
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   /// This helps when search enabled & show the filtered data in list.
//   _buildSearchList(String userSearchTerm) {
//     final results = widget.dropDown.data
//         .where((element) =>
//             element.name.toLowerCase().contains(userSearchTerm.toLowerCase()))
//         .toList();
//     if (userSearchTerm.isEmpty) {
//       mainList = widget.dropDown.data;
//     } else {
//       mainList = results;
//     }
//     setState(() {});
//   }

//   /// This helps to UnFocus the keyboard & pop from the bottom sheet.
//   _onUnFocusKeyboardAndPop() {
//     FocusScope.of(context).unfocus();
//     Navigator.of(context).pop();
//   }

//   void _setSearchWidgetListener() {
//     TextFormField? _searchField =
//         (widget.dropDown.searchWidget as TextFormField?);
//     _searchField?.controller?.addListener(() {
//       _buildSearchList(_searchField.controller?.text ?? '');
//     });
//   }
// }
// class AppTextField extends StatefulWidget {
//   final DropDown? dropDown;
//   final Function(String) onTextChanged;

//   const AppTextField({this.dropDown, required this.onTextChanged, Key? key})
//       : super(key: key);

//   @override
//   State<AppTextField> createState() => _AppTextFieldState();
// }

// class _AppTextFieldState extends State<AppTextField> {
//   final TextEditingController _editingController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: TextFormField(
//         controller: _editingController,
//         cursorColor: Colors.black,
//         onChanged: (value) {
//           widget.onTextChanged(value);
//         },
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: Colors.black12,
//           contentPadding:
//               const EdgeInsets.only(left: 0, bottom: 0, top: 0, right: 15),
//           hintText: 'Search',
//           border: const OutlineInputBorder(
//             borderSide: BorderSide(
//               width: 0,
//               style: BorderStyle.none,
//             ),
//             borderRadius: BorderRadius.all(
//               Radius.circular(8.0),
//             ),
//           ),
//           prefixIcon: const IconButton(
//             icon: Icon(Icons.search),
//             onPressed: null,
//           ),
//           suffixIcon: GestureDetector(
//             onTap: onClearTap,
//             child: const Icon(
//               Icons.cancel,
//               color: Colors.grey,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void onClearTap() {
//     _editingController.clear();
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;

// class CalendarTextFormField extends StatefulWidget {
//   @override
//   _CalendarTextFormFieldState createState() => _CalendarTextFormFieldState();
// }

// class _CalendarTextFormFieldState extends State<CalendarTextFormField> {
//   TextEditingController _dateController = TextEditingController();
//   void _showDatePicker(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(DateTime.now().year - 5),
//       lastDate: DateTime(DateTime.now().year + 5),
//       builder: (BuildContext context, Widget? child) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Theme(
//               data: ThemeData.light().copyWith(
//                 colorScheme: ColorScheme.light().copyWith(
//                   primary:
//                       Colors.blue, // Set the primary color for the date picker
//                 ),
//               ),
//               child: child!,
//             );
//           },
//         );
//       },
//     );

//     if (picked != null) {
//       // Update the text input with the selected date
//       setState(() {
//         _dateController.text = picked.toString();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: TextFormField(
//         controller: _dateController,
//         readOnly: true,
//         onTap: () {
//           _showDatePicker(context);
//         },
//         decoration: InputDecoration(
//           labelText: 'Select Date',
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'dart:async'; // Import the dart:async package

// class CalendarTextFormField extends StatefulWidget {
//   @override
//   _CalendarTextFormFieldState createState() => _CalendarTextFormFieldState();
// }

// class _CalendarTextFormFieldState extends State<CalendarTextFormField> {
//   TextEditingController _textEditingController = TextEditingController();
//   DateTime? _selectedDate;

//   String _formatDate(DateTime date) {
//     // Define your desired date format logic here
//     String day = date.day.toString().padLeft(2, '0');
//     String month = date.month.toString().padLeft(2, '0');
//     String year = date.year.toString();
//     return '$year-$month-$day';
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     // Create a Completer to control the completion of the Future
//     Completer<void> completer = Completer<void>();

//     await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Select Date'),
//           content: SingleChildScrollView(
//             child: Column(
//               children: [
//                 CalendarDatePicker(
//                   initialDate: _selectedDate ?? DateTime.now(),
//                   firstDate: DateTime(1900),
//                   lastDate: DateTime(2100),
//                   onDateChanged: (DateTime picked) {
//                     if (picked != null && picked != _selectedDate) {
//                       setState(() {
//                         _selectedDate = picked;
//                         _textEditingController.text =
//                             _formatDate(_selectedDate!);
//                       });
//                       completer
//                           .complete(); // Complete the Future when date is picked
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );

//     return completer.future; // Return the Future for proper async handling
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: _textEditingController,
//       onTap: () {
//         FocusScope.of(context).requestFocus(new FocusNode());
//         _selectDate(context);
//       },
//       readOnly: true,
//       decoration: InputDecoration(
//         labelText: 'Select Date',
//         suffixIcon: Icon(Icons.calendar_today),
//         border: OutlineInputBorder(),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class MyChangeNotifier with ChangeNotifier {
//   final TextEditingController controller;

//   MyChangeNotifier(this.controller);

//   void updateText(String text) {
//     controller.text = text;
//     notifyListeners();
//   }
// }
// import 'package:dio/dio.dart';

// import 'package:flutter/material.dart';

// class CreateJobsScreen extends StatefulWidget {
//   const CreateJobsScreen({super.key});

//   @override
//   State<CreateJobsScreen> createState() => _CreateJobsScreenState();
// }

// class _CreateJobsScreenState extends State<CreateJobsScreen> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 1, 48, 92),
//         leading: IconButton(
//             onPressed: () {
//               // if (currentStep >= 1) {
//               //   setState(() => currentStep -= 1);
//               // } else if (currentStep == 0) {
//               //   Navigator.of(context).pop();
//               // }
//             },
//             icon: const Icon(Icons.arrow_back_sharp)),
//         centerTitle: true,
//         title: const Text("Create Jobs Request"),
//         actions: [
//           TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text(
//                 "cancel",
//                 style: TextStyle(color: Colors.white),
//               ))
//         ],
//       ),
//       body: Theme(
//         data: Theme.of(context).copyWith(
//           colorScheme:
//               const ColorScheme.light(primary: Color.fromARGB(255, 230, 81, 0)),
//           iconTheme: Theme.of(context).iconTheme.copyWith(size: 32.0),
//         ),
//         child: Stepper(
//           margin: EdgeInsets.zero,
//           type: StepperType.horizontal,
//           steps: getSteps(),
//        //   currentStep: currentStep,
//           // onStepContinue: () {
//           //   final isLastStep = currentStep == getSteps().length - 1;
//           //   if (isLastStep) {
//           //     print('Steps Completed');
//           //   } else {
//           //     setState(() {
//           //       //currentStep += 1;
//           //     });
//           //   }
//           // },
//           onStepCancel:
//               currentStep == 0 ? null : () => setState(() => currentStep -= 1),
//           controlsBuilder: (BuildContext context, ControlsDetails details) {
//             final isLastStep = currentStep == getSteps().length - 1;

//             return Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 //color: Colors.grey.shade100,
//                 margin: const EdgeInsets.only(top: 20),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: ClickButton(
//                         onpressed: details.onStepContinue,
//                         child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
//                       ),
//                     ),
//                     if (currentStep == 2)
//                       Expanded(
//                         child: ClickButton(
//                           onpressed: details.onStepCancel,
//                           child: const Text('BACK'),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   List<Step> getSteps() => [
//         Step(
//             state: currentStep > 0 ? StepState.complete : StepState.indexed,
//             isActive: currentStep >= 0,
//             title: const Text('1st'),
//             content: Stack(
//               fit: StackFit.loose,
//               //color: Colors.white,
//               children: [
//                 Column(
//                   //mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Service*",
//                       textAlign: TextAlign.start,
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
//                       child: ReuseTextFields(
//                         hinttext: 'Select',
//                         inputfieldcolor: Colors.white,
//                         maxLines: 1,
//                         password: false,
//                         readOnly: false,
//                         showCursor: false,
//                         controller: TextEditingController(text: printService),
//                         textAlign: TextAlign.left,
//                         onTap: () async {
//                           await showModalBottomSheet(
//                               isScrollControlled: true,
//                               shape: const RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.vertical(
//                                       top: Radius.circular(15))),
//                               context: context,
//                               builder: (context) {
//                                 return DropDownUiScreen(
//                                   titleText: 'Service',
//                                   listData: serviceData!,
//                                   itemBuilder: (context, index) {
//                                     return Container(
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                                 0.02,
//                                         decoration: const BoxDecoration(
//                                           color: Color.fromARGB(
//                                               255, 248, 246, 246),
//                                         ),
//                                         child: ListTile(
//                                           title: Text(
//                                             serviceData![index]['name']
//                                                 .toString(),
//                                             style: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 12),
//                                           ),
//                                           onTap: () {
//                                             setState(() {
//                                               printService =
//                                                   serviceData![index]['name'];
//                                             });

//                                             Navigator.of(context).pop();
//                                           },
//                                         ));
//                                   },
//                                 );
//                               });
//                         },
//                         suffixs: const Icon(
//                           Icons.keyboard_arrow_down_sharp,
//                           size: 30,
//                         ),
//                       ),
//                     ),
//                     const Text("Property*",
//                         textAlign: TextAlign.start,
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
//                       child: ReuseTextFields(
//                           hinttext: 'Select',
//                           inputfieldcolor: Colors.white,
//                           maxLines: 1,
//                           password: false,
//                           readOnly: false,
//                           showCursor: false,
//                           controller:
//                               TextEditingController(text: printProperty),
//                           textAlign: TextAlign.left,
//                           suffixs: const Icon(
//                             Icons.keyboard_arrow_down_sharp,
//                             size: 30,
//                           ),
//                           onTap: () async {
//                             await showModalBottomSheet(
//                                 isScrollControlled: true,
//                                 shape: const RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.vertical(
//                                         top: Radius.circular(15))),
//                                 context: context,
//                                 builder: (context) {
//                                   return DropDownUiScreen(
//                                     titleText: 'Property',
//                                     listData: propertyData!,
//                                     itemBuilder: (context, index) {
//                                       return Container(
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.02,
//                                           decoration: const BoxDecoration(
//                                             color: Color.fromARGB(
//                                                 255, 248, 246, 246),
//                                           ),
//                                           child: ListTile(
//                                             title: Text(
//                                               propertyData![index]['name']
//                                                   .toString(),
//                                               style: const TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 12),
//                                             ),
//                                             subtitle: Text(
//                                               propertyData![index]['address']
//                                                   .toString(),
//                                               style: const TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 12),
//                                               maxLines: 1,
//                                             ),
//                                             onTap: () {
//                                               setState(() {
//                                                 printProperty =
//                                                     propertyData![index]
//                                                         ['name'];
//                                                 print(
//                                                     "id: ${propertyData![index]['id']}");
//                                                 id = propertyData![index]['id'];
//                                                 locationGetData(id);
//                                               });

//                                               Navigator.of(context).pop();
//                                             },
//                                           ));
//                                     },
//                                   );
//                                 });
//                           }),
//                     ),
//                     const Text("Location*",
//                         textAlign: TextAlign.start,
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
//                       child: ReuseTextFields(
//                         hinttext: 'Select',
//                         inputfieldcolor: Colors.white,
//                         maxLines: 1,
//                         password: false,
//                         readOnly: false,
//                         showCursor: false,
//                         controller: TextEditingController(text: printLocation),
//                         textAlign: TextAlign.left,
//                         suffixs: const Icon(
//                           Icons.keyboard_arrow_down_sharp,
//                           size: 30,
//                         ),
//                         onTap: () async {
//                           await showModalBottomSheet(
//                               isScrollControlled: true,
//                               shape: const RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.vertical(
//                                       top: Radius.circular(15))),
//                               context: context,
//                               builder: (context) {
//                                 return DropDownUiScreen(
//                                   titleText: 'Location',
//                                   listData: locationData!,
//                                   itemBuilder: (context, index) {
//                                     locatData = locationData![index]['units'];
//                                     for (int index_ = 0;
//                                         index_ <= locatData!.length;
//                                         index_++) {}

//                                     return Container(
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                                 0.02,
//                                         decoration: const BoxDecoration(
//                                           color: Color.fromARGB(
//                                               255, 248, 246, 246),
//                                         ),
//                                         child: ListTile(
//                                           title: Text(
//                                             locationData![index]['address']
//                                                 .toString(),
//                                             style: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 12),
//                                           ),
//                                           subtitle: Text(
//                                             locatData![index]['name']
//                                                 .toString(),
//                                             style: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 12),
//                                             maxLines: 1,
//                                           ),
//                                           onTap: () {
//                                             setState(() {
//                                               printLocation =
//                                                   locationData![index]
//                                                       ['address'];
//                                             });

//                                             Navigator.of(context).pop();
//                                           },
//                                         ));
//                                   },
//                                 );
//                               });
//                         },
//                       ),
//                     ),
//                     const Text("Brief Description",
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
//                       child: ReuseTextFields(
//                         textAlign: TextAlign.left,
//                         hinttext: "Description",
//                         inputfieldcolor: Colors.white,
//                         maxLines: 4,
//                         controller: briefDescripController,
//                         password: false,
//                         readOnly: false,
//                       ),
//                     ),
//                     const Text("Detailed Description",
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             decoration: TextDecoration.none)),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
//                       child: ReuseTextFields(
//                         textAlign: TextAlign.left,
//                         hinttext: "Description",
//                         inputfieldcolor: Colors.white,
//                         maxLines: 4,
//                         controller: detailDescripController,
//                         password: false,
//                         readOnly: false,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             )),

//         //Second Step page.....
//         Step(
//           state: currentStep > 1 ? StepState.complete : StepState.indexed,
//           isActive: currentStep >= 1,
//           title: const Text('2nd'),
//           content: Container(
//             width: MediaQuery.of(context).size.width,
//             color: Colors.white,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Maintenance Category*",
//                   textAlign: TextAlign.start,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 //const SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
//                   child: ReuseTextFields(
//                     hinttext: 'Select',
//                     inputfieldcolor: Colors.white,
//                     maxLines: 1,
//                     password: false,
//                     readOnly: false,
//                     showCursor: false,
//                     textAlign: TextAlign.left,
//                     controller: TextEditingController(text: printCategory),
//                     onTap: () async {
//                       await showModalBottomSheet(
//                           isScrollControlled: true,
//                           shape: const RoundedRectangleBorder(
//                               borderRadius: BorderRadius.vertical(
//                                   top: Radius.circular(15))),
//                           context: context,
//                           builder: (context) {
//                             return DropDownUiScreen(
//                               titleText: 'Service',
//                               listData: categoryData!,
//                               itemBuilder: (context, index) {
//                                 return Container(
//                                     width: MediaQuery.of(context).size.width *
//                                         0.02,
//                                     decoration: const BoxDecoration(
//                                       color: Color.fromARGB(255, 248, 246, 246),
//                                     ),
//                                     child: ListTile(
//                                       title: Text(
//                                         categoryData![index]['name'].toString(),
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 12),
//                                       ),
//                                       onTap: () {
//                                         setState(() {
//                                           printCategory =
//                                               categoryData![index]['name'];
//                                         });

//                                         Navigator.of(context).pop();
//                                       },
//                                     ));
//                               },
//                             );
//                           });
//                     },
//                     suffixs: const Icon(
//                       Icons.keyboard_arrow_down_sharp,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 8.0),
//                   child: ListTile(
//                     title: const Text('Courtesy Job',
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 20)),
//                     trailing: Checkbox(
//                         checkColor: Colors.white,
//                         activeColor: Colors.orange[900],
//                         side: const BorderSide(
//                             width: 2, color: Color.fromARGB(255, 230, 81, 0)),
//                         value: _isChecked,
//                         onChanged: null),
//                   ),
//                 ),

//                 const Text("Priority",
//                     textAlign: TextAlign.start,
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
//                   child: ReuseTextFields(
//                     hinttext: 'Select',
//                     inputfieldcolor: Colors.white,
//                     maxLines: 1,
//                     password: false,
//                     readOnly: false,
//                     showCursor: false,
//                     textAlign: TextAlign.left,
//                     suffixs: const Icon(
//                       Icons.keyboard_arrow_down_sharp,
//                       size: 30,
//                     ),
//                   ),
//                 ),

//                 const Text("Target Completion Date",
//                     textAlign: TextAlign.start,
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
//                   child: ReuseTextFields(
//                     hinttext: 'Select',
//                     inputfieldcolor: Colors.white,
//                     maxLines: 1,
//                     password: false,
//                     readOnly: false,
//                     showCursor: false,
//                     textAlign: TextAlign.left,
//                     suffixs: const Icon(
//                       Icons.calendar_month_outlined,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//                 const Text("Add Photos",
//                     textAlign: TextAlign.start,
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
//                   child: Row(
//                     children: [
//                       GestureDetector(
//                         child: Container(
//                           width: 140,
//                           height: 40,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(6),
//                               color: const Color.fromARGB(255, 1, 30, 54)),
//                           child: Row(
//                             children: const [
//                               SizedBox(width: 8),
//                               Icon(
//                                 Icons.camera_alt_outlined,
//                                 size: 22,
//                                 color: Colors.white,
//                               ),
//                               SizedBox(width: 10),
//                               Text(
//                                 'Take Photo',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                       GestureDetector(
//                         child: Container(
//                           width: 150,
//                           height: 40,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(6),
//                               color: const Color.fromARGB(255, 1, 30, 54)),
//                           child: Row(
//                             children: const [
//                               SizedBox(width: 8),
//                               Icon(
//                                 Icons.file_upload_outlined,
//                                 size: 22,
//                                 color: Colors.white,
//                               ),
//                               SizedBox(width: 10),
//                               Text(
//                                 'Upload Photo',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16),
//                                 //strutStyle: StrutStyle(leading: 1),
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         Step(
//             isActive: currentStep >= 2,
//             title: const Text('3rd'),
//             content: Column(
//               children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//               ],
//             )),
//       ];

//   void onClearTap() {
//     searchEditingController.clear();
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// class TextBloc {
//   TextEditingController controller = TextEditingController();
// }

// class TextControllers extends GetxController {
//   Rx<TextEditingController> emailController = TextEditingController().obs;
// }
