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

class AssignScreen extends StatelessWidget {
  // final PaginationRepository repository;
  final String emergency;
  // const EmergencyScreen({Key? key, required this.repository}) : super(key: key);
  const AssignScreen({Key? key, required this.emergency}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<PaginationRepository>(
      create: (context) => PaginationRepository(EmergencyService()),
      child: BlocProvider<PostBloc>(
        create: (context) => PostBloc(context.read<PaginationRepository>())
          ..add(FetchPostsEvent()),
        child: AssignScreenPage(eme: emergency),
      ),
    );
  }
}

//final  PaginationRepository repository;

//  const EmergencyScreen({Key? key, this.repository}) : super(key: key);
class AssignScreenPage extends StatefulWidget {
  final String eme;
  const AssignScreenPage({super.key, required this.eme});

  @override
  State<AssignScreenPage> createState() => _AssignScreenPageState();
}

class _AssignScreenPageState extends State<AssignScreenPage> {
  int page = 1;
  late PaginationRepository repo;
  @override
  Widget build(BuildContext context) {
    var emecount = widget.eme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${emecount} Assign To me',
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
                                width: 50,
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
