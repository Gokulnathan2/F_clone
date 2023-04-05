// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:gokul_f/layouts/bottom_navigation_Screen.dart';
// import 'package:gokul_f/layouts/botton_field.dart';
// import 'package:gokul_f/layouts/icon.dart';
// import 'package:gokul_f/layouts/text_field.dart';
// import 'package:gokul_f/screens/More_Menu_Screen.dart';
// import 'package:gokul_f/screens/camera_screen.dart';
// import 'package:gokul_f/screens/chat_screen.dart';
// import 'package:gokul_f/screens/dashboard_screen.dart';
// import 'package:gokul_f/screens/login/environment_screen.dart';
// import 'package:gokul_f/screens/notifications_screen.dart';
// import 'package:gokul_f/services/dashboard_services.dart';

// import '../model/dash_board_model.dart';

// class JobScreen extends StatefulWidget {
//   const JobScreen({Key? key}) : super(key: key);
//   // final String? baseurls;
//   // const DashBoardScreen({super.key, this.baseurls});
//   @override
//   State<JobScreen> createState() => _JobState();
// }

// class _JobState extends State<JobScreen> {
//   static final storage = FlutterSecureStorage();
//   // int selectedIndex = 0;
//   // static List<Widget> selectedOption = <Widget>[
//   //   DashBoardScreen(),
//   //   ChatScreen(),
//   //   CameraScreen(),
//   //   NotificationScreen(),
//   //   MenuScreen(),
//   // ];
//   // void _onItemTapped(int index) {
//   //   setState(() {
//   //     selectedIndex = index;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Create Job Request',
//         ),
//         leading: (Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               // child: Positioned(
//               //child: AppBar(

//               child: IconButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 icon: Icon(
//                   Icons.arrow_back,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//               ),
//               //   backgroundColor: Colors.transparent,
//               //   elevation: 0.0,
//               // ),
//               // ),
//             ),
//           ],
//         )),
//         //   IconButton(

//         //   //icon: const Icon(Icons.add_alert),
//         //   tooltip: 'Show Snackbar',
//         //   onPressed: () {
//         //     ScaffoldMessenger.of(context).showSnackBar(
//         //         const SnackBar(content: Text('This is a snackbar')));
//         //   },
//         // )),

//         automaticallyImplyLeading: false,
//         backgroundColor: Color.fromARGB(255, 4, 31, 68),
//         //title: const Text('AppBar Demo'),
//         actions: <Widget>[],
//       ),
//       body: SafeArea(
//           maintainBottomViewPadding: true,
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [Text("1----2----3")],
//               ),
//               Container(
//                 color: Colors.white,
//                 padding: const EdgeInsets.all(4.0),
//                 child: Align(
//                   //alignment: Alignment.topLeft,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Service*",
//                         textAlign: TextAlign.start,
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 10),
//                       // Container(
//                       //   width: 333,
//                       //   decoration: BoxDecoration(
//                       //     borderRadius: BorderRadius.circular(5),
//                       //     border: Border.all(color: Colors.black),
//                       //   ),
//                       //   child: TextField(
//                       //     decoration: InputDecoration(
//                       //       hintText: "select",
//                       //       filled: true,
//                       //       contentPadding: const EdgeInsets.only(
//                       //           top: 6, bottom: 6, left: 10),
//                       //     ),
//                       //   ),
//                       // ),
//                       ReuseTextFields(
//                         width: 333,
//                         textAlign: TextAlign.left,
//                         text: "select",
//                         inputfieldcolor: Colors.white,
//                         password: false,
//                         readOnly: false,
//                         maxLines: 1,
//                       ),

//                       const Text("Property*",
//                           textAlign: TextAlign.start,
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                       const SizedBox(height: 10),
//                       // Container(
//                       //   width: 333,
//                       //   decoration: BoxDecoration(
//                       //     borderRadius: BorderRadius.circular(5),
//                       //     border: Border.all(color: Colors.black),
//                       //   ),
//                       //   child: TextField(
//                       //     //textInputAction: AboutDialog,
//                       //     decoration: InputDecoration(
//                       //       hintText: "select",
//                       //       contentPadding: const EdgeInsets.only(
//                       //           top: 6, bottom: 6, left: 10),
//                       //     ),
//                       //   ),
//                       // ),
//                       ReuseTextFields(
//                         width: 333,
//                         textAlign: TextAlign.left,
//                         text: "select",
//                         inputfieldcolor: Colors.white,
//                         password: false,
//                         readOnly: false,
//                         maxLines: 1,
//                       ),

