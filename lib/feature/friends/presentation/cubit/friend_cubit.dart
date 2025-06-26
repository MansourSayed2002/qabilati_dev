import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/model/friends_model.dart';
import 'package:qabilati/feature/friends/domain/usecase/accept_friend_usecase.dart';
import 'package:qabilati/feature/friends/domain/usecase/get_chat_room_usecase.dart';
import 'package:qabilati/feature/friends/domain/usecase/get_friends_usecase.dart';
import 'package:qabilati/feature/friends/domain/usecase/get_pending_friend_request_usecase.dart';
import 'package:qabilati/feature/friends/domain/usecase/reject_friend_usecase.dart';

part 'friend_state.dart';

class FriendsCubit extends Cubit<FriendsState> {
  FriendsCubit(
    this.getFriendsUseCase,
    this.getChatRoomUsecase,
    this.getPendingFriendRequestUsecase,
    this.acceptFriendUsecase,
    this.rejectFriendUsecase,
  ) : super(FriendInitial());
  late GetFriendsUsecase getFriendsUseCase;

  late GetChatRoomUsecase getChatRoomUsecase;

  late AcceptFriendUsecase acceptFriendUsecase;

  late RejectFriendUsecase rejectFriendUsecase;

  late GetPendingFriendRequestUsecase getPendingFriendRequestUsecase;
  List friendList = [];
  List friendPending = [];
  Future<void> getFriend() async {
    emit(FriendLoading());
    friendList.clear();
    var result = await getFriendsUseCase.getFriend();
    if (result is ApiSuccess) {
      friendList = result.data;
      emit(FriendSuccess());
    } else if (result is ApiFailure) {
      emit(FriendError());
    }
  }

  Future<void> selectChatRoom(
    int value,
    int value2,
    FriendsModel friend,
  ) async {
    emit(ChatRoomLoading());
    var result = await getChatRoomUsecase.selectChatRoom(value, value2);

    if (result is ApiSuccess) {
      emit(ChatRoomSuccess(chatRoomId: result.data, friend: friend));
    } else if (result is ApiFailure) {
      emit(FriendError());
    }
  }

  Future<void> getPendingFriend() async {
    emit(FriendPendingLoading());
    friendPending.clear();
    var result = await getPendingFriendRequestUsecase.getPendingFriend();
    if (result is ApiSuccess) {
      friendPending = result.data;
      emit(FriendPendingSuccess());
    } else if (result is ApiFailure) {
      emit(FriendPendingError());
    }
  }

  Future<void> acceptFriend(int requestId, int replyId) async {
    emit(FriendPendingLoading());
    var response = await acceptFriendUsecase.acceptFriend(requestId, replyId);
    if (response is ApiSuccess) {
      getPendingFriend();
      emit(FriendPendingSuccess());
    } else if (response is ApiFailure) {
      emit(FriendPendingError());
    }
  }

  Future<void> rejectFriend(int requestId, int replyId) async {
    emit(FriendPendingLoading());
    var response = await rejectFriendUsecase.rejectFriend(requestId, replyId);
    if (response is ApiSuccess) {
      getPendingFriend();
      emit(FriendPendingSuccess());
    } else if (response is ApiFailure) {
      emit(FriendPendingError());
    }
  }
}
