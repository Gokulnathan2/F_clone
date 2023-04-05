// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:gokul_f/layouts/bottom_navigation_Screen.dart';
// import 'package:gokul_f/layouts/icon.dart';
// import 'package:gokul_f/model/emergency_model.dart';
// import 'package:gokul_f/model/emergency_model.dart';
// import 'package:gokul_f/screens/More_Menu_Screen.dart';
// import 'package:gokul_f/screens/camera_screen.dart';
// import 'package:gokul_f/screens/chat_screen.dart';
// import 'package:gokul_f/screens/dashboard_screen.dart';
// import 'package:gokul_f/screens/login/environment_screen.dart';
// import 'package:gokul_f/screens/notifications_screen.dart';
// import 'package:gokul_f/services/dashboard_services.dart';
// import 'package:gokul_f/services/emergency_services.dart';

// import '../model/dash_board_model.dart';
// import '../model/emergency_model.dart';
// import '../model/emergency_model.dart';

// class EmergencyScreen extends StatefulWidget {
//   const EmergencyScreen({Key? key}) : super(key: key);
//   // final String? baseurls;
//   // const DashBoardScreen({super.key, this.baseurls});
//   @override
//   State<EmergencyScreen> createState() => _EmergencyState();
// }

// class _EmergencyState extends State<EmergencyScreen> {
//   static final storage = FlutterSecureStorage();
//   final scrollController = ScrollController();
//   bool isLoadingMore = false;
//   EmergencyResponseModel? eme;
//   var page = 1;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _getData();
//     scrollController.addListener(_scrollListener);
//   }

//   _getData() async {
//     dynamic baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
//     eme = await (EmergencyService(
//       service: Dio(BaseOptions(
//           baseUrl:
//               'https://${baseurl1}/v1/jobs/?filter=emergency&page=${page}')),
//     ).emergencyService());
//     // final json = jsonDecode(eme.results) as List;
//     Future.delayed(const Duration(seconds: 0)).then((value) => setState(
//           () {
//             eme = eme;
//           },
//         ));
//   }

//   Future<void> _scrollListener() async {
//     if (isLoadingMore) return;
//     if (scrollController.position.pixels ==
//         scrollController.position.maxScrollExtent) {
//       page = page + 1;
//       setState(() {
//         isLoadingMore = true;
//       });
//       await _getData();
//       setState(() {
//         isLoadingMore = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           '${eme?.count ?? 0} Emergency',
//         ),
//         leading: (Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               child: IconButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 icon: Icon(
//                   Icons.arrow_back,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//               ),
//             ),
//           ],
//         )),

//         automaticallyImplyLeading: false,
//         backgroundColor: Color.fromARGB(255, 4, 31, 68),
//         //title: const Text('AppBar Demo'),
//         actions: <Widget>[],
//       ),
//       body: RefreshIndicator(
//         onRefresh: refresh,
//         child: FutureBuilder(
//             future: getUsers(),
//             builder: (context, snapshot) {
//               if (eme != null) {
//                 return ListView.builder(
//                     // shrinkWrap: true,
//                     controller: scrollController,
//                     itemCount: isLoadingMore
//                         ? eme!.results.length + 1
//                         : eme!.results.length,
//                     itemBuilder: (context, index) {
//                       var data = eme?.results[index].id;
//                       var data1 = data.toString();
//                       var property = eme?.results[index].property.name;
//                       var property1 = property.toString();
//                       var servicetype = eme?.results[index].serviceType ?? '';
//                       var servicetype1 = servicetype.toString();
//                       var stage = eme?.results[index].stage.name.name;
//                       var stage1 = stage.toString();
//                       var issuetype = eme?.results[index].issueType;
//                       var issuetype1 = issuetype.toString();
//                       var priority = eme?.results[index].priority.name;
//                       var priority1 = priority.toString();
//                       var Location = eme?.results[index].unit;
//                       var Location1 = Location.toString();
//                       var category = eme?.results[index].category;
//                       var category1 = category.toString();