//                       const Text("Location*",
//                           textAlign: TextAlign.start,
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                       // Container(
//                       //   width: 333,
//                       //   decoration: BoxDecoration(
//                       //     borderRadius: BorderRadius.circular(5),
//                       //     border: Border.all(color: Colors.black),
//                       //   ),
//                       //   child: TextField(
//                       //     decoration: InputDecoration(
//                       //       hintText: "select",
//                       //       contentPadding: const EdgeInsets.only(
//                       //           top: 6, bottom: 6, left: 10),
//                       //       suffixIcon: IconButton(
//                       //           onPressed: () {},
//                       //           icon: const Icon(
//                       //               Icons.keyboard_arrow_down_sharp)),
//                       //     ),
//                       //   ),
//                       // ),
//                       const SizedBox(height: 10),
//                       ReuseTextFields(
//                         width: 333,
//                         textAlign: TextAlign.left,
//                         text: "select",
//                         inputfieldcolor: Colors.white,
//                         password: false,
//                         readOnly: false,
//                         maxLines: 1,
//                       ),

//                       const Text("Brief Description",
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                       const SizedBox(height: 10),

//                       ReuseTextFields(
//                         width: 333,
//                         textAlign: TextAlign.left,
//                         text: "Description",
//                         inputfieldcolor: Colors.white,
//                         maxLines: 4,
//                         password: false,
//                         readOnly: false,
//                       ),

//                       const Text("Detailed Description",
//                           textAlign: TextAlign.start,
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               decoration: TextDecoration.none)),
//                       const SizedBox(height: 10),

//                       Directionality(
//                         textDirection: TextDirection.rtl,
//                         child: ReuseTextFields(
//                           width: 333,
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
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: clickButton(
//                   () {},
//                   child: const Text("Next"),
//                 ),
//               )
//             ],
//           )),
//       // body: const Center(
//       //   child: Text(
//       //     'This is the home page',
//       //     style: TextStyle(fontSize: 24),
//       //   ),
//       // ),
//       // bottomNavigationBar: BottomNavigationBar(
//       //   type: BottomNavigationBarType.fixed, // set the type property to fixed

//       //   items: const <BottomNavigationBarItem>[
//       //     BottomNavigationBarItem(
//       //         icon: Icon(Icons.dashboard), label: 'Dashboard'),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.chat),
//       //       label: 'Chat',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.camera_alt),
//       //       label: 'Photo',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.notifications),
//       //       label: 'Notification',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.menu),
//       //       label: 'More',
//       //     )
//       //   ],
//       //   // type: BottomNavigationBarType.fixed,
//       //   currentIndex: selectedIndex,
//       //   selectedItemColor: Colors.orange[900],
//       //   unselectedItemColor: Color.fromARGB(255, 1, 21, 88),
//       //   iconSize: 23,
//       //   onTap: _onItemTapped,
//       //   elevation: 3,
//       // ),
//     );
//   }
// }
//import 'package:drop_down_list/drop_down_list.dart';
//import 'package:drop_down_list/model/selected_list_item.dart';
//import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:gokul_f/layouts/drop_down.dart';
import 'package:gokul_f/layouts/stepper.dart';
import 'package:gokul_f/model/service_model.dart';
import 'package:gokul_f/screens/login/view/job2.dart';
import 'package:gokul_f/services/create_job_service.dart';
import 'package:gokul_f/layouts/constants.dart';

import '../model/selected_type.dart';

//import 'constants.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({
    Key? key,
  }) : super(key: key);

  @override
  JobScreenState createState() => JobScreenState();
}

class JobScreenState extends State<JobScreen> {
  dynamic cj;
  ServiceType? ser;

