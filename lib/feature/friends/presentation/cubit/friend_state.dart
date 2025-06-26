part of 'friend_cubit.dart';

@immutable
sealed class FriendsState {}

final class FriendInitial extends FriendsState {}

final class FriendLoading extends FriendsState {}

final class FriendSuccess extends FriendsState {}

final class FriendError extends FriendsState {}

final class FriendPendingLoading extends FriendsState {}

final class FriendPendingSuccess extends FriendsState {}

final class FriendPendingError extends FriendsState {}

final class ChatRoomLoading extends FriendsState {}

final class ChatRoomSuccess extends FriendsState {
  final FriendsModel friend;
  final int chatRoomId;
  ChatRoomSuccess({required this.chatRoomId, required this.friend});
}