//                       return //SingleChildScrollView(
//                           Column(
//                         children: [
//                           Container(
//                             //height: 70,
//                             padding: const EdgeInsets.all(1),
//                             margin: EdgeInsets.all(7),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Colors.white,
//                             ),
//                             child: Column(
//                               children: [
//                                 ListTile(
//                                   title: Text(
//                                     property1,
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   subtitle: Text(
//                                     '${servicetype1}'
//                                     ' ${data1}',
//                                     style: TextStyle(
//                                         color: Colors.black, fontSize: 15),
//                                   ),
//                                   trailing: Container(
//                                     child: Text(stage1),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       color: Color.fromRGBO(
//                                         253,
//                                         245,
//                                         235,
//                                         1,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   alignment: Alignment(-0.9, 0),
//                                   child: new Text(
//                                     issuetype1,
//                                     // style: new TextStyle(
//                                     //     fontSize: 20.0, color: Colors.amber),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Row(
//                                   //    mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       height: 18,
//                                       width: 100,
//                                       alignment: Alignment(0, 0),
//                                       child: Center(
//                                         child: new Text(
//                                           'Priority',
//                                           style: new TextStyle(
//                                               fontSize: 15.0,
//                                               color: Color.fromARGB(
//                                                   255, 99, 96, 96)),
//                                           // style: new TextStyle(
//                                           //     fontSize: 20.0, color: Colors.amber),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 50,
//                                     ),
//                                     Container(
//                                       height: 18,
//                                       width: 100,
//                                       alignment: Alignment.bottomCenter,
//                                       child: Center(
//                                         child: new Text(
//                                           'Location',
//                                           style: new TextStyle(
//                                               fontSize: 15.0,
//                                               color: Color.fromARGB(
//                                                   255, 99, 96, 96)),

//                                           // style: new TextStyle(
//                                           //     fontSize: 20.0, color: Colors.amber),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 30,
//                                     ),
//                                     Container(
//                                       height: 18,
//                                       width: 100,
//                                       alignment: Alignment.bottomRight,
//                                       child: Center(
//                                         child: new Text(
//                                           'Category',
//                                           style: new TextStyle(
//                                               fontSize: 15.0,
//                                               color: Color.fromARGB(
//                                                   255, 99, 96, 96)),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       height: 18,
//                                       width: 100,
//                                       alignment: Alignment(-0.9, 0),
//                                       child: Center(
//                                         child: new Text(
//                                           priority1,
//                                           style: new TextStyle(
//                                               // fontSize: 15.0,
//                                               fontWeight: FontWeight.bold,
//                                               color:
//                                                   Color.fromARGB(255, 0, 0, 0)),
//                                         ),
//                                       ),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(20),
//                                         color: Color.fromRGBO(231, 4, 0, 1),
//                                       ),
//                                     ),
//                                     // SizedBox(
//                                     //   width: 50,
//                                     // ),
//                                     Container(
//                                       height: 18,
//                                       width: 130,
//                                       // alignment: Alignment.bottomCenter,
//                                       child: Center(
//                                         child: new Text(
//                                           Location1,
//                                           maxLines: 1,
//                                           // overflow: TextOverflow.ellipsis,
//                                           // softWrap: true,
//                                           style: new TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: Color.fromARGB(
//                                                   255, 20, 56, 103)),

//                                           // style: new TextStyle(
//                                           //     fontSize: 20.0, color: Colors.amber),
//                                         ),
//                                       ),
//                                     ),
//                                     // SizedBox(
//                                     //   width: 30,
//                                     // ),
//                                     Container(
//                                       height: 18,
//                                       width: 130,
//                                       // alignment: Alignment.bottomRight,
//                                       child: Center(
//                                         child: new Text(
//                                           category1,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                           softWrap: true,
//                                           style: new TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: Color.fromARGB(
//                                                   255, 20, 56, 103)),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       );
//                       //);
//                     });
//               } else if (snapshot.hasError) {
//                 return Text('Result: ${snapshot.data}');
//               } else {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             }),
//       ),
//     );
//   }

//   getUsers() {}
//   Future refresh() async {
//     // setState(() => bal.clear());
//     dynamic baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
//     eme = await (EmergencyService(
//       service: Dio(BaseOptions(
//           baseUrl: 'https://${baseurl1}/v1/jobs/?filter=emergency')),
//     ).emergencyService());
//     setState(() {
//       eme = eme;
//     });
//   }
// }
// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:gokul_f/layouts/bottom_navigation_Screen.dart';
// import 'package:gokul_f/layouts/icon.dart';
// import 'package:gokul_f/model/emergency_model.dart';
// import 'package:gokul_f/model/emergency_model.dart';
// import 'package:gokul_f/screens/More_Menu_Screen.dart';
// import 'package:gokul_f/screens/camera_screen.dart';
// import 'package:gokul_f/screens/chat_screen.dart';
// import 'package:gokul_f/screens/dashboard_screen.dart';
// import 'package:gokul_f/screens/login/environment_screen.dart';
// import 'package:gokul_f/screens/notifications_screen.dart';
// import 'package:gokul_f/services/dashboard_services.dart';
// import 'package:gokul_f/services/emergency_services.dart';
// import '../model/dash_board_model.dart';
// import '../model/emergency_model.dart';
// import '../model/emergency_model.dart';

// class EmergencyScreen extends StatefulWidget {
//   const EmergencyScreen({Key? key}) : super(key: key);
//   // final String? baseurls;
//   // const DashBoardScreen({super.key, this.baseurls});
//   @override
//   State<EmergencyScreen> createState() => _EmergencyState();
// }

// class _EmergencyState extends State<EmergencyScreen> {
//   static final storage = FlutterSecureStorage();
//   late ScrollController _scrollController;
//   EmergencyResponseModel? eme;
//   List<Result> result = [];
//   final int _maxLength = 20;
//   int page = 1;
//   bool isLoading = false;
//   bool hasMore = true;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getResult();
//     _scrollController = ScrollController();
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels >=
//               _scrollController.position.maxScrollExtent &&
//           !isLoading) {
//         if (hasMore) {
//           // page = page + 1;
//           getResult();
//         }
//       }
//     });
//     //_getData();
//   }

//   // _getData() async {
//   //   dynamic baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
//   //   eme = await (EmergencyService(
//   //     service: Dio(BaseOptions(
//   //         baseUrl: 'https://${baseurl1}/v1/jobs/?filter=emergency')),
//   //   ).emergencyService());
//   //   Future.delayed(const Duration(seconds: 0)).then((value) => setState(
//   //         () {},
//   //       ));
//   // }

//   getResult() async {
//     setState(() {
//       isLoading = true;
//     });
//     dynamic baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
//     final response = await (EmergencyService(
//       service: Dio(BaseOptions(
//           baseUrl:
//               'https://${baseurl1}/v1/jobs/?filter=emergency&page=${page}')),
//     ).emergencyService());

//     List data = response!.results;
//     for (final e in response.results) {
//       final id = e;
//       setState(() {
//         print('e, ${e}');
//         result.add(e);
//         //result = e + result;
//         // page = page++;
//       });
//     }
//     Future.delayed(const Duration(seconds: 0)).then((value) => setState(
//           () {
//             isLoading = false;
//             page = page + 1;
//             //result += result;
//             hasMore = result.length < _maxLength;
//           },
//         ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           '${eme?.count ?? 0} Emergency',
//         ),
//         leading: (Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               child: IconButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 icon: Icon(
//                   Icons.arrow_back,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//               ),
//             ),
//           ],
//         )),

//         automaticallyImplyLeading: false,
//         backgroundColor: Color.fromARGB(255, 4, 31, 68),
//         //title: const Text('AppBar Demo'),
//         actions: <Widget>[],
//       ),
//       body: RefreshIndicator(
//         onRefresh: refresh,
//         child: FutureBuilder(
//             future: getUsers(),
//             builder: (context, snapshot) {
//               // if (result != null) {
//               return ListView.builder(
//                   // shrinkWrap: true,
//                   controller: _scrollController,
//                   itemCount: result.length + (hasMore ? 1 : 0),
//                   itemBuilder: (context, index) {
//                     if (index == result.length) {
//                       return const SizedBox(
//                         width: 60,
//                         height: 60,
//                         child: FittedBox(child: CircularProgressIndicator()),
//                       );
//                     }
//                     var data = result[index].id;
//                     var data1 = data.toString();
//                     var property = result[index].property.name;
//                     var property1 = property.toString();
//                     var servicetype = result[index].serviceType ?? '';
//                     var servicetype1 = servicetype.toString();
//                     var stage = result[index].stage.name.name;
//                     var stage1 = stage.toString();
//                     var issuetype = result[index].issueType;
//                     var issuetype1 = issuetype.toString();
//                     var priority = result[index].priority.name;
//                     var priority1 = priority.toString();
//                     var Location = result[index].unit;
//                     var Location1 = Location.toString();
//                     var category = result[index].category;
//                     var category1 = category.toString();

//                     return //SingleChildScrollView(
//                         Column(
//                       children: [
//                         Container(
//                           //height: 70,
//                           padding: const EdgeInsets.all(1),
//                           margin: EdgeInsets.all(7),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.white,
//                           ),
//                           child: Column(
//                             children: [
//                               ListTile(
//                                 title: Text(
//                                   property1,
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 subtitle: Text(
//                                   '${servicetype1}'
//                                   ' ${data1}',
//                                   style: TextStyle(
//                                       color: Colors.black, fontSize: 15),
//                                 ),
//                                 trailing: Container(
//                                   child: Text(stage1),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     color: Color.fromRGBO(
//                                       253,
//                                       245,
//                                       235,
//                                       1,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 alignment: Alignment(-0.9, 0),
//                                 child: new Text(
//                                   issuetype1,
//                                   // style: new TextStyle(
//                                   //     fontSize: 20.0, color: Colors.amber),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Row(
//                                 //    mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     height: 18,
//                                     width: 100,
//                                     alignment: Alignment(0, 0),
//                                     child: Center(
//                                       child: new Text(
//                                         'Priority',
//                                         style: new TextStyle(
//                                             fontSize: 15.0,
//                                             color: Color.fromARGB(
//                                                 255, 99, 96, 96)),
//                                         // style: new TextStyle(
//                                         //     fontSize: 20.0, color: Colors.amber),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 50,
//                                   ),
//                                   Container(
//                                     height: 18,
//                                     width: 100,
//                                     alignment: Alignment.bottomCenter,
//                                     child: Center(
//                                       child: new Text(
//                                         'Location',
//                                         style: new TextStyle(
//                                             fontSize: 15.0,
//                                             color: Color.fromARGB(
//                                                 255, 99, 96, 96)),

//                                         // style: new TextStyle(
//                                         //     fontSize: 20.0, color: Colors.amber),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 30,
//                                   ),
//                                   Container(
//                                     height: 18,
//                                     width: 100,
//                                     alignment: Alignment.bottomRight,
//                                     child: Center(
//                                       child: new Text(
//                                         'Category',
//                                         style: new TextStyle(
//                                             fontSize: 15.0,
//                                             color: Color.fromARGB(
//                                                 255, 99, 96, 96)),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     height: 18,
//                                     width: 100,
//                                     alignment: Alignment(-0.9, 0),
//                                     child: Center(
//                                       child: new Text(
//                                         priority1,
//                                         style: new TextStyle(
//                                             // fontSize: 15.0,
//                                             fontWeight: FontWeight.bold,
//                                             color:
//                                                 Color.fromARGB(255, 0, 0, 0)),
//                                       ),
//                                     ),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       color: Color.fromRGBO(231, 4, 0, 1),
//                                     ),
//                                   ),
//                                   // SizedBox(
//                                   //   width: 50,
//                                   // ),
//                                   Container(
//                                     height: 18,
//                                     width: 130,
//                                     // alignment: Alignment.bottomCenter,
//                                     child: Center(
//                                       child: new Text(
//                                         Location1,
//                                         maxLines: 1,
//                                         overflow: TextOverflow.ellipsis,
//                                         softWrap: true,
//                                         style: new TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: Color.fromARGB(
//                                                 255, 20, 56, 103)),

//                                         // style: new TextStyle(
//                                         //     fontSize: 20.0, color: Colors.amber),
//                                       ),
//                                     ),
//                                   ),
//                                   // SizedBox(
//                                   //   width: 30,
//                                   // ),
//                                   Container(
//                                     height: 18,
//                                     width: 130,
//                                     // alignment: Alignment.bottomRight,
//                                     child: Center(
//                                       child: new Text(
//                                         category1,
//                                         maxLines: 1,
//                                         overflow: TextOverflow.ellipsis,
//                                         softWrap: true,
//                                         style: new TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: Color.fromARGB(
//                                                 255, 20, 56, 103)),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     );
//                     //);
//                   });
//               // } else if (snapshot.hasError) {
//               //   return Text('Result: ${snapshot.data}');
//               // } else {
//               //   return Center(
//               //     child: CircularProgressIndicator(),
//               //   );
//               // }
//             }),
//       ),
//     );
//   }

//   getUsers() {}
//   Future refresh() async {
//     // setState(() => bal.clear());
//     dynamic baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
//     eme = await (EmergencyService(
//       service: Dio(BaseOptions(
//           baseUrl: 'https://${baseurl1}/v1/jobs/?filter=emergency')),
//     ).emergencyService());
//     setState(() {
//       eme = eme;
//     });
//   }
// }
// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:gokul_f/layouts/bottom_navigation_Screen.dart';
// import 'package:gokul_f/layouts/icon.dart';
// import 'package:gokul_f/model/emergency_model.dart';
// import 'package:gokul_f/model/emergency_model.dart';
// import 'package:gokul_f/screens/More_Menu_Screen.dart';
// import 'package:gokul_f/screens/camera_screen.dart';
// import 'package:gokul_f/screens/chat_screen.dart';
// import 'package:gokul_f/screens/dashboard_screen.dart';
// import 'package:gokul_f/screens/login/environment_screen.dart';
// import 'package:gokul_f/screens/notifications_screen.dart';
// import 'package:gokul_f/services/dashboard_services.dart';
// import 'package:gokul_f/services/emergency_services.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// import '../model/dash_board_model.dart';
// import '../model/emergency_model.dart';
// import '../model/emergency_model.dart';

// class EmergencyScreen extends StatefulWidget {
//   const EmergencyScreen({Key? key}) : super(key: key);
//   // final String? baseurls;
//   // const DashBoardScreen({super.key, this.baseurls});
//   @override
//   State<EmergencyScreen> createState() => _EmergencyState();
// }

// class _EmergencyState extends State<EmergencyScreen> {
//   static final storage = FlutterSecureStorage();
//   final scrollController = ScrollController();
//   bool isLoadingMore = false;
//   EmergencyResponseModel? eme;
//   var pageKey = 1;
//   List<Result> result = [];
//   // var _maxlength = 20;
//   bool hasMore = true;
//   static const _pageSize = 20;

//   final PagingController<int, dynamic> _pagingController =
//       PagingController(firstPageKey: 1);

//   @override
//   void initState() {
//     // TODO: implement initState

//     _pagingController.addPageRequestListener((pageKey) {
//       _fetchPage(pageKey);
//     });
//     _fetchPage(pageKey);
//     super.initState();
//     //scrollController.addListener(_scrollListener);
//   }

//   // getData() async {
//   //   dynamic baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
//   //   eme = await (EmergencyService(
//   //     service: Dio(BaseOptions(
//   //         baseUrl: 'https://${baseurl1}/v1/jobs/?filter=emergency')),
//   //   ).emergencyService());
//   //   // final json = jsonDecode(eme.results) as List;

//   //   Future.delayed(const Duration(seconds: 0)).then((value) => setState(
//   //         () {},
//   //       ));
//   // }

//   Future<void> _fetchPage(int pageKey) async {
//     try {
//       dynamic baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
//       eme = await (EmergencyService(
//         service: Dio(BaseOptions(
//             baseUrl:
//                 'https://${baseurl1}/v1/jobs/?filter=emergency&page=${pageKey}')),
//       ).emergencyService());
//       setState(() {
//         // for (final e in eme!.results) {
//         //   final data = e;
//         //   eme!.add(data);
//         // }
//       });
//       // Future.delayed(const Duration(seconds: 0)).then((value) => setState(
//       //       () {
//       //         // _pagingController.appendPage(eme!.results, pageKey++);
//       //       },
//       //     ));

//       print(result);
//       //  final newItems = await RemoteApi.getCharacterList(pageKey, _pageSize);
//       final isLastPage = eme!.results.length > _pageSize;
//       if (isLastPage) {
//         _pagingController.appendLastPage(eme!.results);
//       } else {
//         final nextPageKey = pageKey + 1;
//         _pagingController.appendPage(eme!.results, nextPageKey);
//       }
//     } catch (error) {
//       _pagingController.error = error;
//     }
//     // for(var e in eme!.results){}
//     print(eme!.results);
//     print(eme!.results.length);
//     print(pageKey);
//   }

//   // Future<void> _scrollListener() async {
//   //   if (isLoadingMore) return;
//   //   if (scrollController.position.pixels ==
//   //       scrollController.position.maxScrollExtent * 0.95) {
//   //     page = page + 1;
//   //     setState(() {
//   //       isLoadingMore = true;
//   //       hasMore = eme!.results.length < _maxlength;
//   //     });
//   //     if (hasMore) {
//   //       await _getData();
//   //     }
//   //     setState(() {
//   //       isLoadingMore = false;
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           '${eme?.count ?? 0} Emergency',
//         ),
//         leading: (Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               child: IconButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 icon: Icon(
//                   Icons.arrow_back,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//               ),
//             ),
//           ],
//         )),

//         automaticallyImplyLeading: false,
//         backgroundColor: Color.fromARGB(255, 4, 31, 68),
//         //title: const Text('AppBar Demo'),
//         actions: <Widget>[],
//       ),
//       body: RefreshIndicator(
//         onRefresh: refresh,
//         child: FutureBuilder(
//             future: getUsers(),
//             builder: (context, snapshot) {
//               if (eme != null) {
//                 return PagedListView<int, dynamic>(
//                     // shrinkWrap: true,
//                     pagingController: _pagingController,
//                     //  itemExtent: eme!.results.length,
//                     builderDelegate: PagedChildBuilderDelegate<dynamic>(
//                         itemBuilder: (context, item, index) {
//                       var data = eme?.results[index].id;
//                       var data1 = data.toString();
//                       var property = eme?.results[index].property.name;
//                       var property1 = property.toString();
//                       var servicetype = eme?.results[index].serviceType ?? '';
//                       var servicetype1 = servicetype.toString();
//                       var stage = eme?.results[index].stage.name.name;
//                       var stage1 = stage.toString();
//                       var issuetype = eme?.results[index].issueType;
//                       var issuetype1 = issuetype.toString();
//                       var priority = eme?.results[index].priority.name;
//                       var priority1 = priority.toString();
//                       var Location = eme?.results[index].unit;
//                       var Location1 = Location.toString();
//                       var category = eme?.results[index].category;
//                       var category1 = category.toString();

//                       return //SingleChildScrollView(
//                           Column(
//                         children: [
//                           Container(
//                             //height: 70,
//                             padding: const EdgeInsets.all(1),
//                             margin: EdgeInsets.all(7),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Colors.white,
//                             ),
//                             child: Column(
//                               children: [
//                                 ListTile(
//                                   title: Text(
//                                     property1,
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   subtitle: Text(
//                                     '${servicetype1}'
//                                     ' ${data1}',
//                                     style: TextStyle(
//                                         color: Colors.black, fontSize: 15),
//                                   ),
//                                   trailing: Container(
//                                     child: Text(stage1),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       color: Color.fromRGBO(
//                                         253,
//                                         245,
//                                         235,
//                                         1,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   alignment: Alignment(-0.9, 0),
//                                   child: new Text(
//                                     issuetype1,
//                                     // style: new TextStyle(
//                                     //     fontSize: 20.0, color: Colors.amber),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Row(
//                                   //    mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       height: 18,
//                                       width: 100,
//                                       alignment: Alignment(0, 0),
//                                       child: Center(
//                                         child: new Text(
//                                           'Priority',
//                                           style: new TextStyle(
//                                               fontSize: 15.0,
//                                               color: Color.fromARGB(
//                                                   255, 99, 96, 96)),
//                                           // style: new TextStyle(
//                                           //     fontSize: 20.0, color: Colors.amber),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 50,
//                                     ),
//                                     Container(
//                                       height: 18,
//                                       width: 100,
//                                       alignment: Alignment.bottomCenter,
//                                       child: Center(
//                                         child: new Text(
//                                           'Location',
//                                           style: new TextStyle(
//                                               fontSize: 15.0,
//                                               color: Color.fromARGB(
//                                                   255, 99, 96, 96)),

//                                           // style: new TextStyle(
//                                           //     fontSize: 20.0, color: Colors.amber),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 30,
//                                     ),
//                                     Container(
//                                       height: 18,
//                                       width: 100,
//                                       alignment: Alignment.bottomRight,
//                                       child: Center(
//                                         child: new Text(
//                                           'Category',
//                                           style: new TextStyle(
//                                               fontSize: 15.0,
//                                               color: Color.fromARGB(
//                                                   255, 99, 96, 96)),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       height: 18,
//                                       width: 100,
//                                       alignment: Alignment(-0.9, 0),
//                                       child: Center(
//                                         child: new Text(
//                                           priority1,
//                                           style: new TextStyle(
//                                               // fontSize: 15.0,
//                                               fontWeight: FontWeight.bold,
//                                               color:
//                                                   Color.fromARGB(255, 0, 0, 0)),
//                                         ),
//                                       ),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(20),
//                                         color: Color.fromRGBO(231, 4, 0, 1),
//                                       ),
//                                     ),
//                                     // SizedBox(
//                                     //   width: 50,
//                                     // ),
//                                     Container(
//                                       height: 18,
//                                       width: 130,
//                                       // alignment: Alignment.bottomCenter,
//                                       child: Center(
//                                         child: new Text(
//                                           Location1,
//                                           maxLines: 1,
//                                           // overflow: TextOverflow.ellipsis,
//                                           // softWrap: true,
//                                           style: new TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: Color.fromARGB(
//                                                   255, 20, 56, 103)),

//                                           // style: new TextStyle(
//                                           //     fontSize: 20.0, color: Colors.amber),
//                                         ),
//                                       ),
//                                     ),
//                                     // SizedBox(
//                                     //   width: 30,
//                                     // ),
//                                     Container(
//                                       height: 18,
//                                       width: 130,
//                                       // alignment: Alignment.bottomRight,
//                                       child: Center(
//                                         child: new Text(
//                                           category1,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                           softWrap: true,
//                                           style: new TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: Color.fromARGB(
//                                                   255, 20, 56, 103)),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       );
//                       //);
//                     }));
//               } else if (snapshot.hasError) {
//                 return Text('Result: ${snapshot.data}');
//               } else {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             }),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _pagingController.dispose();
//     super.dispose();
//   }

//   getUsers() {}
//   Future refresh() async {
//     // setState(() => bal.clear());
//     dynamic baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
//     eme = await (EmergencyService(
//       service: Dio(BaseOptions(
//           baseUrl: 'https://${baseurl1}/v1/jobs/?filter=emergency')),
//     ).emergencyService());
//     setState(() {
//       eme = eme;
//     });
//   }
// }
// import 'package:drop_down_list/drop_down_list.dart';
// import 'package:drop_down_list/model/selected_list_item.dart';
// import 'package:flutter/material.dart';

// import 'package:gokul_f/layouts/constants.dart';

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
//           const Text(
//             kRegister,
//             style: TextStyle(
//               fontSize: 34.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(
//             height: 15.0,
//           ),
//           AppTextField(
//             textEditingController: _fullNameTextEditingController,
//             title: kFullName,
//             hint: kEnterYourName,
//             isCitySelected: false,
//           ),
//           AppTextField(
//             textEditingController: _emailTextEditingController,
//             title: kEmail,
//             hint: kEnterYourEmail,
//             isCitySelected: false,
//           ),
//           AppTextField(
//             textEditingController: _phoneNumberTextEditingController,
//             title: kPhoneNumber,
//             hint: kEnterYourPhoneNumber,
//             isCitySelected: false,
//           ),
//           AppTextField(
//             textEditingController: _cityTextEditingController,
//             title: kCity,
//             hint: kChooseYourCity,
//             isCitySelected: true,
//             cities: _listOfCities,
//           ),
//           AppTextField(
//             textEditingController: _passwordTextEditingController,
//             title: kPassword,
//             hint: kAddYourPassword,
//             isCitySelected: false,
//           ),
//           const SizedBox(
//             height: 15.0,
//           ),
//           //_AppElevatedButton(),
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
//           kCities,
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
//         enableMultipleSelection: true,
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
//           kREGISTER,
//           style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
//         ),
//         style: ElevatedButton.styleFrom(
//           primary: const Color.fromRGBO(70, 76, 222, 1),
//           textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
