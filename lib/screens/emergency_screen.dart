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
//   var page = 1;
//   List<Result> result = [];
//   // var _maxlength = 20;
//   bool hasMore = true;
//   static const _pageSize = 20;

//   final PagingController<int, Result> _pagingController =
//       PagingController(firstPageKey: 0);

//   @override
//   void initState() {
//     // TODO: implement initState

//     _pagingController.addPageRequestListener((pageKey) {
//       _fetchPage(pageKey);
//     });
//     // getData();
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
//       setState(() {});
//       // Future.delayed(const Duration(seconds: 0)).then((value) => setState(
//       //       () {
//       //         eme!.results.addAll;
//       //       },
//       //     ));
//       //  final newItems = await RemoteApi.getCharacterList(pageKey, _pageSize);
//       final isLastPage = eme!.results.length > _pageSize;
//       if (isLastPage) {
//         _pagingController.appendLastPage(eme!.results);
//       } else {
//         final nextPageKey = pageKey + eme!.results.length;
//         _pagingController.appendPage(eme!.results, nextPageKey);
//       }
//     } catch (error) {
//       _pagingController.error = error;
//     }
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
//                 return PagedListView<int, Result>(
//                     // shrinkWrap: true,
//                     pagingController: _pagingController,
//                     //  itemExtent: eme!.results.length,
//                     builderDelegate: PagedChildBuilderDelegate<Result>(
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
//   EmergencyResponseModel? eme;
//   List<Result> _result = [];
//   int _currentPage = 1;
//   int _itemsPerPage = 20;
//   bool _isLoading = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _getData();
//   }

//   Future<void> _getData() async {
//     setState(() {
//       _isLoading = true;
//     });
//     dynamic baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
//     final result = await (EmergencyService(
//       service: Dio(BaseOptions(
//           baseUrl:
//               'https://${baseurl1}/v1/jobs/?filter=emergency&page=${_currentPage}}')),
//     ).emergencyService()) as List<Result>;
//     Future.delayed(const Duration(seconds: 0)).then((value) => setState(
//           () {
//             _isLoading = false;
//             _result.addAll(result);
//             _currentPage++;
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
//               // if (eme != null) {
//               return ListView.builder(
//                 // shrinkWrap: true,

//                 itemCount: _result.length,
//                 itemBuilder: (context, index) {
//                   var data = _result[index].id;
//                   var data1 = data.toString();
//                   var property = eme?.results[index].property.name;
//                   var property1 = property.toString();
//                   var servicetype = eme?.results[index].serviceType ?? '';
//                   var servicetype1 = servicetype.toString();
//                   var stage = eme?.results[index].stage.name.name;
//                   var stage1 = stage.toString();
//                   var issuetype = eme?.results[index].issueType;
//                   var issuetype1 = issuetype.toString();
//                   var priority = eme?.results[index].priority.name;
//                   var priority1 = priority.toString();
//                   var Location = eme?.results[index].unit;
//                   var Location1 = Location.toString();
//                   var category = eme?.results[index].category;
//                   var category1 = category.toString();

