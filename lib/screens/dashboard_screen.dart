import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gokul_f/cubit/pagination_cubit.dart';
import 'package:gokul_f/layouts/alert_box.dart';
import 'package:gokul_f/layouts/icon.dart';
import 'package:gokul_f/layouts/stepper.dart';
import 'package:gokul_f/repository/pagination_respository.dart';
import 'package:gokul_f/screens/alljobs_screen.dart';
import 'package:gokul_f/screens/assign_to_be_Screen.dart';
import 'package:gokul_f/screens/emergency_screen.dart';
import 'package:gokul_f/screens/job.dart';
import 'package:gokul_f/screens/login/environment_screen.dart';
import 'package:gokul_f/screens/login/view/login_view.dart';
import 'package:gokul_f/services/dashboard_services.dart';

import '../model/dash_board_model.dart';
import '../services/emergency_services.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);
  // final String? baseurls;
  // const DashBoardScreen({super.key, this.baseurls});
  @override
  State<DashBoardScreen> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoardScreen> {
  static final storage = FlutterSecureStorage();
  late final PaginationRepository repository;
  DashBoardResponseModel? bal;

  // get future => null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _getData() async {
    dynamic baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
    bal = await (DashBoardService(
      service: Dio(BaseOptions(baseUrl: 'https://${baseurl1}')),
    ).dashBoardService());
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(
          () {},
        ));
    // var text1 = bal.emergency;
    print("emergency: ${bal?.emergency}");
    print("jobs: ${bal?.all_jobs}");
    print(bal);
    //var text1 = bal?.emergency;
  }

  //  Future.delayed(const Duration(seconds: 0)).then((value) => setState(() {},));
  //   var Text1 = bal?.emergency;
  // return Text1;
  @override
  Widget build(BuildContext context) {
    dynamic baseurl1 = EnvironmentScreenState.getBaseurl() as dynamic;
    var base = print('url${baseurl1}');
    // print("url ${baseurl1}");
    print("emergency: ${bal?.emergency}");
    print("jobs: ${bal?.all_jobs}");
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 26) / 3;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        leading: (Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment(2, 0),
              padding: EdgeInsets.all(2.0),
              height: 40,
              width: 40,
              child: Image.asset(
                "assets/f_logo.png",
                fit: BoxFit.fitWidth,
              ),
            )
          ],
        )),

        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 4, 31, 68),
        //title: const Text('AppBar Demo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.power_settings_new),
            tooltip: 'Show Snackbar',
            onPressed: () async {
              // bal = await (DashBoardService(
              //   service: Dio(BaseOptions(baseUrl: 'https://${baseurl1}')),
              // ).dashBoardService());
              print("emergency: ${bal?.emergency}");
              print("jobs: ${bal?.all_jobs}");
              // //  }
              AlertWithIcon();
              // await removeToken();
              await storage.deleteAll();
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) => LoginView(),
                ),
              );
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => LoginView()));
              // print('bal${bal}');
              // print(DashBoardResponseModel().emergency);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      // SizedBox(height: 10,)

      body: RefreshIndicator(
        onRefresh: refresh,
        child: FutureBuilder(
            future: getUsers(),
            builder: (context, snapshot) {
              if (bal != null) {
                //var t = bal.toString();
                // int text1= bal?.emergency as int;
                int text1 = bal?.emergency as int;
                String t = text1.toString();
                int text2 = bal?.all_jobs as int;
                String t2 = text2.toString();
                int text3 = bal?.assigned_to_me as int;
                String t3 = text3.toString();
                return
                    //Container(
                    //     //width: double.infinity,
                    //     // height: double.infinity,
                    //     child: Padding(
                    //   padding: const EdgeInsets.all(15),
                    Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: GridView(
                        // ignore: sort_child_properties_last
                        children: [
                          GestureDetector(
                            onTap: () {
                              // BlocProvider(
                              //   create: (context) => PostsCubit,
                              //   child: EmergencyScreen(),
                              // );
                              // EmergencyService().emergencyService(1);
                              // Navigator.push(
                              //     context,
                              //     new MaterialPageRoute(
                              //         builder: (BuildContext context) =>
                              //             new EmergencyScreen(
                              //                 repository: PaginationRepository(
                              //                     EmergencyService()))));
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new EmergencyScreen(emergency: t)));
                            },
                            child: Container(
                              height: 333,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(
                                  254,
                                  238,
                                  229,
                                  1,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // WidgetSpan(
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Icon(
                                    Icons.warning_outlined,
                                    size: 28,
                                    color: Color.fromRGBO(245, 86, 0, 1),
                                  ),
                                  // ),
                                  Text(
                                    t,
                                    style: TextStyle(
                                        height: 1.2,
                                        color: Color.fromRGBO(
                                          25,
                                          44,
                                          73,
                                          1,
                                        ),
                                        fontSize: 48,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Roboto'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                      textAlign: TextAlign.right,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "Emergency",
                                            style: TextStyle(
                                              color:
                                                  Color.fromRGBO(25, 44, 73, 1),
                                              fontSize: 16,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ]))
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new AlljobsScreen(emergency: t2)));
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(
                                  253,
                                  245,
                                  235,
                                  1,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //  WidgetSpan(
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Icon(
                                    Icons.work_outlined,
                                    size: 28,
                                    color: Color.fromRGBO(248, 158, 22, 1),
                                  ),
                                  // ),
                                  Text(
                                    t2,
                                    style: TextStyle(
                                      height: 1.2,
                                      color: Color.fromRGBO(25, 44, 73, 1),
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "All Jobs",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(25, 44, 73, 1),
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold))
                                  ]))
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new AssignScreen(emergency: t3)));
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(
                                  238,
                                  238,
                                  251,
                                  1,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //    WidgetSpan(
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Icon(
                                    Icons.assignment_outlined,
                                    size: 28,
                                    color: Color.fromRGBO(85, 89, 223, 1),
                                  ),
                                  // ),
                                  Text(
                                    t3,
                                    style: TextStyle(
                                        height: 1.2,
                                        color: Color.fromRGBO(25, 44, 73, 1),
                                        fontSize: 48,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Roboto'),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "Assigned To Me",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(25, 44, 73, 1),
                                          fontSize: 16,
                                          fontFamily: 'Roboto',
                                        ))
                                  ]))
                                ],
                              ),
                            ),
                          ),

                          // Container(
                          //   alignment: Alignment(-3, 2),
                          // SizedBox(

                          // child: GestureDetector(
                          // Container(
                          //   alignment: Alignment(-3, 2),

                          // ),
                          //),
                          //  ),
                          //),
                        ],

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 3,
                            crossAxisCount: 2,
                            mainAxisSpacing: 27.36,
                            crossAxisSpacing: 10),
                      ),
                    ),
                    // Column(
                    //   children: [
                    Container(
                      // child: Align(
                      alignment: Alignment(0, 0.8),
                      // alignment: Alignment.center,
                      child: ElevatedButton(
                        child: Text('+ Create Job'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new JobScreen()));
                        },
                        style: ButtonStyle(
                          // alignment: Alignment(-3, 2),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 4, 31, 68)),
                          // primary: Colors.puwhiple,
                        ),
                      ),
                      // ),
                    ),
                    //   ],
                    // ),
                  ],
                );

                // ));
              } else if (snapshot.hasError) {
                return Text('Result: ${snapshot.data}');
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  getUsers() {}

  Future refresh() async {
    // setState(() => bal.clear());
    dynamic baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
    bal = await (DashBoardService(
      service: Dio(BaseOptions(baseUrl: 'https://${baseurl1}')),
    ).dashBoardService());
    setState(() {
      bal = bal;
    });
  }

  // onp() {
  //   return Navigator.of(context).pushNamed('/jobScreen');
  // }
}
