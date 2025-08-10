import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/function/pagination.dart';
import 'package:qabilati/feature/posts/data/model/posts_model.dart';
import 'package:qabilati/feature/posts/domain/usecase/get_all_posts_usecase.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this.getAllPostsUsecase) : super(PostsInitial());

  late GetAllPostsUsecase getAllPostsUsecase;

  bool isPagination = false;

  List<PostsModel> posts = [];
  List<PostsModel> paginationPosts = [];

  Future<void> getAllPosts() async {
    emit(PostsLoading());
    isPagination = true;
    var response = await getAllPostsUsecase.getAllPosts();
    if (response is ApiSuccess) {
      posts = response.data;
      paginationPosts = paginationPost(
        point: paginationPosts.length,
        data: posts,
        limit: 4,
      );

      emit(PostsSuccess(post: paginationPosts, isPagination: false));
    } else if (response is ApiFailure) {
      emit(PostsError());
    }
  }

  pagination() {
    isPagination = true;
    final data = paginationPost(
      point: paginationPosts.length,
      data: posts,
      limit: 4,
    );
    if (data.isEmpty) {
      isPagination = false;
      return;
    }
    paginationPosts.addAll(data);
    isPagination = false;
    emit(PostsSuccess(post: paginationPosts, isPagination: false));
  }
}
