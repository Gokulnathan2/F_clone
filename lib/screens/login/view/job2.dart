// import 'package:drop_down_list/drop_down_list.dart';
// import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:gokul_f/layouts/calendar.dart';
import 'package:gokul_f/layouts/drop_down.dart';
import 'package:gokul_f/layouts/file_upload.dart';
import 'package:gokul_f/layouts/stepper.dart';
import 'package:gokul_f/model/service_model.dart';
import 'package:gokul_f/services/create_job_service.dart';
//import 'package:intl/intl.dart';

import '../../../model/selected_type.dart';

//import 'constants.dart';

class JobScreen2 extends StatefulWidget {
  const JobScreen2({
    Key? key,
  }) : super(key: key);

  @override
  JobScreen1State createState() => JobScreen1State();
}

class JobScreen1State extends State<JobScreen2> {
  /// This is list of city which will pass to the drop down.
  final List<ServiceType> _listOfCities = [];

  /// This is register text field controllers.
  final TextEditingController _categoryTextEditingController =
      TextEditingController();
  final TextEditingController _priorityTextEditingController =
      TextEditingController();
  final TextEditingController _phoneNumberTextEditingController =
      TextEditingController();

  TextEditingController _datePickerController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _categoryTextEditingController.dispose();
    _priorityTextEditingController.dispose();
    _phoneNumberTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: mainBody(),
    );
  }

  /// This is Main Body widget.
  Widget mainBody() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30.0,
          ),
          // const Text(
          //   ' kRegister',
          //   style: TextStyle(
          //     fontSize: 34.0,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // const SizedBox(
          //   height: 15.0,
          // ),
          AppTextField(
            textEditingController: _categoryTextEditingController,
            title: 'Maintenance Category',
            hint: 'Select',
            isCitySelected: true,
            //  cities: _listOfCities,
          ),
          AppTextField1(
            textEditingController: _priorityTextEditingController,
            title: 'Priority',
            hint: 'Select',
            isCitySelected: true,
            cities: _listOfCities,
          ),
          // AppTextField(
          //   textEditingController:  _cityTextEditingController,
          //   title: 'Service Type',
          //   hint: 'Select',
          //   isCitySelected: true,
          //   cities: _listOfCities,
          // ),

          DatePicker(),

          ImagePickerPage(),

          const SizedBox(
            height: 15.0,
          ),
          //_AppElevatedButton(),
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
  final List<ServiceType>? cities;

  const AppTextField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    this.cities,
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
    service = (await CreateJobService().categories());
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
        data: service,
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is dynamic) {
              list.add(item['name']);
              print(item['name']);
              setState(() {
                // list[0] = dropdownValue!;
                widget.textEditingController.text = item['name'];
              });
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
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}

class AppTextField1 extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<ServiceType>? cities;

  const AppTextField1({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    this.cities,
    Key? key,
  }) : super(key: key);

  @override
  _AppTextField1State createState() => _AppTextField1State();
}

class _AppTextField1State extends State<AppTextField1> {
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
    service = (await CreateJobService().priority());
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
        data: service,
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is dynamic) {
              list.add(item['name']);
              print(item['name']);
              setState(() {
                // list[0] = dropdownValue!;
                widget.textEditingController.text = item['name'];
              });
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
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}

/// This is common class for 'REGISTER' elevated button.
class _AppElevatedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
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