//                   return //SingleChildScrollView(
//                       Column(
//                     children: [
//                       Container(
//                         //height: 70,
//                         padding: const EdgeInsets.all(1),
//                         margin: EdgeInsets.all(7),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.white,
//                         ),
//                         child: Column(
//                           children: [
//                             ListTile(
//                               title: Text(
//                                 property1,
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               subtitle: Text(
//                                 '${servicetype1}'
//                                 ' ${data1}',
//                                 style: TextStyle(
//                                     color: Colors.black, fontSize: 15),
//                               ),
//                               trailing: Container(
//                                 child: Text(stage1),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Color.fromRGBO(
//                                     253,
//                                     245,
//                                     235,
//                                     1,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               alignment: Alignment(-0.9, 0),
//                               child: new Text(
//                                 issuetype1,
//                                 // style: new TextStyle(
//                                 //     fontSize: 20.0, color: Colors.amber),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               //    mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   height: 18,
//                                   width: 100,
//                                   alignment: Alignment(0, 0),
//                                   child: Center(
//                                     child: new Text(
//                                       'Priority',
//                                       style: new TextStyle(
//                                           fontSize: 15.0,
//                                           color:
//                                               Color.fromARGB(255, 99, 96, 96)),
//                                       // style: new TextStyle(
//                                       //     fontSize: 20.0, color: Colors.amber),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 50,
//                                 ),
//                                 Container(
//                                   height: 18,
//                                   width: 100,
//                                   alignment: Alignment.bottomCenter,
//                                   child: Center(
//                                     child: new Text(
//                                       'Location',
//                                       style: new TextStyle(
//                                           fontSize: 15.0,
//                                           color:
//                                               Color.fromARGB(255, 99, 96, 96)),

//                                       // style: new TextStyle(
//                                       //     fontSize: 20.0, color: Colors.amber),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 30,
//                                 ),
//                                 Container(
//                                   height: 18,
//                                   width: 100,
//                                   alignment: Alignment.bottomRight,
//                                   child: Center(
//                                     child: new Text(
//                                       'Category',
//                                       style: new TextStyle(
//                                           fontSize: 15.0,
//                                           color:
//                                               Color.fromARGB(255, 99, 96, 96)),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   height: 18,
//                                   width: 100,
//                                   alignment: Alignment(-0.9, 0),
//                                   child: Center(
//                                     child: new Text(
//                                       priority1,
//                                       style: new TextStyle(
//                                           // fontSize: 15.0,
//                                           fontWeight: FontWeight.bold,
//                                           color: Color.fromARGB(255, 0, 0, 0)),
//                                     ),
//                                   ),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     color: Color.fromRGBO(231, 4, 0, 1),
//                                   ),
//                                 ),
//                                 // SizedBox(
//                                 //   width: 50,
//                                 // ),
//                                 Container(
//                                   height: 18,
//                                   width: 130,
//                                   // alignment: Alignment.bottomCenter,
//                                   child: Center(
//                                     child: new Text(
//                                       Location1,
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       softWrap: true,
//                                       style: new TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           color:
//                                               Color.fromARGB(255, 20, 56, 103)),

//                                       // style: new TextStyle(
//                                       //     fontSize: 20.0, color: Colors.amber),
//                                     ),
//                                   ),
//                                 ),
//                                 // SizedBox(
//                                 //   width: 30,
//                                 // ),
//                                 Container(
//                                   height: 18,
//                                   width: 130,
//                                   // alignment: Alignment.bottomRight,
//                                   child: Center(
//                                     child: new Text(
//                                       category1,
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       softWrap: true,
//                                       style: new TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           color:
//                                               Color.fromARGB(255, 20, 56, 103)),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   );
//                   //);
//                 },
//                 controller: ScrollController()
//                   ..addListener(() {
//                     if (!_isLoading &&
//                         context != null &&
//                         _currentPage > 1 &&
//                         (context.size!.height -
//                                 (context.findRenderObject()!.paintBounds.top +
//                                     context
//                                         .findRenderObject()!
//                                         .paintBounds
//                                         .bottom)) <
//                             100) {
//                       _getData();
//                     }
//                   }),
//               );
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
// import 'package:http/http.dart' as http;
// import '../model/dash_board_model.dart';
// import '../model/emergency_model.dart';
// import '../model/emergency_model.dart';
// import '../services/login_services.dart';

// class EmergencyScreen extends StatefulWidget {
//   const EmergencyScreen({Key? key}) : super(key: key);
//   // final String? baseurls;
//   // const DashBoardScreen({super.key, this.baseurls});
//   @override
//   State<EmergencyScreen> createState() => _EmergencyState();
// }

// class _EmergencyState extends State<EmergencyScreen> {
//   static final storage = FlutterSecureStorage();
//   final controller = ScrollController();
//   EmergencyResponseModel? eme;
//   List<String?> result = [];
//   int page = 1;
//   bool hasMore = true;
//   bool isLoading = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _getData();
//     controller.addListener(() {
//       if (controller.position.maxScrollExtent == controller.offset) {
//         _getData();
//       }
//     });
//   }

//   Future _getData() async {
//     dynamic token = await LoginService.getToken();
//     if (isLoading) return;
//     dynamic baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
//     final url =
//         Uri.parse('https://${baseurl1}/v1/jobs/?filter=emergency&page=${page}');
//     final response = await http.get(url,
//         headers: {"Authorization": "Bearer ${token}", "source": "android"});
//     if (response.statusCode == 200) {
//       final List newResult = json.decode(response.body);
//       setState(() {
//         page++;
//         isLoading = false;
//         if (newResult.length < 20) {
//           hasMore = false;
//         }
//         result.addAll(newResult.map<String>((res) {
//           final id = res['id'];
//           print(id);
//           return 'id$id';
//         }).toList());
//       });
//     }
//     // eme = await (EmergencyService(
//     //   service: Dio(BaseOptions(
//     //       baseUrl: 'https://${baseurl1}/v1/jobs/?filter=emergency')),
//     // ).emergencyService());
//     Future.delayed(const Duration(seconds: 0)).then((value) => setState(
//           () {},
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
//               //   if (eme != null) {
//               return ListView.builder(
//                   // shrinkWrap: true,
//                   controller: controller,
//                   itemCount: result.length + 1,
//                   itemBuilder: (context, index) {
//                     if (index <= result.length) {
//                       var data = result[index];
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
//                                           overflow: TextOverflow.ellipsis,
//                                           softWrap: true,
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
//                     } else {
//                       return Center(
//                         child: hasMore
//                             ? CircularProgressIndicator()
//                             : const Text('No data'),
//                       );
//                     }
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
// main.dart
// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:gokul_f/screens/login/environment_screen.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import '../services/login_services.dart';

// void main() {
//   runApp(const EmergencyScreen());
// }

// class EmergencyScreen extends StatelessWidget {
//   const EmergencyScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         // Remove the debug banner
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           primarySwatch: Colors.lightBlue,
//         ),
//         home: const HomePage());
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _EmergencyState();
// }

// class _EmergencyState extends State<HomePage> {
//   static final storage = FlutterSecureStorage();

//   // final _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

//   int _page = 1;

//   final int _limit = 20;

//   bool _isFirstLoadRunning = false;
//   bool _hasNextPage = true;

//   bool _isLoadMoreRunning = false;

//   List _posts = [];

//   void _loadMore() async {
//     dynamic token = await LoginService.getToken();
//     final baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
//     if (_hasNextPage == true &&
//         _isFirstLoadRunning == false &&
//         _isLoadMoreRunning == false &&
//         _controller.position.extentAfter < 300) {
//       setState(() {
//         _isLoadMoreRunning = true; // Display a progress indicator at the bottom
//       });

//       _page += 1; // Increase _page by 1

//       try {
//         final res = await http.get(
//             Uri.parse(
//                 'https://${baseurl1}/v1/jobs/?filter=emergency&page=${_page}'),
//             headers: {"Authorization": "Bearer ${token}", "source": "android"});

//         final List fetchedPosts = json.decode(res.body);
//         if (res.statusCode == 200) {
//           print('kk');
//         } else {
//           print('dgg${baseurl1}');
//           print(res.statusCode);
//         }
//         print(fetchedPosts);
//         if (fetchedPosts.isNotEmpty) {
//           setState(() {
//             _posts.addAll(fetchedPosts);
//           });
//         } else {
//           setState(() {
//             _hasNextPage = false;
//           });
//         }
//       } catch (err) {
//         if (kDebugMode) {
//           print('Something went wrong!');
//         }
//       }

//       setState(() {
//         _isLoadMoreRunning = false;
//       });
//     }
//   }

//   void _firstLoad() async {
//     dynamic token = await LoginService.getToken();
//     final baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
//     setState(() {
//       _isFirstLoadRunning = true;
//     });

//     try {
//       final res = await http.get(
//           Uri.parse(
//               'https://${baseurl1}/v1/jobs/?filter=emergency&page=${_page}'),
//           headers: {"Authorization": "Bearer ${token}", "source": "android"});
//       if (res.statusCode == 200) {
//         print('kk');
//         print(res.body);
//       } else {
//         print('dgg${baseurl1}');
//         print(res.statusCode);
//       }
//       setState(() {
//         _posts = json.decode(res.body);
//       });
//     } catch (err) {
//       if (kDebugMode) {
//         print('Somethinggg went wrong');
//       }
//     }

//     setState(() {
//       _isFirstLoadRunning = false;
//     });
//   }

//   late ScrollController _controller;
//   @override
//   void initState() {
//     super.initState();
//     _firstLoad();
//     _controller = ScrollController()..addListener(_loadMore);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Your news',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         body: _isFirstLoadRunning
//             ? const Center(
//                 child: CircularProgressIndicator(),
//               )
//             : Column(
//                 children: [
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: _posts.length,
//                       controller: _controller,
//                       itemBuilder: (_, index) => Card(
//                         margin: const EdgeInsets.symmetric(
//                             vertical: 8, horizontal: 10),
//                         child: ListTile(
//                           title: Text(_posts[index]['id']),
//                           subtitle: Text(_posts[index]['body']),
//                         ),
//                       ),
//                     ),
//                   ),
//                   if (_isLoadMoreRunning == true)
//                     const Padding(
//                       padding: EdgeInsets.only(top: 10, bottom: 40),
//                       child: Center(
//                         child: CircularProgressIndicator(),
//                       ),
//                     ),
//                   if (_hasNextPage == false)
//                     Container(
//                       padding: const EdgeInsets.only(top: 30, bottom: 40),
//                       color: Colors.amber,
//                       child: const Center(
//                         child: Text('You have fetched all of the content'),
//                       ),
//                     ),
//                 ],
//               ));
//   }
// }

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
//   EmergencyResponseModel? eme;
// Dio dio = new Dio();
// int pageNumber = 1;
// int pageSize = 10;
// List<dynamic> data = [];
// bool isLoading = false;
// bool hasMore = true;
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   _getData();
//   // }

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
// Future<List<dynamic>> fetchData(int pageNumber, int pageSize) async {
//   final response = await dio.get('https://your-api-endpoint.com/data', queryParameters: {
//     'page': pageNumber,
//     'pageSize': pageSize,
//   });
//   return response.data;
// }
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
//                     itemCount: eme!.results.length,
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
//                                           overflow: TextOverflow.ellipsis,
//                                           softWrap: true,
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
//   final int _maxLength = 200;
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
//         //result.add(e);

//         //result = e + result;
//         // page = page++;
//       });
//     }
//     Future.delayed(const Duration(seconds: 0)).then((value) => setState(
//           () {
//             isLoading = false;
//              result = response.results + result;
//             page = page + 1;
//             //  result.add(response.resultsas List<EmergencyResponseModel> );

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
//                                     width: 30,
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
//                                     width: 10,
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
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     height: 18,
//                                     width: 100,
//                                     alignment: Alignment(-1.5, 0),
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
//                                       borderRadius: BorderRadius.circular(15),
//                                       color: Color.fromRGBO(231, 4, 0, 1),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 30,
//                                   ),
//                                   Container(
//                                     height: 18,
//                                     width: 100,
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
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Container(
//                                     height: 18,
//                                     width: 100,
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
//   static final storage = const FlutterSecureStorage();
//   late ScrollController _scrollController;
//   EmergencyResponseModel? eme;
//   List<Result> result = [];
//   int page = 1;
//   bool isLoading = false;
//   bool hasMore = true;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     _getData();
//     _scrollController = ScrollController();
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//         print('a');
//         _getData();
//         // setState(() {
//         //   isLoading == true;
//         //   page = page + 1;

//         // });

//         // if (hasMore == true) {
//         //   print('b');

//         //   // page = page + 1;
//         //   _getData();
//         // }
//       }
//     });
//   }

//   _getData() async {
//     dynamic baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
//     eme = await (EmergencyService(
//       service: Dio(BaseOptions(
//           baseUrl:
//               'https://${baseurl1}/v1/jobs/?filter=emergency&page=${page}')),
//     ).emergencyService());

//     print(eme);
//     print(eme?.results);
//     for (final e in eme!.results) {
//       final data = e.id as Result;
//       eme!.results.add(data);
//     }

//     // if (isLoading == true) {
//     //   setState(
//     //     () {
//     //       page = page + 1;
//     //       eme!.results += eme!.results;

//     //       //hasMore = eme!.results.length < page;
//     //     },
//     //   );
//     // }
//     print('resss${eme?.results}');
//     print(page);
//     print(eme!.results.length);
//     print('r${result}');
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
//                 icon: const Icon(
//                   Icons.arrow_back,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//               ),
//             ),
//           ],
//         )),

//         automaticallyImplyLeading: false,
//         backgroundColor: const Color.fromARGB(255, 4, 31, 68),
//         //title: const Text('AppBar Demo'),
//         actions: <Widget>[],
//       ),
//       body: RefreshIndicator(
//         onRefresh: refresh,
//         child: FutureBuilder(
//             future: getUsers(),
//             builder: (context, snapshot) {
//               if (eme != null) {
//                 print(snapshot);
//                 return ListView.builder(
//                     // shrinkWrap: true,
//                     controller: _scrollController,
//                     // controller: _scrollController,
//                     itemCount: eme!.results.length + (hasMore ? 1 : 0),
//                     itemBuilder: (context, index) {
//                       // if (index == eme!.results.length) {
//                       //   return const SizedBox(
//                       //     width: 60,
//                       //     height: 60,
//                       //     child: FittedBox(child: CircularProgressIndicator()),
//                       //   );
//                       // }
//                       var data = eme!.results[index].id;
//                       var data1 = data.toString();
//                       var property = eme!.results[index].property.name;
//                       var property1 = property.toString();
//                       var servicetype = eme!.results[index].serviceType ?? '';
//                       var servicetype1 = servicetype.toString();
//                       var stage = eme!.results[index].stage.name.name;
//                       var stage1 = stage.toString();
//                       var issuetype = eme!.results[index].issueType;
//                       var issuetype1 = issuetype.toString();
//                       var priority = eme!.results[index].priority.name;
//                       var priority1 = priority.toString();
//                       var location = eme!.results[index].unit;
//                       var location1 = location.toString();
//                       var category = eme!.results[index].category;
//                       var category1 = category.toString();

//                       return //SingleChildScrollView(
//                           Column(
//                         children: [
//                           Container(
//                             //height: 70,
//                             padding: const EdgeInsets.all(1),
//                             margin: const EdgeInsets.all(7),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Colors.white,
//                             ),
//                             child: Column(
//                               children: [
//                                 ListTile(
//                                   title: Text(
//                                     property1,
//                                     style: const TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   subtitle: Text(
//                                     '${servicetype1}'
//                                     ' ${data1}',
//                                     style: const TextStyle(
//                                         color: Colors.black, fontSize: 15),
//                                   ),
//                                   trailing: Container(
//                                     child: Text(stage1),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       color: const Color.fromRGBO(
//                                         253,
//                                         245,
//                                         235,
//                                         1,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   alignment: const Alignment(-0.9, 0),
//                                   child: Text(
//                                     issuetype1,
//                                     // style: new TextStyle(
//                                     //     fontSize: 20.0, color: Colors.amber),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 Row(
//                                   //    mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       height: 18,
//                                       width: 100,
//                                       alignment: const Alignment(0, 0),
//                                       child: const Center(
//                                         child: Text(
//                                           'Priority',
//                                           style: TextStyle(
//                                               fontSize: 15.0,
//                                               color: Color.fromARGB(
//                                                   255, 99, 96, 96)),
//                                           // style: new TextStyle(
//                                           //     fontSize: 20.0, color: Colors.amber),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 50,
//                                     ),
//                                     Container(
//                                       height: 18,
//                                       width: 100,
//                                       alignment: Alignment.bottomCenter,
//                                       child: const Center(
//                                         child: Text(
//                                           'Location',
//                                           style: TextStyle(
//                                               fontSize: 15.0,
//                                               color: Color.fromARGB(
//                                                   255, 99, 96, 96)),

//                                           // style: new TextStyle(
//                                           //     fontSize: 20.0, color: Colors.amber),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 30,
//                                     ),
//                                     Container(
//                                       height: 18,
//                                       width: 100,
//                                       alignment: Alignment.bottomRight,
//                                       child: const Center(
//                                         child: Text(
//                                           'Category',
//                                           style: TextStyle(
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
//                                       alignment: const Alignment(-0.9, 0),
//                                       child: Center(
//                                         child: Text(
//                                           priority1,
//                                           style: const TextStyle(
//                                               // fontSize: 15.0,
//                                               fontWeight: FontWeight.bold,
//                                               color:
//                                                   Color.fromARGB(255, 0, 0, 0)),
//                                         ),
//                                       ),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(20),
//                                         color:
//                                             const Color.fromRGBO(231, 4, 0, 1),
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
//                                         child: Text(
//                                           location1,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                           softWrap: true,
//                                           style: const TextStyle(
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
//                                         child: Text(
//                                           category1,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                           softWrap: true,
//                                           style: const TextStyle(
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
//                 return const Center(
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

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gokul_f/bloc/bloc.dart';
import 'package:gokul_f/bloc/event.dart';
import 'package:gokul_f/bloc/state.dart';
import 'package:gokul_f/cubit/pagination_cubit.dart';
import 'package:gokul_f/model/emergency_model.dart';
import 'package:gokul_f/repository/pagination_respository.dart';
import 'package:gokul_f/screens/dashboard_screen.dart';
import 'package:gokul_f/services/emergency_services.dart';
// import 'package:pagination_app/cubit/posts_cubit.dart';
// import 'package:pagination_app/data/models/post.dart';

class EmergencyScreen extends StatelessWidget {
  // final PaginationRepository repository;
  final String emergency;
  // const EmergencyScreen({Key? key, required this.repository}) : super(key: key);
  const EmergencyScreen({Key? key, required this.emergency}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<PaginationRepository>(
      create: (context) => PaginationRepository(EmergencyService()),
      child: BlocProvider<PostBloc>(
        create: (context) => PostBloc(context.read<PaginationRepository>())
          ..add(FetchPostsEvent()),
        child: EmergencyScreenPage(eme: emergency),
      ),
    );
  }
}

//final  PaginationRepository repository;

//  const EmergencyScreen({Key? key, this.repository}) : super(key: key);
class EmergencyScreenPage extends StatefulWidget {
  final String eme;
  const EmergencyScreenPage({super.key, required this.eme});

  @override
  State<EmergencyScreenPage> createState() => _EmergencyScreenPageState();
}

class _EmergencyScreenPageState extends State<EmergencyScreenPage> {
  int page = 1;
  late PaginationRepository repo;
  @override
  Widget build(BuildContext context) {
    var emecount = widget.eme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${emecount} Emergency',
        ),
        //   title: Text("Posts"),
        leading: (Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: IconButton(
                onPressed: () => Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new DashBoardScreen())),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        )),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 4, 31, 68),
        //title: const Text('AppBar Demo'),
        actions: <Widget>[],
      ),
      body: BlocBuilder<PostBloc, PostsState>(builder: (context, state) {
        if (state is PostLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PostSuccessState) {
          List<dynamic> posts = state.posts;
          print('screenposts$posts');
          return RefreshIndicator(
            onRefresh: refresh,
            child: ListView.builder(
                controller: context.read<PostBloc>().scrollController,
                itemCount: context.read<PostBloc>().isLoadingMore
                    ? posts.length + 1
                    : posts.length,
                itemBuilder: ((context, index) {
                  if (index >= posts.length) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    Result post = posts[index];
                    print('eme pos${post.id}');
                    return Container(
                      //       //height: 70,
                      padding: const EdgeInsets.all(1),
                      margin: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              post.property.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '${post.serviceType ?? ''}'
                              ' ${post.id}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 15),
                            ),
                            trailing: Container(
                              child: Text(post.stage.name.name),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromRGBO(
                                  253,
                                  245,
                                  235,
                                  1,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: const Alignment(-0.9, 0),
                            child: Text(
                              post.issueType,
                              // style: new TextStyle(
                              //     fontSize: 20.0, color: Colors.amber),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            //    mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 18,
                                width: 100,
                                alignment: const Alignment(0, 0),
                                child: const Center(
                                  child: Text(
                                    'Priority',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color.fromARGB(255, 99, 96, 96)),
                                    // style: new TextStyle(
                                    //     fontSize: 20.0, color: Colors.amber),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Container(
                                height: 18,
                                width: 100,
                                alignment: Alignment.bottomCenter,
                                child: const Center(
                                  child: Text(
                                    'Location',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color.fromARGB(255, 99, 96, 96)),

                                    // style: new TextStyle(
                                    //     fontSize: 20.0, color: Colors.amber),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Container(
                                height: 18,
                                width: 100,
                                alignment: Alignment.bottomRight,
                                child: const Center(
                                  child: Text(
                                    'Category',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color.fromARGB(255, 99, 96, 96)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 18,
                                width: 100,
                                alignment: const Alignment(-0.9, 0),
                                child: Center(
                                  child: Text(
                                    post.priority.toString(),
                                    style: const TextStyle(
                                        // fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromRGBO(231, 4, 0, 1),
                                ),
                              ),
                              // SizedBox(
                              //   width: 50,
                              // ),
                              Container(
                                height: 18,
                                width: 130,
                                // alignment: Alignment.bottomCenter,
                                child: Center(
                                  child: Text(
                                    post.status,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 20, 56, 103)),

                                    // style: new TextStyle(
                                    //     fontSize: 20.0, color: Colors.amber),
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   width: 30,
                              // ),
                              Container(
                                height: 18,
                                width: 130,
                                // alignment: Alignment.bottomRight,
                                child: Center(
                                  child: Text(
                                    post.category,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 20, 56, 103)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                })),
          );
        } else {
          return Center(
            child: context.read<PostBloc>().isLoadingMore
                ? CircularProgressIndicator()
                : const Text('No data'),
          );
        }
      }),
    );
  }

  Future refresh() async {
    List<Result> posts = await repo.fetchPosts(page);
    setState(() {
      posts = posts;
    });
  }
}
// import 'dart:async';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gokul_f/cubit/pagination_cubit.dart';
// import 'package:gokul_f/model/emergency_model.dart';
// import 'package:gokul_f/repository/pagination_respository.dart';
// import 'package:gokul_f/screens/dashboard_screen.dart';
// import 'package:gokul_f/services/emergency_services.dart';
// // import 'package:pagination_app/cubit/posts_cubit.dart';
// // import 'package:pagination_app/data/models/post.dart';

// class EmergencyScreen extends StatelessWidget {
//   final PaginationRepository repository;

//   const EmergencyScreen({Key? key, required this.repository}) : super(key: key);

//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: BlocProvider(
//         create: (context) => PostsCubit(repository),
//         child: const EmergencyScreenPage(),
//       ),
//     );
//   }
// }

// //final  PaginationRepository repository;

// //  const EmergencyScreen({Key? key, this.repository}) : super(key: key);
// class EmergencyScreenPage extends StatefulWidget {
//   const EmergencyScreenPage({super.key});

//   @override
//   State<EmergencyScreenPage> createState() => _EmergencyScreenPageState();
// }

// class _EmergencyScreenPageState extends State<EmergencyScreenPage> {
//   final scrollController = ScrollController();
//   late EmergencyResponseModel eme;
//   // const PaginationRepository({Key key, this.repository}) : super(key: key);
//   void setupScrollController(context) {
//     scrollController.addListener(() {
//       if (scrollController.position.atEdge) {
//         if (scrollController.position.pixels != 0) {
//           BlocProvider.of<PostsCubit>(context).loadPosts();
//         }
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     setupScrollController(context);
//     _loadingIndicator();
//     BlocProvider.of<PostsCubit>(context).loadPosts();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           ' Emergency',
//         ),
//         //   title: Text("Posts"),
//         leading: (Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               child: IconButton(
//                 onPressed: () => Navigator.push(
//                     context,
//                     new MaterialPageRoute(
//                         builder: (BuildContext context) =>
//                             new DashBoardScreen())),
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
//       body: _postList(),
//     );
//   }

//   Widget _postList() {
//     return BlocBuilder<PostsCubit, PostsState>(builder: (context, state) {
//       if (state is PostsLoading && state.isFirstFetch) {
//         return _loadingIndicator();
//       }

//       List<Result> posts = [];
//       bool isLoading = false;

//       if (state is PostsLoading) {
//         posts = state.oldPosts;

//         isLoading = true;
//         print('oldes$posts');
//       } else if (state is PostsLoaded) {
//         posts = state.posts;
//         print('postses${posts[0].id}');
//         // isLoading = true;
//       }

//       return RefreshIndicator(
//         onRefresh: refresh,
//         child: ListView.separated(
//           controller: scrollController,
//           itemBuilder: (context, index) {
//             if (index < posts.length) {
//               print('listpost$posts');

//               return _post(posts[index], context);
//             } else {
//               Timer(Duration(milliseconds: 30), () {
//                 scrollController
//                     .jumpTo(scrollController.position.maxScrollExtent);
//               });

//               return _loadingIndicator();
//             }
//           },
//           separatorBuilder: (context, index) {
//             return Divider(
//               color: Colors.grey[400],
//             );
//           },
//           itemCount: posts.length + (isLoading ? 1 : 0),
//         ),
//       );
//     });
//   }

//   Widget _loadingIndicator() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Center(child: CircularProgressIndicator()),
//     );
//   }

//   Widget _post(Result post, BuildContext context) {
//     return Container(
//       //height: 70,
//       padding: const EdgeInsets.all(1),
//       margin: const EdgeInsets.all(7),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//       ),
//       child: Column(
//         children: [
//           ListTile(
//             title: Text(
//               post.property.toString(),
//               style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold),
//             ),
//             subtitle: Text(
//               '${post.serviceType}'
//               ' ${post.id}',
//               style: const TextStyle(color: Colors.black, fontSize: 15),
//             ),
//             trailing: Container(
//               child: Text(post.stage.name.name),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: const Color.fromRGBO(
//                   253,
//                   245,
//                   235,
//                   1,
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             alignment: const Alignment(-0.9, 0),
//             child: Text(
//               post.issueType,
//               // style: new TextStyle(
//               //     fontSize: 20.0, color: Colors.amber),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Row(
//             //    mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 18,
//                 width: 100,
//                 alignment: const Alignment(0, 0),
//                 child: const Center(
//                   child: Text(
//                     'Priority',
//                     style: TextStyle(
//                         fontSize: 15.0, color: Color.fromARGB(255, 99, 96, 96)),
//                     // style: new TextStyle(
//                     //     fontSize: 20.0, color: Colors.amber),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 50,
//               ),
//               Container(
//                 height: 18,
//                 width: 100,
//                 alignment: Alignment.bottomCenter,
//                 child: const Center(
//                   child: Text(
//                     'Location',
//                     style: TextStyle(
//                         fontSize: 15.0, color: Color.fromARGB(255, 99, 96, 96)),

//                     // style: new TextStyle(
//                     //     fontSize: 20.0, color: Colors.amber),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 30,
//               ),
//               Container(
//                 height: 18,
//                 width: 100,
//                 alignment: Alignment.bottomRight,
//                 child: const Center(
//                   child: Text(
//                     'Category',
//                     style: TextStyle(
//                         fontSize: 15.0, color: Color.fromARGB(255, 99, 96, 96)),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 18,
//                 width: 100,
//                 alignment: const Alignment(-0.9, 0),
//                 child: Center(
//                   child: Text(
//                     post.priority.toString(),
//                     style: const TextStyle(
//                         // fontSize: 15.0,
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 0, 0, 0)),
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: const Color.fromRGBO(231, 4, 0, 1),
//                 ),
//               ),
//               // SizedBox(
//               //   width: 50,
//               // ),
//               Container(
//                 height: 18,
//                 width: 130,
//                 // alignment: Alignment.bottomCenter,
//                 child: Center(
//                   child: Text(
//                     post.status,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     softWrap: true,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 20, 56, 103)),

//                     // style: new TextStyle(
//                     //     fontSize: 20.0, color: Colors.amber),
//                   ),
//                 ),
//               ),
//               // SizedBox(
//               //   width: 30,
//               // ),
//               Container(
//                 height: 18,
//                 width: 130,
//                 // alignment: Alignment.bottomRight,
//                 child: Center(
//                   child: Text(
//                     post.category,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     softWrap: true,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 20, 56, 103)),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//     // return Container(
//     //   width: MediaQuery.of(context).size.width,
//     //   margin: const EdgeInsets.all(10.0),
//     //   child: Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: [
//     //       Text(
//     //         "${post.id}. ${post.category}",
//     //         style: TextStyle(
//     //             fontSize: 18.0,
//     //             color: Colors.black,
//     //             fontWeight: FontWeight.bold),
//     //       ),
//     //       SizedBox(height: 10.0),
//     //       //Text(post.count.toString())
//     //     ],
//     //   ),
//     // );
//   }

//   Future refresh() async {
//     BlocProvider.of<PostsCubit>(context).loadPosts();
//   }
// }
