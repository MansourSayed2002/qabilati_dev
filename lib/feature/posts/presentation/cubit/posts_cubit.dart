import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/function/get_unique_new_posts.dart';
import 'package:qabilati/feature/posts/data/model/posts_model.dart';
import 'package:qabilati/feature/posts/domain/usecase/get_all_posts_usecase.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this.getAllPostsUsecase) : super(PostsInitial());

  late GetAllPostsUsecase getAllPostsUsecase;

  bool hasMoreData = true;

  bool isLoadingMore = false;

  List<PostModel> posts = [];

  Future<void> getAllPosts({int offsetCount = 0}) async {
    emit(PostsLoading());
    posts.clear();
    var response = await getAllPostsUsecase.getAllPosts(
      offsetCount: offsetCount,
    );
    if (response is ApiSuccess) {
      posts.addAll(response.data);
      hasMoreData = response.data.isNotEmpty;
      emit(PostsSuccess(post: posts, isPagination: hasMoreData));
    } else if (response is ApiFailure) {
      emit(PostsError());
    }
  }

  Future<void> getPaginationPosts() async {
    if (isLoadingMore || !hasMoreData) return;
    isLoadingMore = true;
    var response = await getAllPostsUsecase.getAllPosts(
      offsetCount: posts.length,
    );
    if (response is ApiSuccess) {
      if (response.data.isEmpty) {
        hasMoreData = false;
      } else {
        final newPosts = response.data;
        final uniqueNewPosts = getUniqueNewPosts(
          newPosts: newPosts,
          posts: posts,
        );
        posts.addAll(uniqueNewPosts);
        hasMoreData = true;
      }
      emit(PostsSuccess(post: posts, isPagination: hasMoreData));
    }
    isLoadingMore = false;
  }
}
