// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// class Stepper extends StatefulWidget {
//   const Stepper({super.key});
//   @override
//   State<Stepper> createState() => _StepperState();
// }
// class _StepperState extends State<Stepper> {
//   @override
//   Widget build(BuildContext context) {
//     int currentStep = 0;
//     continueStep() {
//       if (currentStep < 2) {
//         setState(() {
//           currentStep = currentStep + 1; //currentStep+=1;
//         });
//       }
//     }
//     cancelStep() {
//       if (currentStep > 0) {
//         setState(() {
//           currentStep = currentStep - 1; //currentStep-=1;
//         });
//       }
//     }

//     onStepTapped(int value) {
//       setState(() {
//         currentStep = value;
//       });
//     }

//     Widget controlBuilders(context, details) {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             ElevatedButton(
//               onPressed: details.onStepContinue,
//               child: const Text('Next'),
//             ),
//             const SizedBox(width: 10),
//             OutlinedButton(
//               onPressed: details.onStepCancel,
//               child: const Text('Back'),
//             ),
//           ],
//         ),
//       );
//     }

//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         body: Stepper(
//           elevation: 0, //Horizontal Impact
//           // margin: const EdgeInsets.all(20), //vertical impact
//           controlsBuilder: controlBuilders,
//           type: StepperType.vertical,
//           physics: const ScrollPhysics(),
//           onStepTapped: onStepTapped,
//           onStepContinue: continueStep,
//           onStepCancel: cancelStep,
//           currentStep: currentStep, //0, 1, 2
//           steps: [
//             Step(
//                 title: const Text('Step 1'),
//                 content: Column(
//                   children: const [
//                     Text('This is the first step.'),
//                   ],
//                 ),
//                 isActive: currentStep >= 0,
//                 state:
//                     currentStep >= 0 ? StepState.complete : StepState.disabled),
//             Step(
//               title: const Text('Step 2'),
//               content: const Text('This is the Second step.'),
//               isActive: currentStep >= 0,
//               state: currentStep >= 1 ? StepState.complete : StepState.disabled,
//             ),
//             Step(
//               title: const Text('Step 3'),
//               content: const Text('This is the Third step.'),
//               isActive: currentStep >= 0,
//               state: currentStep >= 2 ? StepState.complete : StepState.disabled,
//             ),
//           ],
//         ),
//       );
//     }
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class MyStepper extends StatefulWidget {
//   const MyStepper({super.key});

//   @override
//   State<Stepper> createState() => _StepperState();
// }

// class _StepperState extends State<Stepper> {
//   @override
//   Widget build(BuildContext context) {
//     int currentStep = 0;
//     continueStep() {
//       if (currentStep < 2) {
//         setState(() {
//           currentStep = currentStep + 1; //currentStep+=1;
//         });
//       }
//     }

//     cancelStep() {
//       if (currentStep > 0) {
//         setState(() {
//           currentStep = currentStep - 1; //currentStep-=1;
//         });
//       }
//     }

//     onStepTapped(int value) {
//       setState(() {
//         currentStep = value;
//       });
//     }

//     Widget controlBuilders(context, details) {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             ElevatedButton(
//               onPressed: details.onStepContinue,
//               child: const Text('Next'),
//             ),
//             const SizedBox(width: 10),
//             OutlinedButton(
//               onPressed: details.onStepCancel,
//               child: const Text('Back'),
//             ),
//           ],
//         ),
//       );
//     }

//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         body: Stepper(
//           elevation: 0, //Horizontal Impact
//           // margin: const EdgeInsets.all(20), //vertical impact
//           controlsBuilder: controlBuilders,
//           type: StepperType.vertical,
//           physics: const ScrollPhysics(),
//           onStepTapped: onStepTapped,
//           onStepContinue: continueStep,
//           onStepCancel: cancelStep,
//           currentStep: currentStep, //0, 1, 2
//           steps: [
//             Step(
//                 title: const Text('Step 1'),
//                 content: Column(
//                   children: const [
//                     Text('This is the first step.'),
//                   ],
//                 ),
//                 isActive: currentStep >= 0,
//                 state:
//                     currentStep >= 0 ? StepState.complete : StepState.disabled),
//             Step(
//               title: const Text('Step 2'),
//               content: const Text('This is the Second step.'),
//               isActive: currentStep >= 0,
//               state: currentStep >= 1 ? StepState.complete : StepState.disabled,
//             ),
//             Step(
//               title: const Text('Step 3'),
//               content: const Text('This is the Third step.'),
//               isActive: currentStep >= 0,
//               state: currentStep >= 2 ? StepState.complete : StepState.disabled,
//             ),
//           ],
//         ),
//       );
//     }
//   }
// }
// import 'package:drop_down_list/model/selected_list_item.dart';
// import 'package:flutter/material.dart';
// import 'package:gokul_f/screens/job.dart';

// class MyStepper extends StatefulWidget {
//   const MyStepper({Key? key}) : super(key: key);

//   @override
//   State<MyStepper> createState() => _MyStepperState();
// }

// class _MyStepperState extends State<MyStepper> {
//   int currentStep = 0;
//   continueStep() {
//     if (currentStep < 2) {
//       setState(() {
//         currentStep = currentStep + 1; //currentStep+=1;
//       });
//     }
//   }

//   cancelStep() {
//     if (currentStep > 0) {
//       setState(() {
//         currentStep = currentStep - 1; //currentStep-=1;
//       });
//     }
//   }

//   onStepTapped(int value) {
//     setState(() {
//       currentStep = value;
//     });
//   }

//   Widget controlBuilders(context, details) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           ElevatedButton(
//             onPressed: details.onStepContinue,
//             child: const Text('Next'),
//           ),
//           const SizedBox(width: 10),
//           OutlinedButton(
//             onPressed: details.onStepCancel,
//             child: const Text('Back'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stepper(
//         elevation: 0, //Horizontal Impact
//         // margin: const EdgeInsets.all(20), //vertical impact
//         controlsBuilder: controlBuilders,
//         type: StepperType.vertical,
//         physics: const ScrollPhysics(),
//         onStepTapped: onStepTapped,
//         onStepContinue: continueStep,
//         onStepCancel: cancelStep,
//         currentStep: currentStep, //0, 1, 2
//         steps: [
//           Step(
//               title: const Text('Step 1'),
//               content: JobScreen(),
//               isActive: currentStep >= 0,
//               state:
//                   currentStep >= 0 ? StepState.complete : StepState.disabled),
//           Step(
//             title: const Text('Step 2'),
//             content: const Text('This is the Second step.'),
//             isActive: currentStep >= 0,
//             state: currentStep >= 1 ? StepState.complete : StepState.disabled,
//           ),
//           Step(
//             title: const Text('Step 3'),
//             content: const Text('This is the Third step.'),
//             isActive: currentStep >= 0,
//             state: currentStep >= 2 ? StepState.complete : StepState.disabled,
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:drop_down_list/drop_down_list.dart';
// import 'package:drop_down_list/model/selected_list_item.dart';
// import 'package:flutter/material.dart';

// class CheckoutPage extends StatefulWidget {
//   const CheckoutPage({Key? key}) : super(key: key);

//   @override
//   State<CheckoutPage> createState() => _CheckoutPageState();
// }

// class _CheckoutPageState extends State<CheckoutPage> {
//   static const _steps = [
//     Step(
//       title: Text('Address'),
//       content: JobScreen(),
//     ),
//     Step(
//       title: Text('Card Details'),
//       content: _CardForm(),
//     ),
//     Step(
//       title: Text('Overview'),
//       content: _Overview(),
//     )
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Checkout'),
//       ),
//       body: Stepper(
//         steps: _steps,
//       ),
//     );
//   }
// }

// class JobScreen extends StatefulWidget {
//   const JobScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   JobScreenState createState() => JobScreenState();
// }

// class JobScreenState extends State<JobScreen> {
//   /// This is list of city which will pass to the drop down.
//   final List<SelectedListItem> _listOfCities = [
//     SelectedListItem(
//       name: 'kTokyo',
//       value: "TYO",
//       isSelected: false,
//     ),
//     SelectedListItem(
//       name: 'kNewYork',
//       value: "NY",
//       isSelected: false,
//     ),
//     SelectedListItem(
//       name: 'kLondon',
//       value: "LDN",
//       isSelected: false,
//     ),
//     SelectedListItem(name: 'kParis'),
//     SelectedListItem(name: 'kMadrid'),
//     SelectedListItem(name: 'kDubai'),
//     SelectedListItem(name: 'kRome'),
//     SelectedListItem(name: 'kBarcelona'),
//     SelectedListItem(name: 'kCologne'),
//     SelectedListItem(name: 'kMonteCarlo'),
//     SelectedListItem(name: 'kPuebla'),
//     SelectedListItem(name: 'kFlorence'),
//   ];

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
//             title: 'Service Type',
//             hint: 'Select',
//             isCitySelected: true,
//             cities: _listOfCities,
//           ),
//           AppTextField(
//             textEditingController: _cityTextEditingController,
//             title: 'Property',
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
//             textEditingController: _cityTextEditingController,
//             title: 'Location',
//             hint: 'Select tenant & unit',
//             isCitySelected: true,
//             cities: _listOfCities,
//           ),
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
//   final List<SelectedListItem>? cities;

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
//       DropDown(
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

// class _CardForm extends StatelessWidget {
//   const _CardForm({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextFormField(
//           decoration: const InputDecoration(
//             labelText: 'Card number',
//           ),
//         ),
//         TextFormField(
//           decoration: const InputDecoration(
//             labelText: 'Expiry date',
//           ),
//         ),
//         TextFormField(
//           decoration: const InputDecoration(
//             labelText: 'CVV',
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _Overview extends StatelessWidget {
//   const _Overview({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: const [
//         Center(child: Text('Thank you for your order!')),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class CreateJobsScreen extends StatefulWidget {
//   const CreateJobsScreen({super.key});

//   @override
//   State<CreateJobsScreen> createState() => _CreateJobsScreenState();
// }

// class _CreateJobsScreenState extends State<CreateJobsScreen> {
//   MyFormState() {
//     selectItem = serviceTypeList[0];
//   }

//   int currentStep = 0;

//   final serviceTypeList = [
//     "Repair",
//     "Service",
//     "Inspection",
//     "Other",
//     "Preventive",
//     "Replacement"
//   ];
//   String selectItem = "";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade200,
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 1, 48, 92),
//         leading: IconButton(
//             onPressed: () => Navigator.of(context).pop(),
//             icon: const Icon(Icons.arrow_back_sharp)),
//         centerTitle: true,
//         title: const Text("Create Jobs Request"),
//         actions: [
//           TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text(
//                 "cancel",
//                 style: TextStyle(color: Colors.white),
//               ))
//         ],
//       ),
//       body: Stepper(
//         type: StepperType.horizontal,
//         steps: getSteps(),
//         currentStep: currentStep,
//         onStepContinue: () {
//           final isLastStep = currentStep == getSteps().length - 1;
//           if (isLastStep) {
//             print('Steps Completed');
//           } else {
//             setState(() => currentStep += 1);
//           }
//         },
//         onStepCancel:
//             currentStep == 0 ? null : () => setState(() => currentStep -= 1),
//       ),
//       // SafeArea(
//       //     maintainBottomViewPadding: true,
//       //     child:
//       // ),
//     );
//   }

//   List<Step> getSteps() => [
//         Step(
//             state: currentStep > 0 ? StepState.complete : StepState.indexed,
//             isActive: currentStep >= 0,
//             title: const Text('1st step'),
//             content: Column(
//               children: [
//                 Container(
//                   color: Colors.white,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Service*",
//                         textAlign: TextAlign.start,
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       //const SizedBox(height: 10),
//                       // SelectionOptionField(
//                       //   items: serviceTypeList
//                       //       .map((e) =>
//                       //           DropdownMenuItem(value: e, child: Text(e)))
//                       //       .toList(),
//                       //   onChange: (value) {
//                       //     setState(() {
//                       //       selectItem = value as String;
//                       //     });
//                       //   },
//                       // ),

//                       const Text("Property*",
//                           textAlign: TextAlign.start,
//                           style: TextStyle(fontWeight: FontWeight.bold)),

//                       // SelectionOptionField(
//                       //   items: serviceTypeList
//                       //       .map((e) =>
//                       //           DropdownMenuItem(value: e, child: Text(e)))
//                       //       .toList(),
//                       //   onChange: (value) {
//                       //     setState(() {
//                       //       selectItem = value as String;
//                       //     });
//                       //   },
//                       // ),
//                       const Text("Location*",
//                           textAlign: TextAlign.start,
//                           style: TextStyle(fontWeight: FontWeight.bold)),

//                       // SelectionOptionField(
//                       //   items: serviceTypeList
//                       //       .map((e) =>
//                       //           DropdownMenuItem(value: e, child: Text(e)))
//                       //       .toList(),
//                       //   onChange: (value) {
//                       //     setState(() {
//                       //       selectItem = value as String;
//                       //     });
//                       //   },
//                       // ),
//                       const Text("Brief Description",
//                           style: TextStyle(fontWeight: FontWeight.bold)),

//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: ReuseTextFields(
//                           textAlign: TextAlign.left,
//                           text: "Description",
//                           inputfieldcolor: Colors.white,
//                           maxLines: 4,
//                           password: false,
//                           readOnly: false,
//                         ),
//                       ),

//                       const Text("Detailed Description",
//                           textAlign: TextAlign.start,
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               decoration: TextDecoration.none)),