  /// This is list of city which will pass to the drop down.
  /// final List<SelectedListItem> _listOfCities = [
//     SelectedListItem(
//       name: kTokyo,
//       value: "TYO",
//       isSelected: false,
//     ),
//     SelectedListItem(
//       name: kNewYork,
//       value: "NY",
//       isSelected: false,
//     ),
//     SelectedListItem(
//       name: kLondon,
//       value: "LDN",
//       isSelected: false,
//     ),
//     SelectedListItem(name: kParis),
//     SelectedListItem(name: kMadrid),
//     SelectedListItem(name: kDubai),
//     SelectedListItem(name: kRome),
//     SelectedListItem(name: kBarcelona),
//     SelectedListItem(name: kCologne),
//     SelectedListItem(name: kMonteCarlo),
//     SelectedListItem(name: kPuebla),
//     SelectedListItem(name: kFlorence),
//   ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _getData() async {
    cj = (await CreateJobService().createJobService());
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(
          () {
            //cj['name'] = _listOfCities;
          },
        ));
    print('hi');
    print(cj[0]['name'].toString());
    print(ser?.name);
    print("welcome");
  }

  /// This is register text field controllers.
  final TextEditingController _servicetypeTextEditingController =
      TextEditingController();
  final TextEditingController _properyTextEditingController =
      TextEditingController();
  final TextEditingController _locationTextEditingController =
      TextEditingController();
  final TextEditingController _descripitionTextEditingController =
      TextEditingController();
  final TextEditingController _detailedDescripitionTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _servicetypeTextEditingController.dispose();
    _properyTextEditingController.dispose();
    _locationTextEditingController.dispose();
    _descripitionTextEditingController.dispose();
    _detailedDescripitionTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: mainBody()),
    );
  }

  /// This is Main Body widget.
  Widget mainBody() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(
          //   height: 30.0,
          // ),
          // const Text(
          //   ' kRegister',
          //   style: TextStyle(
          //     fontSize: 34.0,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // const SizedBox(
          //   height: 15.0,

          AppTextField(
            textEditingController: _servicetypeTextEditingController,
            title: 'Service Type',
            hint: 'Select',
            isCitySelected: true,
            //cities: _listOfCities,
          ),

          AppTextField1(
            textEditingController: _properyTextEditingController,
            title: 'Property',
            hint: 'Select',
            isCitySelected: true,
            //cities: _listOfCities,
          ),
          // AppTextField(
          //   textEditingController:  _cityTextEditingController,
          //   title: 'Service Type',
          //   hint: 'Select',
          //   isCitySelected: true,
          //   cities: _listOfCities,
          // ),
          AppTextField(
            textEditingController: _locationTextEditingController,
            title: 'Location',
            hint: 'Select tenant & unit',
            isCitySelected: true,
            //cities: _listOfCities,
          ),
          AppTextField(
            textEditingController: _descripitionTextEditingController,
            title: 'Brief Descripition',
            hint: 'Description',
            isCitySelected: false,
          ),
          AppTextField(
            textEditingController: _detailedDescripitionTextEditingController,
            title: 'Detailed Descripition',
            hint: 'Description',
            isCitySelected: false,
          ),
          // const SizedBox(
          //   height: 15.0,
          // ),
          //  _AppElevatedButton(),
        ],
      ),
    );
  }
}

