import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gokul_f/core/constants/api.dart';
import 'package:gokul_f/core/constants/environment_url.dart';
import 'package:gokul_f/data/data.dart';
//import 'package:gokul_f/model/environment_model.dart';
import 'package:gokul_f/model/login_response_model.dart';
import 'package:gokul_f/repository/auth_repo.dart';
import 'package:gokul_f/screens/login/view/login_view.dart';

import 'package:gokul_f/services/login_services.dart';
import '../../layouts/icon.dart';
import 'package:http/http.dart' as http;
//import 'package:http/http.dart'
//import '../../services/login_services.dart';

class EnvironmentScreen extends StatefulWidget {
  final List<DomainModel> domains;
  const EnvironmentScreen({super.key, required this.domains});

  @override
  State<StatefulWidget> createState() => _EnvironmentScreenState();
}

class _EnvironmentScreenState extends State<EnvironmentScreen> {
  // @override
  // void initstate() {
  //   var Controller = PageController(initialPage:0, viewportFraction: 0.85);

  //   super.initState();
  // }

  //  @override
  // void dispose() {
  //   PageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // int currentIndex = 0;
    // final controller = PageController(initialPage: 0);

    // int currentIndex = controller.page?.round() ?? 0;
    int currentIndex = 1;
    // void onPageChanged(int index) {
    //   int currentIndex = controller.page?.round() ?? 0;
    //   // Do something with the current index
    // }

    // int currentIndex = controller.page?.round() ?? 0;
    List<String> baseUrls = [
      'https://api.example.com/1',
      'https://api.example.com/2',
      'https://api.example.com/3',
    ];
    /* final args =
        ModalRoute.of(context)!.settings.arguments as List<DomainModel>; */
    print("domains in environment: ${widget.domains}");
    var domains = widget.domains as List<DomainModel>;
    //var d = '';

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
                          // onPageChanged: (index, reason) {
                          //   currentIndex = index;
                          //   setState(() {});
                          // },

                          // reverse: true,
                        ),

                        itemCount: domains.length,
                        itemBuilder: (context, i, id) {
                          //  final controller = PageController();
                          // int currentIndex = controller.page?.round() ?? 0;
                          print('v${id}');
                          // print(currentIndex);
                          List<String> baseUrls = [domains[i].host!];
                          print("current url index ${i}: ${baseUrls}");
                          print("current index ${i}: ${domains[i]}");
                          return GestureDetector(
                            child: Container(
                              width: 220,
                              height: 120,
                              alignment: Alignment(0, 0),
                              decoration: BoxDecoration(
                                // backgroundBlendMode: BlendMode.color,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.white),
                              ),
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
                            ),
                            onTap: () {
                              EnvironmentUrl().getres(i, baseUrls);
                              //    getCountries();
                              // final controller = PageController(initialPage: 0);
                              // int currentIndex = controller.page?.round() ?? 0;
                              // String baseUrl = baseUrls[currentIndex];
                              // String baseUrl;
//List<String> baseUrls = [domains[i].host!];

                              // var response =
                              //     http.get(Uri.parse('$baseUrl/v1/dashboard/'));
                              // print(response);
                            },
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
                      //   .read<LoginCubit>()
                      // LoginCubit(
                      //   service: LoginService(
                      //     service:
                      //         Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
                      //   ),
                      // ).onPressedLogin;
                      // getCountries();
                      //  EnvironmentService.environmentService();
                    }, //child: null,
                    // child: Text("Elevated Button with Icon"),
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

  // return Scaffold();
}


/* class _EnvironmentScreenState extends State<EnvironmentScreen> {
  final _formfield = GlobalKey<FormState>();
//final List<Map<String, dynamic>> data;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // Domain ? dom;
  // void getCountries() async {
  //   var data = await Dio().post('https://devapifyxt.com/v1/login/');
  //   if (data.statusCode == 200) {
  //     print(data);
  //   } else {
  //     print(data.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    /* final args =
        ModalRoute.of(context)!.settings.arguments as List<DomainModel>; */
    print("domains in environment: ${widget.domains}");
    // final model = LoginModel(
    //   email: emailController.text,
    //   password: passwordController.text,
    //   // category: null,
    //   // types: null,
    //   // domains: null,
    // );
    // var datalist = LoginService(
    //   service: Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
    // ).loginService(LoginModel);
    // //var dataList=AuthRepository().login(datalst;
    void buildBlocListener(context, state) {
      print("insance of state: ${state.runtimeType}");
      if (state is LoginCompleted) {
        final List<dynamic> data = [state.loginModel];
        print("bloc listener in environment: ${data.toString()}");
      }
    }

    // final data = state.loginModel;
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
            key: _formfield,
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
                        options: CarouselOptions(),
                        itemCount: dataList.length,
                        itemBuilder: (context, data, i) {
                          return GestureDetector(
                            child: Container(
                              width: 220,
                              height: 120,
                              alignment: Alignment(0, 0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.white),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Text(
                                  dataList[i],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              //    getCountries();
                            },
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
                      //   .read<LoginCubit>()
                      // LoginCubit(
                      //   service: LoginService(
                      //     service:
                      //         Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
                      //   ),
                      // ).onPressedLogin;
                      // getCountries();
                      //  EnvironmentService.environmentService();
                    }, //child: null,
                    // child: Text("Elevated Button with Icon"),
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

  // Widget buildSlider(
  //   data,
  //   i,
  // ) {
  //   return Container(
  //     width: 333,
  //     height: 120,
  //     child: CarouselSlider.builder(
  //       options: CarouselOptions(),
  //       itemCount: data.length,
  //       itemBuilder: (context, data, i) {
  //         return GestureDetector(
  //           child: Container(
  //             width: 220,
  //             height: 120,
  //             alignment: Alignment(0, 0),
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(15),
  //               border: Border.all(color: Colors.white),
  //             ),
  //             child: ClipRRect(
  //               borderRadius: BorderRadius.circular(15),
  //               child: Text(
  //                 dataList[i],
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                   color: Colors.black,
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 18,
  //                 ),
  //               ),
  //             ),
  //           ),
  //           onTap: () {
  //             //    getCountries();
  //           },
  //         );
  //       },
  //     ),
  //   );
  // }
//   Future<void> buildOnPressed(BuildContext context) async {
// //if (formKey.currentState!.validate()) {
//      // print(emailController.text.toString());
//       context
//           .read<LoginCubit>()
//           .onPressedLogin();
//       login();
//       //LoginService.loginService.storeToken(["token"]);
//   //  }
//   }

  // Widget buildChild(LoginState state, data) {
  //   return state is LoginLoading
  //       ? const CircularProgressIndicator.adaptive()
  //       : Text(data);
  // }

  //RaisedButton({required Text child, required Null Function() onPressed}) {}
}
 */