//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: ReuseTextFields(
//                           textAlign: TextAlign.left,
//                           text: "Description",
//                           inputfieldcolor: Colors.white,
//                           maxLines: 4,
//                           password: false,
//                           readOnly: false,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Align(
//                     alignment: Alignment.bottomCenter,
//                     child: clickButton(
//                       () {},
//                       child: const Text("Next"),
//                     ),
//                   ),
//                 )
//               ],
//             )),
//         Step(
//           state: currentStep > 1 ? StepState.complete : StepState.indexed,
//           isActive: currentStep >= 1,
//           title: Text('2st step'),
//           content: Container(
//             color: Colors.white,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Service*",
//                   textAlign: TextAlign.start,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 //const SizedBox(height: 10),
//                 SelectionOptionField(
//                   items: serviceTypeList
//                       .map((e) => DropdownMenuItem(value: e, child: Text(e)))
//                       .toList(),
//                   onChange: (value) {
//                     setState(() {
//                       selectItem = value as String;
//                     });
//                   },
//                 ),
//                 const Text("Property*",
//                     textAlign: TextAlign.start,
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//                 SelectionOptionField(
//                   items: serviceTypeList
//                       .map((e) => DropdownMenuItem(value: e, child: Text(e)))
//                       .toList(),
//                   onChange: (value) {
//                     setState(() {
//                       selectItem = value as String;
//                     });
//                   },
//                 ),
//                 const Text("Location*",
//                     textAlign: TextAlign.start,
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//                 SelectionOptionField(
//                   items: serviceTypeList
//                       .map((e) => DropdownMenuItem(value: e, child: Text(e)))
//                       .toList(),
//                   onChange: (value) {
//                     setState(() {
//                       selectItem = value as String;
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Step(
//             isActive: currentStep >= 2,
//             title: const Text('3st step'),
//             content: Container()),
//       ];
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gokul_f/layouts/drop_down.dart';
import 'package:gokul_f/layouts/drop_down_location.dart';
import 'package:gokul_f/layouts/global_dec.dart';
import 'package:gokul_f/layouts/warning_snackbar.dart';
import 'package:gokul_f/screens/job.dart';
import 'package:gokul_f/screens/login/environment_screen.dart';

import 'package:gokul_f/services/create_job_service.dart';
import 'package:gokul_f/services/profile_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../model/service_model.dart';
import 'app_text.dart';
import 'drop_down_assign.dart';
import 'package:intl/intl.dart' as intl;

class MyStepper extends StatefulWidget {
  const MyStepper({Key? key}) : super(key: key);

  @override
  State<MyStepper> createState() => MyStepperState();
}

class MyStepperState extends State<MyStepper> {
  int currentStep = 0;
  // final TextBloc _textBloc = TextBloc();
  // final TextControllers textControllers = Get.put(TextControllers());
  List<File> _imageFiles = [];
  List<File>? _selectedImagePath;
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  final TextEditingController servicetypeTextEditingController =
      TextEditingController();

  final TextEditingController _properyTextEditingController =
      TextEditingController();
  final TextEditingController _locationTextEditingController =
      TextEditingController();
  final TextEditingController _descripitionTextEditingController =
      TextEditingController();
  final TextEditingController _detailedDescripitionTextEditingController =
      TextEditingController();

  final TextEditingController _categoryTextEditingController =
      TextEditingController();
  final TextEditingController _priorityTextEditingController =
      TextEditingController();

  final TextEditingController _calendarTextEditingController =
      TextEditingController();
  final TextEditingController _accessInstructionsTextEditingController =
      TextEditingController();
  List<dynamic>? service;
  List<dynamic>? property;
  dynamic locData;
  List<dynamic>? locationData;
  List<dynamic>? categoryService;
  ServiceType? ser;
  List<dynamic> _listOfCities = [];
  String? dropdownValue;
  late List<dynamic> priorityService;
  String? id;
  List<String> imgId = [];
  bool bdcon = true;
  bool ddcon = true;
  bool aicon = true;
  dynamic assignManage;
  dynamic assignEngineer;
  dynamic iId;
//final MyBloc _myBloc = MyBloc();
  String? amName;
  String? aeName;
  dynamic profile;
  String? proFn;
  String? proLn;
  ClassA instanceOfClassA = ClassA();
  String? tnn;
  String? unitName;
  List<dynamic>? data;
  Function(List<dynamic>)? selectedItems;
  Widget Function(int index)? listBuilder;
  Widget? bottomSheetTitle;
  Widget? submitButtonChild;
  TextFormField? searchWidget;
  bool isSearchVisible = true;
  List<dynamic>? mainList = [];
  String? prioritych;
  String? service_typeid;
  String? propertyid;
  String? categoryid;
  String? target_date;
  String? pm_assignee;
  String? unitid;
  String? engineerid;
  dynamic createjobdet;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setSearchWidgetListener();
    _getDataService();
    _getDataProperty();
    _getDataPriority();
    profileser();
  }

  void printVariableA(ClassA instanceOfClassA) {
    print(instanceOfClassA.tna);
  }

  DateTime _selectedDate = DateTime.now();
  String tdata = intl.DateFormat.jm()
      .format(intl.DateFormat("hh:mm:ss").parse("14:15:00"));
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _calendarTextEditingController.text =
            '${picked.year}-${picked.month}-${picked.day}';
      });
    }
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
      _uploadImg();
    }
  }

  /// Get from Camera
  Future<void> _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 150,
      maxHeight: 150,
    );
    if (pickedFile == null) return;
    if (pickedFile != null) {
      setState(() {
        _imageFiles.add(File(pickedFile.path));
      });
      _uploadImg();
    }
  }

  Future<void> createJobCom() async {
    createjobdet = (await CreateJobService().createJobPost(
        priority: prioritych,
        service_type: service_typeid,
        property: propertyid,
        category: categoryid,
        target_date: _calendarTextEditingController.text.toString(),
        manager: pm_assignee,
        description: _descripitionTextEditingController.text,
        access_instruction: _accessInstructionsTextEditingController.text,
        photos: imgId,
        unitloc: unitid,
        engineers: engineerid,
        issue_type:
            _detailedDescripitionTextEditingController.text.toString()));
    print(service);
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(
          () {},
        ));
    print('hi');

    // for (var item in jsonResponse) {
    //   var id = item['id'];
    //   print(id);
    //   imgId!.add(id);
    // }
    // imgId!.add(id);
    print(createjobdet);
  }

  Future<void> _uploadImg() async {
    iId = (await CreateJobService().uploadImages(_imageFiles));
    print(service);
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(
          () {},
        ));
    print('hi');
    var jsonResponse = iId;
    print('imgid${iId['id']}');
    var id = iId['id'];
    // List<Map<String, dynamic>> id =
    //                   iId?['id'];
    print(id);

    imgId.add(id);

    print(jsonResponse.values);
    // for (var item in jsonResponse) {
    //   var id = item['id'];
    //   print(id);
    //   imgId!.add(id);
    // }
    // imgId!.add(id);
    print('imgff$imgId');
  }

  Future<void> _getDataService() async {
    service = (await CreateJobService().createJobService());
    print(service);
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(
          () {},
        ));
    print('hi');

    print(service?[0]['name']);
    print(ser);
    print(_listOfCities);
    // print("welcome${ser?.name}");
    // print(_listOfCities[0].name);
  }

  Future<void> _getDataProperty() async {
    property = (await CreateJobService().properties());
    print(service);
    setState(
      () {},
    );
    print('hi');
    property = property;
    print(service?[0]['name']);

    print(_listOfCities);
  }

  Future<void> locationGetData(id) async {
    locData = (await (CreateJobService().location(id)));
    // locData = await .fetchPosts(id);
//final jsonData = LoctaionServiceType.fromJson(locData);
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(() {}));
    print('location data : ${locData.toString()}');
    locationData = locData;
  }

  Future<void> _getDataCategory(propid) async {
    print('prrrr$propertyid');
    categoryService = (await CreateJobService().categories(propid));
    print(categoryService);
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(
          () {},
        ));
    print('hi');

    print(categoryService?[0]['name']);
  }

  Future<void> profileser() async {
    profile = (await ProfileService().profileServ());
    //print(categoryService);
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(
          () {},
        ));
    print('hi');

    print(profile['first_name']);
    print(profile['last_name']);
    setState(() {
      proFn = profile['first_name'];
      proLn = profile['last_name'];
    });
  }

  Future<void> _getDataPriority() async {
    priorityService = (await CreateJobService().priority());
    print(priorityService);
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(
          () {},
        ));
    print('hi');

    print(priorityService[0]['name']);
    print(ser);
    print(_listOfCities);
    // print("welcome${ser?.name}");
    // print(_listOfCities[0].name);
  }

  Future<void> _postImage() async {
    var postImg = (await CreateJobService().uploadImages(_imageFiles));
  }

  Future<void> _uploadImages() async {
    dynamic baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
    // Create a multipart request
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://${baseurl1}/v1/photos'));

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

  Future<void> assignManagerRep() async {
    assignManage = (await CreateJobService().assignManager(id));
    print(assignManage);
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(
          () {},
        ));
    print('hi');

    print(assignManage[0]['full_name']);
  }

  Future<void> assignEngineerRep() async {
    assignEngineer = (await CreateJobService().assignEngineer(id));
    print(assignEngineer);
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(
          () {},
        ));
    print('hi');
    // print('ins${instanceOfClassA.tna}');
    print(assignEngineer[0]['full_name']);
  }

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTapService() {
    DropDownState(
      DropDownCopy(
        bottomSheetTitle: Text(
          'Service Type',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: service ?? [],
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is dynamic) {
              list.add(item['name']);
              print(item['name']);
              String name = item['name'];
              String id = item['id'];
              setState(() {
                // list[0] = dropdownValue!;
                servicetypeTextEditingController.text = name;
                service_typeid = id;
                //text.emailController.value.text = name;
              });
              print(service);
              print(list);
              print('st${servicetypeTextEditingController.text}');
            }
          }
          // showSnackBar(list.toString());
        },
        //enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTapProperty() async {
    DropDownState(
      DropDownCopy(
        bottomSheetTitle: Text(
          'Property',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: property ?? [],
        selectedItems: (List<dynamic> selectedList) async {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is dynamic) {
              list.add(item['name']);
              print(list);
              print('properid${item['id']}');
              String propId = item['id'];
              setState(() {
                // list[0] = dropdownValue!;
                _properyTextEditingController.text = item['name'];
                propertyid = propId;
              });
              setState(() {
                id = item['id'];
                locationGetData(id);
                _getDataCategory(id);
              });
              print('aaaaa$id');
            }
          }
          //  showSnackBar(list.toString());
          // Navigator.pop(context, list);
        },
        //enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  void onTextFieldTapPriority() {
    DropDownState(
      DropDownCopy(
        bottomSheetTitle: const Text(
          'Priority',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: priorityService,
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is dynamic) {
              list.add(item['name']);
              print(item['name']);
              var priId = item['id'];
              setState(() {
                // list[0] = dropdownValue!;
                _priorityTextEditingController.text = item['name'];
                prioritych = priId;
              });
            }
          }
        },
        //enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTapMaintanance() {
    DropDownState(
      DropDownCopy(
        bottomSheetTitle: const Text(
          'Maintenance Category',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: categoryService ?? [],
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is dynamic) {
              list.add(item['name']);
              print(item['name']);
              String catId = item['id'];
              setState(() {
                // list[0] = dropdownValue!;
                _categoryTextEditingController.text = item['name'];
                categoryid = catId;
              });
            }
          }
        },
        //enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void showModal(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return onTextFieldTapLoc(context);
          },
        );
      },
    );
  }

  _buildSearchList(String userSearchTerm) {
    final results = locationData
        ?.where((element) => element['address']
            .toLowerCase()
            .contains(userSearchTerm.toLowerCase()))
        .toList();
    if (userSearchTerm.isEmpty) {
      locationData = locationData;
    } else {
      locationData = results;
    }
    setState(() {});
  }

  /// This helps to UnFocus the keyboard & pop from the bottom sheet.
  _onUnFocusKeyboardAndPop() {
    FocusScope.of(context).unfocus();
    Navigator.of(context).pop();
  }

  void _setSearchWidgetListener() {
    print('ml${locationData}');
    TextFormField? _searchField = (searchWidget as TextFormField?);
    _searchField?.controller?.addListener(() {
      _buildSearchList(_searchField.controller?.text ?? '');
    });
    print('conno');
    print(_searchField);
  }
  // void onTextFieldTapLoc() {
  // DropDownLocationState(
  //   DropDownLocation(
  //     bottomSheetTitle: Text(
  //       'Location',
  //       style: TextStyle(
  //         fontWeight: FontWeight.bold,
  //         fontSize: 20.0,
  //       ),
  //     ),
  //     submitButtonChild: const Text(
  //       'Done',
  //       style: TextStyle(
  //         fontSize: 16,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //     data: locationData,

  //     selectedItems: (List<dynamic> selectedList) {
  //       List<String> list = [];
  //       for (var item in selectedList) {
  //         if (item is dynamic) {
  //           // List<dynamic> Loc = item['units'];
  //           // Loc.map((location) {
  //           //   var tenname = location['tenant']['name'];
  //           //   print('tt$tenname');
  //           // });
  //           // var ttname = item['units'][0]['tenant']['name'];
  //           // print('tt$ttname');
  //           var unit = item['units'];

  //           for (var unitname in unit) {
  //             if (unitname is dynamic) {
  //               print('un${unitname['name']}');
  //             }
  //           }
  //           setState(() {
  //             _locationTextEditingController.text = item['address'];
  //           });
  //           list.add(item['address']);
  //           print('list of item$list');
  //           print(service);
  //         }
  //       }
  //       // showSnackBarLoc(list.toString());
  //     },
  //     //enableMultipleSelection: true,
  //   ),
  // ).showModal(context);
  Widget onTextFieldTapLoc(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.13,
      maxChildSize: 0.9,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Bottom sheet title text
                  Expanded(
                      child: Text(
                            'Location',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ) ??
                          Container()),
                ],
              ),
            ),

            /// A [TextField] that displays a list of suggestions as the user types with clear button.
            Visibility(
              visible: isSearchVisible,
              child: AppTextField(
                // dropDown: widget.dropDown??{} ,
                onTextChanged: _buildSearchList,
              ),
            ),

            /// Listview (list of data with check box for multiple selection & on tile tap single selection)
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: locationData?.length,
                itemBuilder: (context, index) {
                  List<String> tenantNames = [];
                  final address = locationData?[index]['address'] ?? '';

                  List<Map<String, dynamic>> units = locationData?[index]
                              ['units']
                          .cast<Map<String, dynamic>>() ??
                      [];

                  // print(unitNames);
                  print(tenantNames);
                  return InkWell(
                    child: Container(
                      // color: widget.dropDown.dropDownBackgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: ListTile(
                          title: Container(
                            color: Color.fromARGB(255, 202, 201, 201),
                            child: Text(
                              address ?? '-',
                              style: TextStyle(
                                  color: Colors.black,
                                  //backgroundColor: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          subtitle: Column(
                            children: units.map<Widget>((unit) {
                              final tenantName = unit['name'] ?? '-';
                              final tName = unit['tenant'] != null
                                  ? unit['tenant']['name']
                                  : '-';

                              return GestureDetector(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      tenantName,
                                      // unitNames[index],
                                      //unitNames.join(', '),
                                      //tenantNames[index].toString(),
                                      // mainList![index]['units'][index]['name'],
                                      style: const TextStyle(
                                        color: Colors.black,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      tName ?? [],
                                      style: const TextStyle(),
                                      maxLines: 1,
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  (List<dynamic> selectedList) {
                                    List<String> list = [];
                                    for (var item in selectedList) {
                                      if (item is dynamic) {
                                        var unit = item['units'];
                                        var uniId = units[index]['id'];
                                        // for (var unitname in unit) {
                                        //   if (unitname is dynamic) {
                                        //     print('un${unitname['name']}');
                                        //   }
                                        // }
                                        print('uni$uniId');
                                        print('unitnn$unit');
                                        setState(() {
                                          _locationTextEditingController.text =
                                              '${address}, ${tenantName}, ${tName}';
                                          unitid = uniId;
                                        });
                                        list.add(item['address']);
                                        print('list of item$list');
                                        //print(service);
                                      }
                                    }
                                  }.call([locationData?[index]]);
                                  _onUnFocusKeyboardAndPop();
                                  // print('ad$address');
                                  // print('ten$tenantName');
                                  // print('tn$tName');
                                  // setState(() {
                                  //   _locationTextEditingController.text =
                                  //       '${address}, ${tenantName}, ${tName}';
                                  // });
                                  setState(() {
                                    tnn = tName ?? '';
                                    unitName = tenantName;
                                  });

                                  // print(instanceOfClassA.tna);
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    // onTap: () {
                    //   (List<dynamic> selectedList) {
                    //     List<String> list = [];
                    //     for (var item in selectedList) {
                    //       if (item is dynamic) {
                    //         var unit = item['units'];

                    //         for (var unitname in unit) {
                    //           if (unitname is dynamic) {
                    //             print('un${unitname['name']}');
                    //           }
                    //         }
                    //         setState(() {
                    //           _locationTextEditingController.text =
                    //               item['address'];
                    //         });
                    //         list.add(item['address']);
                    //         print('list of item$list');
                    //         print(service);
                    //       }
                    //     }
                    //   }.call([locationData?[index]]);
                    //   _onUnFocusKeyboardAndPop();
                    // },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
  //}

  void onTextFieldTapAssignManager() {
    DropDownAssignState(
      DropDownAssign(
        bottomSheetTitle: Text(
          'Assign Manager',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: assignManage ?? [],
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is dynamic) {
              list.add(item['full_name']);
              print(item['full_name']);
              String name = item['full_name'];
              String assId = item['id'];
              setState(() {
                amName = name;
                pm_assignee = assId;
              });
            }
          }
          // showSnackBar(list.toString());
        },
        //enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  void onTextFieldTapAssignEngineer() {
    DropDownAssignState(
      DropDownAssign(
        bottomSheetTitle: Text(
          'Assign Manager',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: assignEngineer ?? [],
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is dynamic) {
              list.add(item['full_name']);
              print(item['full_name']);
              String name = item['full_name'];
              String engId = item['id'];
              setState(() {
                aeName = name;
                engineerid = engId;
              });
            }
          }
          // showSnackBar(list.toString());
        },
        //enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  // void showSnackBarLoc(String message) {
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text(message)));
  // }

  continueStep() {
    if (currentStep < 2) {
      setState(() {
        currentStep = currentStep + 1; //currentStep+=1;
      });
    }
  }

  cancelStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep = currentStep - 1; //currentStep-=1;
      });
    }
  }

  onStepTapped(int value) {
    setState(() {
      currentStep = value;
    });
  }

  Widget controlBuilders(context, details) {
    // get the instance of AppTextFieldState1 class
    print('vzrr${tnn}');
    final isLastStep = currentStep == 2;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () async {
                // _postImage();
                // await CreateJobService().uploadImages(_imageFiles);
                print('a${servicetypeTextEditingController.text}');
                if (currentStep == 0) {
                  if (servicetypeTextEditingController.text.isEmpty) {
                    SnackBarField()
                        .warning(context, 'Kindly Select ServiceType');
                  } else if (_properyTextEditingController.text.isEmpty) {
                    SnackBarField().warning(context, 'Kindly Select Propery');
                  } else if (_locationTextEditingController.text.isEmpty) {
                    SnackBarField().warning(context, 'Kindly Select Location');
                  } else if (_descripitionTextEditingController.text.isEmpty) {
                    SnackBarField()
                        .warning(context, 'Kindly Select Brife Descripition');
                  } else {
                    setState(() {
                      currentStep = currentStep + 1; //currentStep+=1;
                    });
                    // }
                  }
                } else if (currentStep == 1) {
                  if (_categoryTextEditingController.text.isEmpty) {
                    SnackBarField()
                        .warning(context, 'Kindly Select Maintenance Category');
                  } else {
                    setState(() {
                      currentStep = currentStep + 1; //currentStep+=1;
                    });
                  }
                } else if (currentStep == 2) {
                  createJobCom();
                }

                //_postImage();
              },
              //onPressed: details.onStepContinue,
              // child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
              child: Text(
                isLastStep ? 'CONFIRM' : 'NEXT',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 230, 81, 0),
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Expanded(
          //   child: ElevatedButton(

          //     // child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
          //     child: const Text(
          //       'Next',
          //       style:
          //           TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
          //     ),
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Color.fromARGB(255, 230, 81, 0),
          //       textStyle: const TextStyle(
          //           fontSize: 16, fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
          // ElevatedButton(
          //   onPressed: details.onStepContinue,
          //   child: const Text('Next'),
          // ),
          const SizedBox(width: 10),
          if (currentStep >= 1)
            Expanded(
              child: OutlinedButton(
                onPressed: details.onStepCancel,
                child: const Text('Back'),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 4, 31, 68),
          title: const Text(
            'Create Job Request',
          ),
          leading: (Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // child: Positioned(
                //child: AppBar(

                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  //  onPressed: onStepCancel,
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                //   backgroundColor: Colors.transparent,
                //   elevation: 0.0,
                // ),
                // ),
              ),
            ],
          ))),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme:
              const ColorScheme.light(primary: Color.fromARGB(255, 230, 81, 0)),
          iconTheme: Theme.of(context).iconTheme.copyWith(size: 32.0),
        ),
        child: Stepper(
          elevation: 0, //Horizontal Impact
          // margin: const EdgeInsets.all(20), //vertical impact
          controlsBuilder: controlBuilders,
          type: StepperType.horizontal,
          physics: const ScrollPhysics(),
          onStepTapped: onStepTapped,
          onStepContinue: continueStep,
          onStepCancel: cancelStep,
          currentStep: currentStep, //0, 1, 2
          steps: [
            Step(
                title: const Text(''),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                          text: "ServiceType",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 20, 56, 103)),
                          children: [
                            TextSpan(
                                text: '*', style: TextStyle(color: Colors.red))
                          ]),
                      textAlign: TextAlign.start,
                    ),
                    // Text(
                    //   'ServiceType',
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 15.0,
                    //       color: Color.fromARGB(255, 20, 56, 103)),
                    // ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      //initialValue: dropdownValue,

                      readOnly: true,
                      //  controller: text.emailController.value,
                      controller: servicetypeTextEditingController,

                      onTap: () {
                        FocusScope.of(context).unfocus();
                        onTextFieldTapService();

                        //CreateJobService().createJobService();
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            left: 10, bottom: 10, top: 10, right: 10),
                        hintText: 'Select',
                        hintStyle: const TextStyle(
                            fontSize: 14, color: Colors.black45),
                        suffixIcon: const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 30,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter email id";
                        } else {
                          return "Enter valid email";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    RichText(
                      text: const TextSpan(
                          text: "Property",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 20, 56, 103)),
                          children: [
                            TextSpan(
                                text: '*', style: TextStyle(color: Colors.red))
                          ]),
                      textAlign: TextAlign.start,
                    ),
                    // Text(
                    //   'Property',
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 15.0,
                    //       color: Color.fromARGB(255, 20, 56, 103)),
                    // ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: _properyTextEditingController,
                      //cursorColor: Colors.black,
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        onTextFieldTapProperty();

                        //CreateJobService().createJobService();
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            left: 10, bottom: 10, top: 10, right: 10),
                        hintText: 'Select',
                        hintStyle: const TextStyle(
                            fontSize: 14, color: Colors.black45),
                        suffixIcon: const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 30,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            //  style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter email id";
                        } else {
                          return "Enter valid email";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                              text: "Location",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 20, 56, 103)),
                              children: [
                                TextSpan(
                                    text: '*',
                                    style: TextStyle(color: Colors.red))
                              ]),
                          textAlign: TextAlign.start,
                        ),
                        // Text(
                        //   'Location',
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 15.0,
                        //       color: Color.fromARGB(255, 20, 56, 103)),
                        // ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: _locationTextEditingController,
                          // cursorColor: Colors.black,
                          onTap: () {
                            //FocusScope.of(context).unfocus();
                            // onTextFieldTapLoc();
                            showModal(context);
                            //CreateJobService().createJobService();
                          },

                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10, right: 10),
                            hintText: 'Select',
                            hintStyle: const TextStyle(
                                fontSize: 14, color: Colors.black45),
                            suffixIcon: const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              size: 30,
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                // style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter email id";
                            } else {
                              return "Enter valid email";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        RichText(
                          text: const TextSpan(
                              text: "Brief Descripition",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 20, 56, 103)),
                              children: [
                                TextSpan(
                                    text: '*',
                                    style: TextStyle(color: Colors.red))
                              ]),
                          textAlign: TextAlign.start,
                        ),
                        // Text(
                        //   'Brief Descripition',
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 15.0,
                        //       color: Color.fromARGB(255, 20, 56, 103)),
                        // ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        TextFormField(
                          // readOnly: true,
                          controller: _descripitionTextEditingController,

                          maxLines: 4,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10, right: 10),
                            hintText: 'Descripition',
                            hintStyle: const TextStyle(
                                fontSize: 14, color: Colors.black45),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                //style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                          ),
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return "Enter email id";
                          //   } else {
                          //     return "Enter valid email";
                          //   }
                          // },
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        RichText(
                          text: const TextSpan(
                            text: "Detailed Descripition",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 56, 103)),
                          ),
                          textAlign: TextAlign.start,
                        ),
                        // Text(
                        //   'Detailed Descripition',
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 15.0,
                        //       color: Color.fromARGB(255, 20, 56, 103)),
                        // ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        TextFormField(
                          controller:
                              _detailedDescripitionTextEditingController,
                          // cursorColor: Colors.black,

                          maxLines: 4,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10, right: 10),
                            hintText: 'Descripition',
                            hintStyle: const TextStyle(
                                fontSize: 14, color: Colors.black45),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                //style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                          ),
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return "Enter email id";
                          //   } else {
                          //     return "Enter valid email";
                          //   }
                          // },
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                      ],
                    ),
                  ],
                ),
                isActive: currentStep >= 0,
                state:
                    currentStep >= 0 ? StepState.complete : StepState.disabled),
            Step(
              title: const Text(''),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                        text: "Maintenance Category",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 20, 56, 103)),
                        children: [
                          TextSpan(
                              text: '*', style: TextStyle(color: Colors.red))
                        ]),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: _categoryTextEditingController,
                    //cursorColor: Colors.black,
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      onTextFieldTapMaintanance();

                      //CreateJobService().createJobService();
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 10, bottom: 10, top: 10, right: 10),
                      hintText: 'Select',
                      hintStyle:
                          const TextStyle(fontSize: 14, color: Colors.black45),
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        size: 30,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    'Priority',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 20, 56, 103)),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: _priorityTextEditingController,
                    //cursorColor: Colors.black,
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      onTextFieldTapPriority();

                      //CreateJobService().createJobService();
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 10, bottom: 10, top: 10, right: 10),
                      hintText: 'Select',
                      hintStyle:
                          const TextStyle(fontSize: 14, color: Colors.black45),
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        size: 30,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          // style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    'Target Completion Date',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 20, 56, 103)),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    readOnly: true,

                    showCursor: false,
                    // cursorColor: Colors.black,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 10, bottom: 10, top: 10, right: 10),
                      hintText: 'Select date',
                      hintStyle:
                          const TextStyle(fontSize: 14, color: Colors.black45),
                      suffixIcon: const Icon(
                        Icons.calendar_today_rounded,
                        size: 30,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          // style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                    ),
                    onTap: () {
                      _selectDate(context);
                    },
                    controller: _calendarTextEditingController,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a date';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  SingleChildScrollView(
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
                          height: 5,
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
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        _imageFiles.isNotEmpty
                            ? GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 5,
                                children:
                                    List.generate(_imageFiles.length, (index) {
                                  return SingleChildScrollView(
                                    child: Stack(
                                      children: <Widget>[
                                        Image.file(
                                          _imageFiles[index],
                                          fit: BoxFit.cover,
                                          scale: 2,
                                        ),
                                        Positioned(
                                          right: 20,
                                          top: 5,
                                          child: InkWell(
                                            child: Icon(
                                              Icons.cancel,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            onTap: () async {
                                              var iid = imgId[index].toString();
                                              print('remove${imgId[index]}');
                                              await CreateJobService()
                                                  .uploadImagesDelete(iid);
                                              setState(() {
                                                imgId.removeAt(index);
                                              });
                                              // setState(() {
                                              //   imgId.clear();
                                              // });
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
                      ],
                    ),
                  ),
                ],
              ),
              isActive: currentStep >= 0,
              state: currentStep >= 1 ? StepState.complete : StepState.disabled,
            ),
            Step(
              title: const Text(''),
              //  content: Text('sab'),
              content: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Priority:',
                          style: const TextStyle(
                            color: Color.fromARGB(240, 1, 29, 71),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            readOnly: true,
                            controller: _priorityTextEditingController,
                            //cursorColor: Colors.black,
                            onTap: () {
                              onTextFieldTapPriority();

                              //CreateJobService().createJobService();
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 10, bottom: 10, top: 10, right: 10),
                              hintText: 'Select',
                              hintStyle: const TextStyle(
                                  fontSize: 14, color: Colors.black45),
                              suffixIcon: const Icon(
                                Icons.keyboard_arrow_down_sharp,
                                size: 30,
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0,
                                  // style: BorderStyle.none,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Brief Description',
                          style: const TextStyle(
                            color: Color.fromARGB(240, 1, 29, 71),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                        ),
                        bdcon
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    bdcon = false;
                                  });
                                },
                                child: Icon(
                                  Icons.edit,
                                  size: 30,
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    bdcon = true;
                                  });
                                },
                                child: Icon(
                                  Icons.check,
                                  size: 30,
                                ),
                              )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            readOnly: bdcon,
                            controller: _descripitionTextEditingController,
                            //cursorColor: Colors.black,
                            // onTap: () {
                            //   onTextFieldTapPriority();

                            //   //CreateJobService().createJobService();
                            // },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 10, bottom: 10, top: 10, right: 10),
                              hintText: 'Descripition',
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                              ),
                              border: bdcon
                                  ? InputBorder.none
                                  : OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 0,
                                        // style: BorderStyle.none,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Detailed Description',
                              style: const TextStyle(
                                color: Color.fromARGB(240, 1, 29, 71),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                        ddcon
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    ddcon = false;
                                  });
                                },
                                child: Icon(
                                  Icons.edit,
                                  size: 30,
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    ddcon = true;
                                  });
                                },
                                child: Icon(
                                  Icons.check,
                                  size: 30,
                                ),
                              )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            readOnly: ddcon,
                            controller:
                                _detailedDescripitionTextEditingController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 10, bottom: 10, top: 10, right: 10),
                              hintText: 'Descripition',
                              hintStyle: const TextStyle(
                                  fontSize: 14, color: Colors.black45),
                              border: ddcon
                                  ? InputBorder.none
                                  : OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 0,
                                        // style: BorderStyle.none,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Property',
                          style: const TextStyle(
                            color: Color.fromARGB(240, 1, 29, 71),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                        ),
                        Text(
                          _properyTextEditingController.text,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 15, 36),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          textDirection: TextDirection.rtl,
                        ),
                        GestureDetector(
                          onTap: () {
                            onTextFieldTapProperty();
                          },
                          child: Icon(
                            Icons.edit,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Address',
                          style: const TextStyle(
                            color: Color.fromARGB(240, 1, 29, 71),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                        ),
                        Container(
                          alignment: Alignment.center,
                          // color: Colors.orange,
                          width: 100,
                          child: Text(
                            _locationTextEditingController.text,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 15, 36),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            textDirection: TextDirection.rtl,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // onTextFieldTapLoc();
                            showModal(context);
                          },
                          child: Icon(
                            Icons.edit,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Location',
                          style: const TextStyle(
                            color: Color.fromARGB(240, 1, 29, 71),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          child: Text(
                            unitName ?? '',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 15, 36),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            // maxLines: 1,
                            // textDirection: TextDirection.rtl,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // onTextFieldTapLoc();
                            showModal(context);
                          },
                          child: Icon(
                            Icons.edit,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Target\nCompleteion Date:',
                          style: const TextStyle(
                            color: Color.fromARGB(240, 1, 29, 71),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 100,
                          child: Text(
                            _calendarTextEditingController.text,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 15, 36),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Icon(
                            Icons.edit,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Service Type:',
                          style: const TextStyle(
                            color: Color.fromARGB(240, 1, 29, 71),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                        ),
                        Text(
                          servicetypeTextEditingController.text,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 15, 36),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          textDirection: TextDirection.rtl,
                        ),
                        GestureDetector(
                          onTap: () {
                            onTextFieldTapService();
                          },
                          child: Icon(
                            Icons.edit,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Category:',
                          style: const TextStyle(
                            color: Color.fromARGB(240, 1, 29, 71),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                        ),
                        Text(
                          _categoryTextEditingController.text,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 15, 36),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          textDirection: TextDirection.rtl,
                        ),
                        GestureDetector(
                          onTap: () {
                            onTextFieldTapMaintanance();
                          },
                          child: Icon(
                            Icons.edit,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tenant:',
                          style: const TextStyle(
                            color: Color.fromARGB(240, 1, 29, 71),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                        ),
                        Text(
                          tnn ?? '',
                          //  widget.ttt ?? '',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 15, 36),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          textDirection: TextDirection.rtl,
                        ),
                        Container(),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Billable Party:',
                          style: const TextStyle(
                            color: Color.fromARGB(240, 1, 29, 71),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.currency_rupee_outlined,
                              size: 18,
                            ),
                            Text(
                              'Tenant',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 15, 36),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              textDirection: TextDirection.rtl,
                            ),
                          ],
                        ),
                        Icon(
                          Icons.edit,
                          size: 30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Assign Manager:',
                          style: const TextStyle(
                            color: Color.fromARGB(240, 1, 29, 71),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            color: Color.fromARGB(255, 180, 177, 177),
                            width: 100,
                            height: 30,
                            child: Center(
                              child: Text(
                                amName ?? 'assign',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 15, 36),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await assignManagerRep();
                            onTextFieldTapAssignManager();
                          },
                          child: Icon(
                            Icons.edit,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Assign Engineer:',
                          style: const TextStyle(
                            color: Color.fromARGB(240, 1, 29, 71),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            color: Color.fromARGB(255, 180, 177, 177),
                            width: 100,
                            height: 30,
                            child: Center(
                              child: Text(
                                aeName ?? 'assign',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 15, 36),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                // textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await assignEngineerRep();
                            onTextFieldTapAssignEngineer();
                            printVariableA(instanceOfClassA);
                          },
                          child: Icon(
                            Icons.edit,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Submitted By: ',
                          style: const TextStyle(
                            color: Color.fromARGB(240, 1, 29, 71),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                        ),
                        Text(
                          '${proFn} ${proLn}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 15, 36),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          textDirection: TextDirection.rtl,
                        ),
                        Container(),
                        // Icon(
                        //   Icons.edit,
                        //   size: 30,
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date Created:',
                          style: const TextStyle(
                            color: Color.fromARGB(240, 1, 29, 71),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                        ),
                        Text(
                          ' ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year} - ${tdata}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 15, 36),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          textDirection: TextDirection.rtl,
                        ),
                        Container(),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Courtesy job:',
                          style: TextStyle(
                            color: Color.fromARGB(240, 1, 29, 71),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                        ),
                        Text(
                          'Yes',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 15, 36),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          textDirection: TextDirection.rtl,
                        ),
                        Container(),
                        // Icon(
                        //   Icons.edit,
                        //   size: 30,
                        // ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ExpansionTile(
                      childrenPadding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5),
                      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                      title: const Text(
                        'Access Instruction',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        aicon
                            ? Text(
                                _accessInstructionsTextEditingController.text)
                            : Center(
                                child: TextFormField(
                                  readOnly: aicon,
                                  controller:
                                      _accessInstructionsTextEditingController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 10,
                                        bottom: 10,
                                        top: 10,
                                        right: 10),
                                    //  hintText: 'Select',
                                    hintStyle: const TextStyle(
                                        fontSize: 14, color: Colors.black45),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 10,
                                        // style: BorderStyle.none,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                aicon = !aicon;
                              });
                            },
                            icon: aicon
                                ? const Icon(
                                    Icons.mode_edit_outline,
                                    size: 16,
                                  )
                                : const Icon(
                                    Icons.check_sharp,
                                    color: Color.fromARGB(255, 230, 81, 0),
                                  ))
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Container(
                    //       width: 310,
                    //       height: 100,
                    //       // Text(
                    //       //                     'Courtesy job:',
                    //       //                     style: TextStyle(
                    //       //                       color: Colors.black,
                    //       //                       // fontWeight: FontWeight.bold,
                    //       //                     ),
                    //       //                     maxLines: 1,
                    //       //                   ),
                    //       decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(
                    //             30), //border corner radius
                    //         boxShadow: [
                    //           BoxShadow(
                    //             color: Colors.grey
                    //                 .withOpacity(0.5), //color of shadow
                    //             spreadRadius: 5, //spread radius
                    //             blurRadius: 7, // blur radius
                    //             offset:
                    //                 Offset(0, 2), // changes position of shadow
                    //             //first paramerter of offset is left-right
                    //             //second parameter is top to down
                    //           ),
                    //           //you can set more BoxShadow() here
                    //         ],
                    //       ),
                    //       child: Center(
                    //         child: TextFormField(
                    //           readOnly: aicon,
                    //           controller:
                    //               _accessInstructionsTextEditingController,
                    //           decoration: InputDecoration(
                    //             contentPadding: const EdgeInsets.only(
                    //                 left: 10, bottom: 10, top: 10, right: 10),
                    //             //  hintText: 'Select',
                    //             hintStyle: const TextStyle(
                    //                 fontSize: 14, color: Colors.black45),
                    //             border: const OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                 width: 10,
                    //                 // style: BorderStyle.none,
                    //               ),
                    //               borderRadius: BorderRadius.all(
                    //                 Radius.circular(8.0),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     aicon
                    //         ? GestureDetector(
                    //             onTap: () {
                    //               setState(() {
                    //                 aicon = false;
                    //               });
                    //             },
                    //             child: Icon(
                    //               Icons.edit,
                    //               size: 30,
                    //             ),
                    //           )
                    //         : GestureDetector(
                    //             onTap: () {
                    //               setState(() {
                    //                 aicon = true;
                    //               });
                    //             },
                    //             child: Icon(
                    //               Icons.check,
                    //               size: 30,
                    //             ),
                    //           )
                    //   ],
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pre-Completion Photos',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _imageFiles.isNotEmpty
                        ? GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 5,
                            children:
                                List.generate(_imageFiles.length, (index) {
                              return SingleChildScrollView(
                                child: Stack(
                                  children: <Widget>[
                                    Image.file(
                                      _imageFiles[index],
                                      fit: BoxFit.cover,
                                      scale: 2,
                                    ),
                                    Positioned(
                                      right: 20,
                                      top: 5,
                                      child: InkWell(
                                        child: Icon(
                                          Icons.cancel,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                        onTap: () async {
                                          var iid = imgId[index].toString();
                                          print('remove${imgId[index]}');
                                          await CreateJobService()
                                              .uploadImagesDelete(iid);
                                          setState(() {
                                            imgId.removeAt(index);
                                          });
                                          // setState(() {
                                          //   imgId.clear();
                                          // });
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
                    // Column(
                    //   children: [
                    //     Container(
                    //       color: Color.fromARGB(255, 180, 177, 177),
                    //       width: 100,
                    //       //height: 100,
                    //       child: Container(
                    //           //_imageFiles
                    //           ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              isActive: currentStep >= 0,
              state: currentStep >= 2 ? StepState.complete : StepState.disabled,
            ),
          ],
        ),
      ),
    );
  }
}
