// import 'package:bloc/bloc.dart';
// import 'package:gokul_f/model/emergency_model.dart';
// import 'package:gokul_f/repository/pagination_respository.dart';
// import 'package:gokul_f/screens/emergency_screen.dart';
// import 'package:gokul_f/screens/emergency_screen.dart';
// import 'package:gokul_f/screens/emergency_screen.dart';
// import 'package:meta/meta.dart';
// // import 'package:pagination_app/data/models/post.dart';
// // import 'package:pagination_app/data/repositories/posts_respository.dart';

// import '../screens/emergency_screen.dart';
// import '../services/emergency_services.dart';

// part 'pagination_state.dart';

// class paginationCubit extends Cubit<paginationState> {
//   paginationCubit(this.repository) : super(PaginationInitial());

//   int page = 1;
//   final PaginationRepository repository;

//   void loadPosts() {
//     if (state is PaginationLoading) return;

//     final currentState = state;

//     var oldResult = <Result>[];
//     if (currentState is PaginationLoaded) {
//       oldResult = currentState.result;
//     }

//     emit(PaginationLoading(oldResult, isFirstFetch: page == 1));

//     repository.fetchPosts(page).then((newResult) {
//       page++;

//       final result = (state as PaginationLoading).oldResult;
//       result.addAll(newResult);

//       emit(PaginationLoaded(result));
//     });
//   }
// }
// import 'package:bloc/bloc.dart';
// import 'package:gokul_f/model/emergency_model.dart';
// import 'package:gokul_f/repository/pagination_respository.dart';
// import 'package:meta/meta.dart';
// //import 'package:pagination_app/data/models/post.dart';
// //import 'package:pagination_app/data/repositories/posts_respository.dart';

// part 'pagination_state.dart';

// class PostsCubit extends Cubit<PostsState> {
//   PostsCubit(this.repository) : super(PostsInitial());

//   int page = 1;
//   final PaginationRepository repository;

//   void loadPosts() {
//     if (state is PostsLoading) return;

//     final currentState = state;

//     var oldPosts = <Result>[];
//     if (currentState is PostsLoaded) {
//       print('curroldpost$currentState');
//       oldPosts = currentState.posts;
//       print('curroldpost$oldPosts');
//       // page++;
//     }

//     emit(PostsLoading(oldPosts, isFirstFetch: page == 1));
//     // var newPosts = repository.fetchPosts(page);
//     repository.fetchPosts(page).then((newPosts) {
//       page++;
//       print(page);

//       print('oldpost$oldPosts');
//       print('neww${newPosts}');
//       final posts = (state as PostsLoading).oldPosts;
//       // final posts = oldPosts;
//       posts.addAll(newPosts);
//       // newPosts.forEach((element) => posts.add(element));
//       print('newdw${newPosts}');
//       print('posts$posts');

//       // posts = posts + newPosts;
//       //emit(PostsLoading(posts, isFirstFetch: page == page));
//       emit(PostsLoaded(posts));
//     });
//   }
// }
