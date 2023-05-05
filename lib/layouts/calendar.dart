// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
// class CalendarTextField extends StatefulWidget {
//   @override
//   _CalendarTextFieldState createState() => _CalendarTextFieldState();
// }
// class _CalendarTextFieldState extends State<CalendarTextField> {
//   CalendarController _calendarController;
//   TextEditingController _textEditingController;
//   DateTime ? _selectedDate;

//   @override
//   void initState() {
//     super.initState();
//     _calendarController = CalendarController();
//     _textEditingController = TextEditingController();
//     _selectedDate = DateTime.now();
//   }

//   @override
//   void dispose() {
//     _calendarController.dispose();
//     _textEditingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextFormField(
//           controller: _textEditingController,
//           onTap: () => _showCalendarDialog(context),
//           decoration: InputDecoration(
//             labelText: 'Select Date',
//             suffixIcon: Icon(Icons.calendar_today),
//           ),
//           readOnly: true,
//         ),
//         SizedBox(height: 16.0),
//         ElevatedButton(
//           onPressed: () => _showCalendarDialog(context),
//           child: Text('Select Date'),
//         ),
//       ],
//     );
//   }

//   void _showCalendarDialog(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2100),
//     );

//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//         _textEditingController.text = DateFormat('yyyy-MM-dd').format(picked);
//       });
//     }
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class DatePicker extends StatefulWidget {
//   const DatePicker({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<DatePicker> createState() => DatePickerState();
// }

// class DatePickerState extends State<DatePicker> {
//   TextEditingController _date = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     void ondatepickTap() async {
//       await Future.delayed(
//           const Duration(milliseconds: 100)); // Add a delay here
//       DateTime? pickeddate = await showDatePicker(
//           context: context,
//           initialDate: DateTime.now(),
//           firstDate: DateTime(2000),
//           lastDate: DateTime(2101));
//       if (pickeddate != null) {
//         setState(() {
//           _date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
//         });
//       }
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('ff'),
//         const SizedBox(
//           height: 5.0,
//         ),
//         TextFormField(
//           controller: _date,
//           cursorColor: Colors.black,
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: Colors.black12,
//             contentPadding:
//                 const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
//             // hintText: widget.hint,
//             suffixIcon: const Icon(
//               Icons.calendar_today_rounded,
//               size: 30,
//             ),
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
//           onTap: () async {
//             print('o');
//             FocusScope.of(context).unfocus();
//             ondatepickTap();
//           },
//         ),
//         const SizedBox(
//           height: 15.0,
//         ),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';
// //import 'package:intl/intl.dart';

// class DatePicker extends StatefulWidget {
//   const DatePicker({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<DatePicker> createState() => DatePickerState();
// }

// class DatePickerState extends State<DatePicker> {
//   GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

//   @override
//   void initState() {
//     super.initState();
//     _navigatorKey = GlobalKey<NavigatorState>();
//   }

//   TextEditingController _date = TextEditingController();
//   Future<void> onDatePickTap() async {
//     Future.delayed(const Duration(milliseconds: 100)); // Add a delay here
//     DateTime? pickeddate = await showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime(2000),
//         lastDate: DateTime(2101));
//     if (pickeddate != null) {
//       setState(() {
//         //_date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // _onUnFocusKeyboardAndPop() {
//     //   FocusScope.of(context).unfocus();
//     //   onDatePickTap();
//     //   //  Navigator.of(context).pop();
//     // }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Target Completion Date',
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
//           controller: _date,
//           // cursorColor: Colors.black,
//           decoration: InputDecoration(
//             // filled: true,
//             // fillColor: Colors.white,
//             // isCollapsed: true,
//             // isDense: true,
//             contentPadding:
//                 const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 10),
//             hintText: 'Select date',
//             // icon: Align(
//             //   child: Icon(
//             //     Icons.keyboard_arrow_down_sharp,
//             //     size: 24,
//             //   ),
//             // ),
//             hintStyle: const TextStyle(fontSize: 14, color: Colors.black45),
//             suffixIcon: const Icon(
//               Icons.calendar_today_rounded,
//               size: 30,
//             ),
//             border: const OutlineInputBorder(
//               borderSide: BorderSide(
//                 width: 0,
//                 // style: BorderStyle.none,
//               ),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(8.0),
//               ),
//             ),
//           ),
//           onTap: () {
//             onDatePickTap();
//           },
//         ),
//         const SizedBox(
//           height: 15.0,
//         ),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';

// import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;

// class DatePicker extends StatefulWidget {
//   const DatePicker({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<DatePicker> createState() => DatePickerState();
// }

// class DatePickerState extends State<DatePicker> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   TextEditingController _dateController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: ElevatedButton(
//         // controller: _dateController,
//         // readOnly: true,
//         onPressed: () {
//           _showDatePicker(context);
//         },
//         child: null,
//         // decoration: InputDecoration(
//         //   labelText: 'Select Date',
//         // ),
//       ),
//     );
//   }

//   void _showDatePicker(BuildContext context) async {
//     try {
//       await Future.delayed(Duration(milliseconds: 100));
//       final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime(DateTime.now().year - 5),
//         lastDate: DateTime(DateTime.now().year + 5),
//         builder: (BuildContext context, Widget? child) {
//           return Builder(
//             builder: (BuildContext context) {
//               return Theme(
//                 data: ThemeData.light().copyWith(
//                   colorScheme: ColorScheme.light().copyWith(
//                     primary: Colors
//                         .blue, // Set the primary color for the date picker
//                   ),
//                 ),
//                 child: child!,
//               );
//             },
//           );
//         },
//       );

//       if (picked != null) {
//         // Update the text input with the selected date
//         setState(() {
//           _dateController.text = picked.toString();
//         });
//       }
//     } catch (e) {
//       // Handle any exceptions related to navigator state
//       print('Error showing date picker: $e');
//     }
//   }
// }
// import 'package:flutter/material.dart';

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({super.key, this.restorationId});

//   final String? restorationId;

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// /// RestorationProperty objects can be used because of RestorationMixin.
// class _MyStatefulWidgetState extends State<MyStatefulWidget>
//     with RestorationMixin {
//   // In this example, the restoration ID for the mixin is passed in through
//   // the [StatefulWidget]'s constructor.
//   @override
//   String? get restorationId => widget.restorationId;

//   final RestorableDateTime _selectedDate =
//       RestorableDateTime(DateTime(2021, 7, 25));
//   late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
//       RestorableRouteFuture<DateTime?>(
//     onComplete: _selectDate,
//     onPresent: (NavigatorState navigator, Object? arguments) {
//       return navigator.restorablePush(
//         _datePickerRoute,
//         arguments: _selectedDate.value.millisecondsSinceEpoch,
//       );
//     },
//   );

//   static Route<DateTime> _datePickerRoute(
//     BuildContext context,
//     Object? arguments,
//   ) {
//     return DialogRoute<DateTime>(
//       context: context,
//       builder: (BuildContext context) {
//         return DatePickerDialog(
//           restorationId: 'date_picker_dialog',
//           initialEntryMode: DatePickerEntryMode.calendarOnly,
//           initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
//           firstDate: DateTime.now(),
//           lastDate: DateTime(2022),
//         );
//       },
//     );
//   }

//   @override
//   void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
//     registerForRestoration(_selectedDate, 'selected_date');
//     registerForRestoration(
//         _restorableDatePickerRouteFuture, 'date_picker_route_future');
//   }

//   void _selectDate(DateTime? newSelectedDate) {
//     if (newSelectedDate != null) {
//       setState(() {
//         _selectedDate.value = newSelectedDate;
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text(
//               'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
//         ));
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: OutlinedButton(
//           onPressed: () {
//             _restorableDatePickerRouteFuture.present();
//           },
//           child: const Text('Open Date Picker'),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CalendarForm extends StatefulWidget {
  @override
  _CalendarFormState createState() => _CalendarFormState();
}

class _CalendarFormState extends State<CalendarForm> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,

      showCursor: false,
      // cursorColor: Colors.black,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 10),
        hintText: 'Select date',
        hintStyle: const TextStyle(fontSize: 14, color: Colors.black45),
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
      onTap: () => _selectDate(context),
      controller: TextEditingController(
        text:
            '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
      ),

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a date';
        }
        return null;
      },
    );
  }
}
