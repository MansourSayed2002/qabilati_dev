part of 'posts_cubit.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}

final class PostsLoading extends PostsState {}

final class PostsSuccess extends PostsState {
  final List<PostsModel> post;
  final bool isPagination;
  PostsSuccess({required this.isPagination, required this.post});
}

final class PostsError extends PostsState {}
