import 'package:flutter/material.dart';
import 'package:gokul_f/layouts/global_dec.dart';
import 'package:gokul_f/layouts/stepper.dart';
import 'package:gokul_f/model/Location.dart';
import 'package:gokul_f/model/selected_type.dart';
import 'package:gokul_f/model/service_model.dart';

import 'app_text.dart';

class DropDownLocation {
  /// This will give the list of data.
  final List<dynamic>? data;

  /// This will give the call back to the selected items from list.
  final Function(List<dynamic>)? selectedItems;

  /// [listBuilder] will gives [index] as a function parameter and you can return your own widget based on [index].
  final Widget Function(int index)? listBuilder;

  /// This will give selection choice for single or multiple for list.
  final bool enableMultipleSelection;

  /// This gives the bottom sheet title.
  final Widget? bottomSheetTitle;

  /// You can set your custom submit button when the multiple selection is enabled.
  final Widget? submitButtonChild;

  /// [searchWidget] is use to show the text box for the searching.
  /// If you are passing your own widget then you must have to add [TextEditingController] for the [TextFormField].
  final TextFormField? searchWidget;

  /// [isSearchVisible] flag use to manage the search widget visibility
  /// by default it is [True] so widget will be visible.
  final bool isSearchVisible;

  /// This will set the background color to the dropdown.
  final Color dropDownBackgroundColor;

  DropDownLocation({
    Key? key,
    required this.data,
    this.selectedItems,
    this.listBuilder,
    this.enableMultipleSelection = false,
    this.bottomSheetTitle,
    this.submitButtonChild,
    this.searchWidget,
    this.isSearchVisible = true,
    this.dropDownBackgroundColor = Colors.transparent,
  });
}

class DropDownLocationState {
  DropDownLocation dropDown;

  DropDownLocationState(this.dropDown);

  /// This gives the bottom sheet widget.
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
            return MainBody(dropDown: dropDown);
          },
        );
      },
    );
  }
}

/// This is main class to display the bottom sheet body.
class MainBody extends StatefulWidget {
  final DropDownLocation dropDown;

  const MainBody({required this.dropDown, Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  /// This list will set when the list of data is not available.
  List<dynamic>? mainList = [];
  // List<String> unitNames = [];
  @override
  void initState() {
    super.initState();
    mainList = widget.dropDown.data;
    _setSearchWidgetListener();
  }

  @override
  Widget build(BuildContext context) {
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
                      child: widget.dropDown.bottomSheetTitle ?? Container()),
                ],
              ),
            ),

            /// A [TextField] that displays a list of suggestions as the user types with clear button.
            Visibility(
              visible: widget.dropDown.isSearchVisible,
              child: widget.dropDown.searchWidget ??
                  AppTextField(
                    // dropDown: widget.dropDown??{} ,
                    onTextChanged: _buildSearchList,
                  ),
            ),

            /// Listview (list of data with check box for multiple selection & on tile tap single selection)
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: mainList?.length,
                itemBuilder: (context, index) {
                  List<String> tenantNames = [];
                  final address = mainList?[index]['address'] ?? '';

                  List<Map<String, dynamic>> units =
                      mainList?[index]['units'].cast<Map<String, dynamic>>() ??
                          [];

                  // print(unitNames);
                  print(tenantNames);
                  return InkWell(
                    child: Container(
                      color: widget.dropDown.dropDownBackgroundColor,
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
                              // setState(() {
                              ClassA instanceOfClassA = ClassA();
                              // });
                              MyStepperState instanceOfClassB =
                                  MyStepperState();
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
                                  print('ad$address');
                                  print('ten$tenantName');
                                  print('tn$tName');

                                  setState(() {
                                    MyStepperState().tnn = tName ?? '';
                                  });

                                  // print(instanceOfClassA.tna);
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    onTap: widget.dropDown.enableMultipleSelection
                        ? null
                        : () {
                            widget.dropDown.selectedItems
                                ?.call([mainList?[index]]);
                            _onUnFocusKeyboardAndPop();
                          },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  /// This helps when search enabled & show the filtered data in list.
  _buildSearchList(String userSearchTerm) {
    final results = widget.dropDown.data
        ?.where((element) => element['address']
            .toLowerCase()
            .contains(userSearchTerm.toLowerCase()))
        .toList();
    if (userSearchTerm.isEmpty) {
      mainList = widget.dropDown.data;
    } else {
      mainList = results;
    }
    setState(() {});
  }

  /// This helps to UnFocus the keyboard & pop from the bottom sheet.
  _onUnFocusKeyboardAndPop() {
    FocusScope.of(context).unfocus();
    Navigator.of(context).pop();
  }

  void _setSearchWidgetListener() {
    print('ml${widget.dropDown.data}');
    TextFormField? _searchField =
        (widget.dropDown.searchWidget as TextFormField?);
    _searchField?.controller?.addListener(() {
      _buildSearchList(_searchField.controller?.text ?? '');
    });
  }
}
