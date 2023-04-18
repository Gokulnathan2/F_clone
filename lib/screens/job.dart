import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gokul_f/layouts/drop_down.dart';
import 'package:gokul_f/layouts/drop_down_location.dart';
import 'package:gokul_f/layouts/stepper.dart';
//import 'package:gokul_f/model/Location.dart';
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

  // @override
  // void dispose() {
  //   super.dispose();
  //   _servicetypeTextEditingController.dispose();
  //   _properyTextEditingController.dispose();
  //   _locationTextEditingController.dispose();
  //   _descripitionTextEditingController.dispose();
  //   _detailedDescripitionTextEditingController.dispose();
  // }

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

          AppTextField2(
            textEditingController: _locationTextEditingController,
            title: 'Location',
            hint: 'Select tenant & unit',
            isCitySelected: true,
            //cities: _listOfCities,
          ),
          AppTextField3(
            textEditingController: _descripitionTextEditingController,
            title: 'Brief Descripition',
            hint: 'Description',
            isCitySelected: false,
          ),
          AppTextField4(
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
  String? dropdownValue;
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
          () {},
        ));
    print('hi');

    print(service[0]['name']);
    print(ser);
    print(_listOfCities);
    // print("welcome${ser?.name}");
    // print(_listOfCities[0].name);
  }

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
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
        data: service,
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is dynamic) {
              list.add(item['name']);
              print(item['name']);
              String name = item['name'];
              setState(() {
                // list[0] = dropdownValue!;
                widget.textEditingController.text = name;
              });
              print(service);
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
        Text(
          widget.title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
              color: Color.fromARGB(255, 20, 56, 103)),
        ),
        const SizedBox(
          height: 5.0,
        ),
        TextFormField(
          //initialValue: dropdownValue,

          readOnly: true,
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
            fillColor: Colors.white,
            isCollapsed: true,
            isDense: true,
            contentPadding:
                const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 10),
            hintText: widget.hint,
            // icon: Align(
            //   child: Icon(
            //     Icons.keyboard_arrow_down_sharp,
            //     size: 24,
            //   ),
            // ),
            hintStyle: const TextStyle(fontSize: 14, color: Colors.black45),
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
      ],
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   widget.textEditingController.dispose();
  // }
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
  AppTextFieldState1 createState() => AppTextFieldState1();
}

class AppTextFieldState1 extends State<AppTextField1> {
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  late List<dynamic> service;
  //String? ser;
  String? id;
  List<dynamic> _listOfCities = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getData1();
    //iD(id);
  }

  void _getData1() async {
    service = (await CreateJobService().properties());
    print(service);
    setState(
      () {},
    );
    print('hi');

    print(service[0]['name']);

    print(_listOfCities);
    // print("welcome${ser?.name}");
    // print(_listOfCities[0].name);
  }

  // Future<String> iD(a) async {
  //   return a;
  // }

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() async {
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
        data: service,
        selectedItems: (List<dynamic> selectedList) async {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is dynamic) {
              list.add(item['name']);
              print(list);
              print(item['id']);
              setState(() {
                // list[0] = dropdownValue!;
                widget.textEditingController.text = item['name'];
              });
              setState(() {
                id = item['id'];
              });
              print('aaaaa$id');

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => AppTextField2(a: a),
              //   ),
              // );

              //AppTextFieldState2().getData1(a);

            }
          }
          showSnackBar(list.toString());
          // Navigator.pop(context, list);
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
        Text(
          widget.title,
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
            fillColor: Colors.white,
            isCollapsed: true,
            isDense: true,
            contentPadding:
                const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 10),
            hintText: widget.hint,
            // icon: Align(
            //   child: Icon(
            //     Icons.keyboard_arrow_down_sharp,
            //     size: 24,
            //   ),
            // ),
            hintStyle: const TextStyle(fontSize: 14, color: Colors.black45),
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
      ],
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   widget.textEditingController.dispose();
  // }

  // loadLocation(id) async {
  //   service = (await CreateJobService().location(id));
  //   Future.delayed(const Duration(seconds: 0)).then((value) => setState(
  //         () {},
  //       ));
  //   print(service);
  //   //return ser;
  // }
}

class AppTextField2 extends StatefulWidget {
  final TextEditingController? textEditingController;
  final String? title;
  final String? hint;
  final bool? isCitySelected;
  final String? a;
  //final List<SelectedListItem>? cities;

  AppTextField2({
    this.textEditingController,
    this.title,
    this.hint,
    this.isCitySelected,
    this.a,
    // this.cities,
    Key? key,
  }) : super(key: key);

  @override
  AppTextFieldState2 createState() => AppTextFieldState2(a: a);
}

class AppTextFieldState2 extends State<AppTextField2> {
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  //late String id = widget.a ?? '';
  String? a = AppTextFieldState1().id;
  List<dynamic>? service;
  ServiceType? ser;
  // List<LoctaionServiceType> _listOfCities = [];
  late List<dynamic> _listOfCities = [];
  AppTextFieldState2({this.a});
  @override
  void initState() {
    super.initState();
    getData1(a);
    // Use a received from widget
  }

