import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gokul_f/layouts/bottom_navigation_Screen.dart';
import 'package:gokul_f/layouts/icon.dart';
import 'package:gokul_f/model/emergency_model.dart';
import 'package:gokul_f/model/emergency_model.dart';
import 'package:gokul_f/screens/More_Menu_Screen.dart';
import 'package:gokul_f/screens/camera_screen.dart';
import 'package:gokul_f/screens/chat_screen.dart';
import 'package:gokul_f/screens/dashboard_screen.dart';
import 'package:gokul_f/screens/login/environment_screen.dart';
import 'package:gokul_f/screens/notifications_screen.dart';
import 'package:gokul_f/services/dashboard_services.dart';
import 'package:gokul_f/services/emergency_services.dart';

import '../model/dash_board_model.dart';
import '../model/emergency_model.dart';
import '../model/emergency_model.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({Key? key}) : super(key: key);
  // final String? baseurls;
  // const DashBoardScreen({super.key, this.baseurls});
  @override
  State<EmergencyScreen> createState() => _EmergencyState();
}

class _EmergencyState extends State<EmergencyScreen> {
  static final storage = FlutterSecureStorage();
  EmergencyResponseModel? eme;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  _getData() async {
    dynamic baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
    eme = await (EmergencyService(
      service: Dio(BaseOptions(
          baseUrl: 'https://${baseurl1}/v1/jobs/?filter=emergency')),
    ).emergencyService());
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(
          () {},
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${eme?.count ?? 0} Emergency',
        ),
        leading: (Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
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
      body: RefreshIndicator(
        onRefresh: refresh,
        child: FutureBuilder(
            future: getUsers(),
            builder: (context, snapshot) {
              if (eme != null) {
                return ListView.builder(
                    // shrinkWrap: true,
                    itemCount: eme!.results.length,
                    itemBuilder: (context, index) {
                      var data = eme?.results[index].id;
                      var data1 = data.toString();
                      var property = eme?.results[index].property.name;
                      var property1 = property.toString();
                      var servicetype = eme?.results[index].serviceType ?? '';
                      var servicetype1 = servicetype.toString();
                      var stage = eme?.results[index].stage.name.name;
                      var stage1 = stage.toString();
                      var issuetype = eme?.results[index].issueType;
                      var issuetype1 = issuetype.toString();
                      var priority = eme?.results[index].priority.name;
                      var priority1 = priority.toString();
                      var Location = eme?.results[index].unit;
                      var Location1 = Location.toString();
                      var category = eme?.results[index].category;
                      var category1 = category.toString();

                      return //SingleChildScrollView(
                          Column(
                        children: [
                          Container(
                            //height: 70,
                            padding: const EdgeInsets.all(1),
                            margin: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    property1,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    '${servicetype1}'
                                    ' ${data1}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  trailing: Container(
                                    child: Text(stage1),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color.fromRGBO(
                                        253,
                                        245,
                                        235,
                                        1,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment(-0.9, 0),
                                  child: new Text(
                                    issuetype1,
                                    // style: new TextStyle(
                                    //     fontSize: 20.0, color: Colors.amber),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  //    mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 18,
                                      width: 100,
                                      alignment: Alignment(0, 0),
                                      child: Center(
                                        child: new Text(
                                          'Priority',
                                          style: new TextStyle(
                                              fontSize: 15.0,
                                              color: Color.fromARGB(
                                                  255, 99, 96, 96)),
                                          // style: new TextStyle(
                                          //     fontSize: 20.0, color: Colors.amber),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Container(
                                      height: 18,
                                      width: 100,
                                      alignment: Alignment.bottomCenter,
                                      child: Center(
                                        child: new Text(
                                          'Location',
                                          style: new TextStyle(
                                              fontSize: 15.0,
                                              color: Color.fromARGB(
                                                  255, 99, 96, 96)),

                                          // style: new TextStyle(
                                          //     fontSize: 20.0, color: Colors.amber),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      height: 18,
                                      width: 100,
                                      alignment: Alignment.bottomRight,
                                      child: Center(
                                        child: new Text(
                                          'Category',
                                          style: new TextStyle(
                                              fontSize: 15.0,
                                              color: Color.fromARGB(
                                                  255, 99, 96, 96)),
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
                                      alignment: Alignment(-0.9, 0),
                                      child: Center(
                                        child: new Text(
                                          priority1,
                                          style: new TextStyle(
                                              // fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0)),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color.fromRGBO(231, 4, 0, 1),
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
                                        child: new Text(
                                          Location1,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          style: new TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 20, 56, 103)),

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
                                        child: new Text(
                                          category1,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          style: new TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 20, 56, 103)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                      //);
                    });
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
    eme = await (EmergencyService(
      service: Dio(BaseOptions(
          baseUrl: 'https://${baseurl1}/v1/jobs/?filter=emergency')),
    ).emergencyService());
    setState(() {
      eme = eme;
    });
  }
}
