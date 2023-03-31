import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gokul_f/core/constants/api.dart';
import 'package:gokul_f/core/constants/environment_url.dart';

import 'package:gokul_f/model/login_response_model.dart';
import 'package:gokul_f/screens/dashboard_screen.dart';

import 'package:gokul_f/screens/login/view/login_view.dart';
import 'package:gokul_f/services/dashboard_services.dart';

import 'package:gokul_f/services/login_services.dart';
import '../../layouts/icon.dart';
import 'package:http/http.dart' as http;

class EnvironmentScreen extends StatefulWidget {
  final List<DomainModel> domains;
  const EnvironmentScreen({super.key, required this.domains});

  @override
  State<StatefulWidget> createState() => EnvironmentScreenState();
}

class EnvironmentScreenState extends State<EnvironmentScreen> {
  static final storage = FlutterSecureStorage();
  final List _selectedIndexs = [];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isTab = true;
    int currentIndex = 1;
    int _currentSlide = 0;
    dynamic borderColor = Colors.white;

    print("domains in environment: ${widget.domains}");
    var domains = widget.domains as List<DomainModel>;

    for (var d in domains) {
      print("host: ${d.host}");
      print("name: ${d.name}");
    }

    print("total ${domains}");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/f_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          IconImg().icon(),
          SizedBox(height: 114),
          Form(
            // key: _formfield,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: const Alignment(0, 30),
                      padding: const EdgeInsets.all(20.0),
                      child: const Text(
                        "Environment",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 290,
                      // alignment: const Alignment(0, 30),
                      // padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Choose which environment you want to enter",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 333,
                      height: 120,
                      child: CarouselSlider.builder(
                        // carouselController: PageController(initialPage: ),
                        options: CarouselOptions(
                          enableInfiniteScroll: false,
                          // onPageChanged: (i, reason) {
                          //   setState(() {
                          //     _currentSlide = i;
                          //   });
                          // },
                          // onPageChanged: (index, reason) {
                          //   currentIndex = index;
                          //   setState(() {});
                          // },
                          // onPageChanged: (index, reason) {
                          //   setState(() {
                          //     _borderColor = Colors.blue;
                          //     ;
                          //   });
                          // }
                          // reverse: true,
                        ),

                        itemCount: domains.length,
                        itemBuilder: (context, i, id) {
                          final isSelected = _selectedIndexs.contains(i);
                          print(_selectedIndexs);
                          print(isSelected);
                          //  final controller = PageController();
                          // int currentIndex = controller.page?.round() ?? 0;
                          print('v${id}');
                          // print(currentIndex);
                          // final bordercolor =
                          //     isTab ? Colors.white : Colors.orange;

                          String baseUrls = domains[i].host!;
                          print("current url index ${i}: ${baseUrls}");
                          print("current index ${i}: ${domains[i]}");
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  print(isSelected == true);
                                  print('gdgg');
                                  _selectedIndexs.remove(i);
                                } else {
                                  _selectedIndexs.add(i);
                                }
                              });
                              // setState(() {
                              //   _selectedIndexs.remove(i);
                              // });
                              // setState(() {
                              //   isSelected = true;
                              // });
                              baseUrl(baseUrls);

                              print('es ${baseUrls}');

                              DashBoardService(
                                service: Dio(BaseOptions(
                                    baseUrl: 'https://${baseUrls}')),
                              ).dashBoardService();
                            },
                            child: Container(
                              width: 220,
                              height: 120,
                              alignment: Alignment(0, 0),
                              // child: Ink(
                              decoration: BoxDecoration(
                                //   color: Colors.white,

                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                //  border: Border.all(color: Color),
                                //  border: Border.all(color: Colors.white),
                                border: isSelected
                                    ? Border.all(
                                        color: Color.fromARGB(255, 230, 81, 0),
                                        width: 4)
                                    : null,
                              ),
                              //  child: InkWell(
                              // onTap: () {
                              //   setState(() {
                              //     if (isSelected) {
                              //       _selectedIndexs.remove(i);
                              //     } else {
                              //       _selectedIndexs.add(i);
                              //     }
                              //   });
                              //   baseUrl(baseUrls);

                              //   print('es ${baseUrls}');

                              //   DashBoardService(
                              //     service: Dio(BaseOptions(
                              //         baseUrl: 'https://${baseUrls}')),
                              //   ).dashBoardService();
                              // },

                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Text(
                                  domains[i].name!,
                                  // domains[i].name!,

                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),

                              // ),
                              //  ),
                            ),
                            // onTap: () {
                            //   setState(() {

                            //   });
                            //   baseUrl(baseUrls);

                            //   print('es ${baseUrls}');

                            //   DashBoardService(
                            //     service: Dio(BaseOptions(
                            //         baseUrl: 'https://${baseUrls}')),
                            //   ).dashBoardService();
                            //   // setState(() {
                            //   //   _borderColor = Colors.orange;
                            //   // });
                            //   // DashBoardService(
                            //   //   service: Dio(BaseOptions(
                            //   //       baseUrl: 'https://${baseUrls}')),
                            //   // ).dashBoardService();
                            // },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: 333,
                  height: 40,
                  child: ElevatedButton(
                    child: const Text('Enter'),

                    onPressed: () {
                      onpress();
                    },

                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFFF55600)),
                      // primary: Colors.puwhiple,
                    ),
                    //  child: Text(tlogin.toUppercase),
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Future<void> baseUrl(String baseurl) async {
    await storage.write(key: "baseurl", value: baseurl);
  }

  static Future<String?> getBaseurl() async {
    dynamic baseurl = await storage.read(key: "baseurl");
    print('ds${baseurl}');
    return baseurl;
  }

  onpress() async {
    dynamic base = await getBaseurl() as dynamic;
    if (base != null) {
      print('gi${base}');
      return Navigator.of(context).pushReplacementNamed(
        '/cusBattomNavigation',
      );
    } else {
      print('err');
      return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Kindly select any environment')));
    }
  }
  // return Scaffold();
}