  Future<void> getData1(String? id) async {
    if (a != null) {
      print(a);
      //print('id$a');
      _listOfCities = (await CreateJobService().location(id));

      // setState(() {
      //   service = _listOfCities;
      // });
      print(_listOfCities);

      print('hi');

      // print(service['address']);
      print('serv$_listOfCities');
      print(_listOfCities?[0]['address']);
      print(_listOfCities?[0]['units'][0]['tenant']['onboarded']);
      //print(_listOfCities[0].units[0].tenant.onboarded);
      //return service;
      // print("welcome${ser?.name}");
      // print(_listOfCities[0].name);
    } else {
      print('loc');
    }
  }

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownLocationState(
      DropDownLocation(
        bottomSheetTitle: Text(
          'Location',
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
        data: _listOfCities,

        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is dynamic) {
              list.add(item['address']);
              print('list of item$list');
              print(service);
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
        Text(
          widget.title!,
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
          controller: widget.textEditingController,
          cursorColor: Colors.black,
          onTap: widget.isCitySelected!
              ? () {
                  FocusScope.of(context).unfocus();
                  onTextFieldTap();

                  //CreateJobService().createJobService();
                }
              : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            isCollapsed: true,
            isDense: true,
            contentPadding:
                const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 10),
            hintText: widget.hint,
            // icon: Align(
            //   child: Icon(
            //     Icons.keyboard_arrow_down_sharp,
            //     size: 24,
            //   ),
            // ),
            hintStyle: const TextStyle(fontSize: 14, color: Colors.black45),
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
      ],
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   widget.textEditingController!.dispose();
  // }
}

class AppTextField3 extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isCitySelected;
  //final List<SelectedListItem>? cities;

  const AppTextField3({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    // this.cities,
    Key? key,
  }) : super(key: key);

  @override
  _AppTextFieldState3 createState() => _AppTextFieldState3();
}

class _AppTextFieldState3 extends State<AppTextField3> {
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
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(
          () {
            // service = _listOfCities;
            //service[0]['name'] = _listOfCities;
            //service[0]['name'] = _listOfCities[0].name;
          },
        ));
    print('hi');

    // print(service['address']);
    print(service);
    print(_listOfCities);
    // print("welcome${ser?.name}");
    // print(_listOfCities[0].name);
  }

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDownCopy(
        bottomSheetTitle: Text(
          'Service${service.toString()}',
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
              list.add(item['address']);
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
        Text(
          widget.title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
              color: Color.fromARGB(255, 20, 56, 103)),
        ),
        const SizedBox(
          height: 5.0,
        ),
        TextFormField(
          // readOnly: true,
          controller: widget.textEditingController,
          cursorColor: Colors.black,
          onTap: widget.isCitySelected
              ? () {
                  FocusScope.of(context).unfocus();
                  onTextFieldTap();

                  //CreateJobService().createJobService();
                }
              : null,
          maxLines: 4,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            isCollapsed: true,
            isDense: true,
            contentPadding:
                const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
            hintText: widget.hint,
            // icon: Align(
            //   child: Icon(
            //     Icons.keyboard_arrow_down_sharp,
            //     size: 24,
            //   ),
            // ),
            hintStyle: const TextStyle(fontSize: 14, color: Colors.black45),
            // suffixIcon: const Icon(
            //   Icons.keyboard_arrow_down_sharp,
            //   size: 30,
            // ),
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

  // @override
  // void dispose() {
  //   super.dispose();
  //   widget.textEditingController.dispose();
  // }
}

class AppTextField4 extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isCitySelected;
  //final List<SelectedListItem>? cities;

  const AppTextField4({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    // this.cities,
    Key? key,
  }) : super(key: key);

  @override
  _AppTextFieldState4 createState() => _AppTextFieldState4();
}

class _AppTextFieldState4 extends State<AppTextField4> {
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
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(
          () {
            // service = _listOfCities;
            //service[0]['name'] = _listOfCities;
            //service[0]['name'] = _listOfCities[0].name;
          },
        ));
    print('hi');

    // print(service['address']);
    print(service);
    print(_listOfCities);
    // print("welcome${ser?.name}");
    // print(_listOfCities[0].name);
  }

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDownCopy(
        bottomSheetTitle: Text(
          'Service${service.toString()}',
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
              list.add(item['address']);
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
        Text(
          widget.title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
              color: Color.fromARGB(255, 20, 56, 103)),
        ),
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
          maxLines: 4,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            isCollapsed: true,
            isDense: true,
            contentPadding:
                const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
            hintText: widget.hint,
            // icon: Align(
            //   child: Icon(
            //     Icons.keyboard_arrow_down_sharp,
            //     size: 24,
            //   ),
            // ),
            hintStyle: const TextStyle(fontSize: 14, color: Colors.black45),
            // suffixIcon: const Icon(
            //   Icons.keyboard_arrow_down_sharp,
            //   size: 30,
            // ),
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

  // @override
  // void dispose() {
  //   super.dispose();
  //   widget.textEditingController.dispose();
  // }
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
