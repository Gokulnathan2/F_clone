// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// class CalendarTextField extends StatefulWidget {
//   @override
//   _CalendarTextFieldState createState() => _CalendarTextFieldState();
// }
// class _CalendarTextFieldState extends State<CalendarTextField> {
//   CalendarController _calendarController;
//   TextEditingController _textEditingController;
//   DateTime _selectedDate;

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
//     final DateTime picked = await showDatePicker(
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
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    Key? key,
  }) : super(key: key);

  @override
  State<DatePicker> createState() => DatePickerState();
}

class DatePickerState extends State<DatePicker> {
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _navigatorKey = GlobalKey<NavigatorState>();
  }

  TextEditingController _date = TextEditingController();
  Future<void> onDatePickTap() async {
    Future.delayed(const Duration(milliseconds: 100)); // Add a delay here
    DateTime? pickeddate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (pickeddate != null) {
      setState(() {
        _date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // _onUnFocusKeyboardAndPop() {
    //   FocusScope.of(context).unfocus();
    //   onDatePickTap();
    //   //  Navigator.of(context).pop();
    // }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          controller: _date,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            isCollapsed: true,
            isDense: true,
            contentPadding:
                const EdgeInsets.only(left: 10, bottom: 10, top: 10, right: 10),
            hintText: 'Select date',
            // icon: Align(
            //   child: Icon(
            //     Icons.keyboard_arrow_down_sharp,
            //     size: 24,
            //   ),
            // ),
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
          onTap: () {
            onDatePickTap();
          },
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
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
