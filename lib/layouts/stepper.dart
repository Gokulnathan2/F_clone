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
import 'package:flutter/material.dart';
import 'package:gokul_f/layouts/try_nd_error.dart';
import 'package:gokul_f/screens/job.dart';
import 'package:gokul_f/screens/login/view/job2.dart';

class MyStepper extends StatefulWidget {
  const MyStepper({Key? key}) : super(key: key);

  @override
  State<MyStepper> createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int currentStep = 0;
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
    //final isLastStep = currentStep == .length - 1;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          if (currentStep != 0)
            ElevatedButton(
              onPressed: details.onStepContinue,
              // child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 230, 81, 0),
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

          if (currentStep == 0)
            Expanded(
              child: ElevatedButton(
                onPressed: details.onStepContinue,
                // child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
                child: const Text(
                  'Next',
                  style:
                      TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 230, 81, 0),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          // ElevatedButton(
          //   onPressed: details.onStepContinue,
          //   child: const Text('Next'),
          // ),
          const SizedBox(width: 10),
          if (currentStep != 0)
            OutlinedButton(
              onPressed: details.onStepCancel,
              child: const Text('Back'),
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
                content: JobScreenState().mainBody(),
                isActive: currentStep >= 0,
                state:
                    currentStep >= 0 ? StepState.complete : StepState.disabled),
            Step(
              title: const Text(''),
              content: JobScreen2(),
              isActive: currentStep >= 0,
              state: currentStep >= 1 ? StepState.complete : StepState.disabled,
            ),
            Step(
              title: const Text(''),
              //  content: Text('sab'),
              content: CalendarTextFormField(),
              isActive: currentStep >= 0,
              state: currentStep >= 2 ? StepState.complete : StepState.disabled,
            ),
          ],
        ),
      ),
    );
  }
}
