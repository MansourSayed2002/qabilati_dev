part of 'request_friend_cubit.dart';

@immutable
sealed class RequestFriendState {}

final class RequestFriendInitial extends RequestFriendState {}

final class RequestFriendLoading extends RequestFriendState {}

final class SuccessUnfriend extends RequestFriendState {}

final class RequestFriendSuccess extends RequestFriendState {
  final Map data;
  RequestFriendSuccess(this.data);
}

// final class SuccessAccept extends RequestFriendState {}

final class RequestFriendError extends RequestFriendState {}
