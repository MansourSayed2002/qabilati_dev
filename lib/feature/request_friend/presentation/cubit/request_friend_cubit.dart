import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qabilati/core/class/api_result.dart';

import 'package:qabilati/feature/request_friend/domain/usecase/change_status_usecase.dart';
import 'package:qabilati/feature/request_friend/domain/usecase/request_friend_usecase.dart';
import 'package:qabilati/feature/request_friend/domain/usecase/un_friend_usecase.dart';

part 'request_friend_state.dart';

class RequestFriendCubit extends Cubit<RequestFriendState> {
  RequestFriendCubit(
    this.changeStatusUsecase,
    this.unFriendUsecase,
    this.requestFriendUsecase,
  ) : super(RequestFriendInitial());

  late ChangeStatusUsecase changeStatusUsecase;

  late UnFriendUsecase unFriendUsecase;

  late RequestFriendUsecase requestFriendUsecase;

  // Future<void> changeStatus(int status, int id) async {
  //   emit(RequestFriendLoading());
  //   var response = await changeStatusUsecase.changeStatus(status, id);
  //   if (response is ApiSuccess) {
  //     emit(SuccessAccept());
  //   } else if (response is ApiFailure) {
  //     emit(RequestFriendError());
  //   }
  // }

  Future<void> unFriend(int value) async {
    emit(RequestFriendLoading());
    var response = await unFriendUsecase.unFriend(value);
    if (response is ApiSuccess) {
      emit(SuccessUnfriend());
    } else if (response is ApiFailure) {
      emit(RequestFriendError());
    }
  }

  Future<void> requestFriend(int friendReply) async {
    emit(RequestFriendLoading());
    var response = await requestFriendUsecase.requestFriend(friendReply);
    if (response is ApiSuccess) {
      emit(RequestFriendSuccess(response.data));
    } else if (response is ApiFailure) {
      emit(RequestFriendError());
    }
  }
}
