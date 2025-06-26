import 'package:get_it/get_it.dart';
import 'package:qabilati/core/class/supabase_connect.dart';
import 'package:qabilati/feature/auth/data/repo_imp/repo_imp.dart';
import 'package:qabilati/feature/auth/domain/repo_abs/repo_abs.dart';
import 'package:qabilati/feature/auth/domain/usecase/check_verify.dart';
import 'package:qabilati/feature/auth/domain/usecase/create_verify_and_send_usecase.dart';
import 'package:qabilati/feature/auth/domain/usecase/login_usecase.dart';
import 'package:qabilati/feature/auth/domain/usecase/register_usecase.dart';
import 'package:qabilati/feature/auth/domain/usecase/upload_image_user_usecase.dart';
import 'package:qabilati/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:qabilati/feature/chat_room/data/repo_imp/chat_room_repo_imp.dart';
import 'package:qabilati/feature/chat_room/domain/repo_abs/chat_room_repo_abs.dart';
import 'package:qabilati/feature/chat_room/domain/usecase/send_message_and_upload_file_usecase.dart';
import 'package:qabilati/feature/chat_room/domain/usecase/send_message_usecase.dart';
import 'package:qabilati/feature/chat_room/presentation/cubit/chat_room_cubit.dart';
import 'package:qabilati/feature/chats/data/repo_imp/chats_repo_imp.dart';
import 'package:qabilati/feature/chats/domain/repo_abs/chats_repo_abs.dart';
import 'package:qabilati/feature/chats/domain/usecase/get_chats_usecase.dart';
import 'package:qabilati/feature/chats/presentation/cubit/chats_cubit.dart';
import 'package:qabilati/feature/friends/data/repo_imp/friend_repo_ipm.dart';
import 'package:qabilati/feature/friends/domain/repo_abs/friend_repo_abs.dart';
import 'package:qabilati/feature/friends/domain/usecase/get_friends_usecase.dart';
import 'package:qabilati/feature/friends/presentation/cubit/friend_cubit.dart';
import 'package:qabilati/feature/groub_chat/data/repo_imp/groub_chat_repo_imp.dart';
import 'package:qabilati/feature/groub_chat/domain/repo_abs/groub_achat_repo_abs.dart';
import 'package:qabilati/feature/groub_chat/domain/usecase/create_new_groub_usecase.dart';
import 'package:qabilati/feature/groub_chat/domain/usecase/delete_members_usecase.dart';
import 'package:qabilati/feature/groub_chat/domain/usecase/get_goubs_usecase.dart';
import 'package:qabilati/feature/groub_chat/domain/usecase/get_group_members_usecase.dart';
import 'package:qabilati/feature/groub_chat/presentation/cubit/groub_chat_cubit.dart';
import 'package:qabilati/feature/notification/data/repo_imp/notifi_repo_imp.dart';
import 'package:qabilati/feature/notification/domain/repo_abs/notifi_repo_abs.dart';
import 'package:qabilati/feature/notification/domain/usecase/accept_request_friend_usecase.dart';
import 'package:qabilati/feature/notification/domain/usecase/get_notification_usecase.dart';
import 'package:qabilati/feature/notification/domain/usecase/reject_request_friend_usecase.dart';
import 'package:qabilati/feature/notification/presentation/cubit/notifications_cubit.dart';
import 'package:qabilati/feature/request_friend/data/repo_imp/repo_request_friend_imp.dart';
import 'package:qabilati/feature/request_friend/domain/repo_abs/repo_request_friend_abs.dart';
import 'package:qabilati/feature/request_friend/domain/usecase/change_status_usecase.dart';
import 'package:qabilati/feature/request_friend/domain/usecase/request_friend_usecase.dart';
import 'package:qabilati/feature/request_friend/domain/usecase/un_friend_usecase.dart';
import 'package:qabilati/feature/request_friend/presentation/cubit/request_friend_cubit.dart';
import 'package:qabilati/feature/search/data/repo_imp/repo_imp.dart';
import 'package:qabilati/feature/search/domain/repo_abs/repo_abs.dart';
import 'package:qabilati/feature/search/domain/usecase/get_search_usecase.dart';
import 'package:qabilati/feature/search/presentation/cubit/search_cubit.dart';
import 'package:qabilati/feature/friends/domain/usecase/accept_friend_usecase.dart';
import 'package:qabilati/feature/friends/domain/usecase/get_chat_room_usecase.dart';
import 'package:qabilati/feature/friends/domain/usecase/get_pending_friend_request_usecase.dart';
import 'package:qabilati/feature/friends/domain/usecase/reject_friend_usecase.dart';

final GetIt getIt = GetIt.instance;

