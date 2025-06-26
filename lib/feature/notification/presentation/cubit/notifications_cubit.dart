import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/feature/notification/domain/usecase/accept_request_friend_usecase.dart';
import 'package:qabilati/feature/notification/domain/usecase/get_notification_usecase.dart';
import 'package:qabilati/feature/notification/domain/usecase/reject_request_friend_usecase.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(
    this.getNotificationUsecase,
    this.acceptRequestFriendUsecase,
    this.rejectRequestFriendUsecase,
  ) : super(NotificationsInitial());

  List notifications = [];

  late GetNotificationUsecase getNotificationUsecase;

  late AcceptRequestFriendUsecase acceptRequestFriendUsecase;

  late RejectRequestFriendUsecase rejectRequestFriendUsecase;
  Future<void> getNotification() async {
    emit(NotificationsLoading());
    var response = await getNotificationUsecase.getNotification();
    if (response is ApiSuccess) {
      notifications = response.data;
      emit(NotificationsSuccess());
    } else if (response is ApiFailure) {
      emit(NotificationsError());
    }
  }

  Future<void> acceptFriend(int notifiId, int requestId, int replyId) async {
    emit(NotificationsLoading());
    var response = await acceptRequestFriendUsecase.acceptFriend(
      notifiId,
      requestId,
      replyId,
    );
    if (response is ApiSuccess) {
      getNotification();
      emit(NotificationsSuccess());
    } else if (response is ApiFailure) {
      emit(NotificationsError());
    }
  }

  Future<void> rejectFriend(int notifiId, int requestId, int replyId) async {
    emit(NotificationsLoading());
    var response = await rejectRequestFriendUsecase.rejectFriend(
      notifiId,
      requestId,
      replyId,
    );
    if (response is ApiSuccess) {
      getNotification();
      emit(NotificationsSuccess());
    } else if (response is ApiFailure) {
      emit(NotificationsError());
    }
  }
}