/// This is Common App textfiled class.
class AppTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isCitySelected;
  //final List<SelectedListItem>? cities;

  const AppTextField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    // this.cities,
    Key? key,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  late List<dynamic> service;
  ServiceType? ser;
  List<dynamic> _listOfCities = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
    // _getData1();
  }

  void _getData() async {
    service = (await CreateJobService().createJobService());
    print(service);
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(
          () {
            // service = _listOfCities;
            //service[0]['name'] = _listOfCities;
            //service[0]['name'] = _listOfCities[0].name;
          },
        ));
    print('hi');

    print(service[0]['name']);
    print(ser);
    print(_listOfCities);
    // print("welcome${ser?.name}");
    // print(_listOfCities[0].name);
  }

  // void _getData1() async {
  //   service = (await CreateJobService().properties());
  //   print(service);
  //   Future.delayed(const Duration(seconds: 0)).then((value) => setState(
  //         () {
  //           // service = _listOfCities;
  //           //service[0]['name'] = _listOfCities;
  //           //service[0]['name'] = _listOfCities[0].name;
  //         },
  //       ));
  //   print('hi');

  //   print(service[0]['name']);
  //   print(ser);
  //   print(_listOfCities);
  //   // print("welcome${ser?.name}");
  //   // print(_listOfCities[0].name);
  // }
  // void _getData2() async {
  //   service = (await CreateJobService().properties());
  //   print(service);
  //   Future.delayed(const Duration(seconds: 0)).then((value) => setState(
  //         () {
  //           // service = _listOfCities;
  //           //service[0]['name'] = _listOfCities;
  //           //service[0]['name'] = _listOfCities[0].name;
  //         },
  //       ));
  //   print('hi');

  //   print(service[0]['name']);
  //   print(ser);
  //   print(_listOfCities);
  //   // print("welcome${ser?.name}");
  //   // print(_listOfCities[0].name);
  // }
  // List<ServiceType> _listOfCities = [
  //   // ServiceType(id:  , name: name, isDefault: isDefault, isPrimary: isPrimary)
  // ];

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(
          'Service${service[0]['name'].toString()}',
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
        data: service,
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is dynamic) {
              list.add(item['name']);
              print(list);
            }
          }
          showSnackBar(list.toString());
        },
        //enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        const SizedBox(
          height: 5.0,
        ),
        TextFormField(
          controller: widget.textEditingController,
          cursorColor: Colors.black,
          onTap: widget.isCitySelected
              ? () {
                  FocusScope.of(context).unfocus();
                  onTextFieldTap();

                  //CreateJobService().createJobService();
                }
              : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black12,
            contentPadding:
                const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
            hintText: widget.hint,
            // icon: Align(
            //   child: Icon(
            //     Icons.keyboard_arrow_down_sharp,
            //     size: 24,
            //   ),
            // ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
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
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.textEditingController.dispose();
  }
}

class AppTextField1 extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isCitySelected;
  //final List<SelectedListItem>? cities;

  const AppTextField1({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    // this.cities,
    Key? key,
  }) : super(key: key);

  @override
  _AppTextFieldState1 createState() => _AppTextFieldState1();
}

class _AppTextFieldState1 extends State<AppTextField1> {
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  late List<dynamic> service;
  ServiceType? ser;
  List<dynamic> _listOfCities = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getData1();
  }

  void _getData1() async {
    service = (await CreateJobService().properties());
    print(service);
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(
          () {
            // service = _listOfCities;
            //service[0]['name'] = _listOfCities;
            //service[0]['name'] = _listOfCities[0].name;
          },
        ));
    print('hi');

    print(service[0]['name']);
    print(ser);
    print(_listOfCities);
    // print("welcome${ser?.name}");
    // print(_listOfCities[0].name);
  }
  // void _getData2() async {
  //   service = (await CreateJobService().properties());
  //   print(service);
  //   Future.delayed(const Duration(seconds: 0)).then((value) => setState(
  //         () {
  //           // service = _listOfCities;
  //           //service[0]['name'] = _listOfCities;
  //           //service[0]['name'] = _listOfCities[0].name;
  //         },
  //       ));
  //   print('hi');

  //   print(service[0]['name']);
  //   print(ser);
  //   print(_listOfCities);
  //   // print("welcome${ser?.name}");
  //   // print(_listOfCities[0].name);
  // }
  // List<ServiceType> _listOfCities = [
  //   // ServiceType(id:  , name: name, isDefault: isDefault, isPrimary: isPrimary)
  // ];

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(
          'Service${service[0]['name'].toString()}',
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
        data: service,
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is dynamic) {
              list.add(item['name']);
              print(list);
            }
          }
          showSnackBar(list.toString());
        },
        //enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        const SizedBox(
          height: 5.0,
        ),
        TextFormField(
          controller: widget.textEditingController,
          cursorColor: Colors.black,
          onTap: widget.isCitySelected
              ? () {
                  FocusScope.of(context).unfocus();
                  onTextFieldTap();

                  //CreateJobService().createJobService();
                }
              : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black12,
            contentPadding:
                const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
            hintText: widget.hint,
            // icon: Align(
            //   child: Icon(
            //     Icons.keyboard_arrow_down_sharp,
            //     size: 24,
            //   ),
            // ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
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
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.textEditingController.dispose();
  }
}

/// This is common class for 'REGISTER' elevated button.
class _AppElevatedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => new JobScreen2()));
        },
        child: const Text(
          'Next',
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 222, 105, 70),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
