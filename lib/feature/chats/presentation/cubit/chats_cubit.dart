import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/feature/chats/data/model/chats_model.dart';
import 'package:qabilati/feature/chats/domain/usecase/get_chats_usecase.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit(this.getChatsUsecase) : super(ChatsInitial());

  late GetChatsUsecase getChatsUsecase;

  List<ChatsModel> chat = [];

  Future<void> getChats() async {
    emit(ChatsLoading());
    var response = await getChatsUsecase.getChats();
    if (response is ApiSuccess) {
      chat = response.data;
      emit(ChatsSuccess());
    } else {
      emit(ChatsError());
    }
  }
}