Future<void> setUp() async {
  //===============================DATABASE CONNTECTION===========================
  getIt.registerLazySingleton(() => SupabaseConnect.instance);
  //===============================REPOSITORY=====================================
  getIt.registerLazySingleton<RepoAbs>(() => RepoImp());
  getIt.registerLazySingleton<RepoAbsSearch>(() => RepoImpSearch());
  getIt.registerLazySingleton<RepoRequestFriendAbs>(
    () => RepoRequestFriendImp(),
  );
  getIt.registerLazySingleton<FriendRepoAbs>(() => FriendRepoIpm());
  getIt.registerLazySingleton<NotifiRepoAbs>(() => NotifiRepoImp());

  getIt.registerLazySingleton<ChatRoomRepoAbs>(() => ChatRoomRepoImp());
  getIt.registerLazySingleton<GroubchatRepoAbs>(() => GroubChatRepoImp());
  getIt.registerLazySingleton<ChatsRepoAbs>(() => ChatsRepoImp());

  //===============================USECASE========================================
  getIt.registerLazySingleton(() => LoginUsecase(getIt.get<RepoAbs>()));
  getIt.registerLazySingleton(() => RegisterUsecase(getIt.get<RepoAbs>()));

  getIt.registerLazySingleton(
    () => CreateVerifyAndSendUsecase(getIt.get<RepoAbs>()),
  );
  getIt.registerLazySingleton(() => CheckVerifyUseCase(getIt.get<RepoAbs>()));
  getIt.registerLazySingleton(
    () => GetSearchUsecase(getIt.get<RepoAbsSearch>()),
  );
  getIt.registerLazySingleton(
    () => UploadImageUserUsecase(getIt.get<RepoAbs>()),
  );
  getIt.registerLazySingleton(
    () => ChangeStatusUsecase(getIt.get<RepoRequestFriendAbs>()),
  );
  getIt.registerLazySingleton(
    () => UnFriendUsecase(getIt.get<RepoRequestFriendAbs>()),
  );
  getIt.registerLazySingleton(
    () => RequestFriendUsecase(getIt.get<RepoRequestFriendAbs>()),
  );
  getIt.registerLazySingleton(
    () => GetFriendsUsecase(getIt.get<FriendRepoAbs>()),
  );
  getIt.registerLazySingleton(
    () => GetNotificationUsecase(getIt.get<NotifiRepoAbs>()),
  );

  getIt.registerLazySingleton(
    () => AcceptRequestFriendUsecase(getIt.get<NotifiRepoAbs>()),
  );

  getIt.registerLazySingleton(
    () => RejectRequestFriendUsecase(getIt.get<NotifiRepoAbs>()),
  );

  getIt.registerLazySingleton(
    () => GetChatRoomUsecase(getIt.get<FriendRepoAbs>()),
  );
  getIt.registerLazySingleton(
    () => GetPendingFriendRequestUsecase(getIt.get<FriendRepoAbs>()),
  );
  getIt.registerLazySingleton(
    () => AcceptFriendUsecase(getIt.get<FriendRepoAbs>()),
  );
  getIt.registerLazySingleton(
    () => RejectFriendUsecase(getIt.get<FriendRepoAbs>()),
  );
  getIt.registerLazySingleton(
    () => SendMessageUsecase(getIt.get<ChatRoomRepoAbs>()),
  );
  getIt.registerLazySingleton(
    () => SendMessageAndUploadFileUsecase(getIt.get<ChatRoomRepoAbs>()),
  );
  getIt.registerLazySingleton(
    () => CreateNewGroubUsecase(getIt.get<GroubchatRepoAbs>()),
  );

  getIt.registerLazySingleton(
    () => GetGroubsUsecase(getIt.get<GroubchatRepoAbs>()),
  );
  getIt.registerLazySingleton(
    () => GetGroupMembersUsecase(getIt.get<GroubchatRepoAbs>()),
  );
  getIt.registerLazySingleton(
    () => DeleteMembersUsecase(getIt.get<GroubchatRepoAbs>()),
  );

  getIt.registerLazySingleton(() => GetChatsUsecase(getIt.get<ChatsRepoAbs>()));

  //===============================CUBIT STATREMANGEMENT==========================

  getIt.registerLazySingleton(
    () => AuthCubit(
      getIt.get<LoginUsecase>(),
      getIt.get<RegisterUsecase>(),
      getIt.get<CreateVerifyAndSendUsecase>(),
      getIt.get<CheckVerifyUseCase>(),
      getIt.get<UploadImageUserUsecase>(),
    ),
  );
  getIt.registerLazySingleton(() => SearchCubit(getIt.get<GetSearchUsecase>()));
  getIt.registerLazySingleton(
    () => RequestFriendCubit(
      getIt.get<ChangeStatusUsecase>(),
      getIt.get<UnFriendUsecase>(),
      getIt.get<RequestFriendUsecase>(),
    ),
  );
  getIt.registerLazySingleton(
    () => FriendsCubit(
      getIt.get<GetFriendsUsecase>(),
      getIt.get<GetChatRoomUsecase>(),
      getIt.get<GetPendingFriendRequestUsecase>(),
      getIt.get<AcceptFriendUsecase>(),
      getIt.get<RejectFriendUsecase>(),
    ),
  );
  getIt.registerLazySingleton(
    () => NotificationsCubit(
      getIt.get<GetNotificationUsecase>(),
      getIt.get<AcceptRequestFriendUsecase>(),
      getIt.get<RejectRequestFriendUsecase>(),
    ),
  );

  getIt.registerLazySingleton(
    () => GroubChatCubit(
      getIt.get<CreateNewGroubUsecase>(),
      getIt.get<GetGroubsUsecase>(),
      getIt.get<GetGroupMembersUsecase>(),
      getIt.get<DeleteMembersUsecase>(),
    ),
  );

  getIt.registerLazySingleton(
    () => ChatRoomCubit(
      getIt.get<SendMessageUsecase>(),
      getIt.get<SendMessageAndUploadFileUsecase>(),
    ),
  );
  getIt.registerLazySingleton(() => ChatsCubit(getIt.get<GetChatsUsecase>()));

  //=============================== CHECK INITIALIZATION ==========================
  await getIt.allReady();
}
