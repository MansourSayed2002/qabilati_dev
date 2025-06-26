
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/feature/groub_chat/data/model/member_group_model.dart';
import 'package:qabilati/feature/groub_chat/domain/usecase/create_new_groub_usecase.dart';
import 'package:qabilati/feature/groub_chat/domain/usecase/delete_members_usecase.dart';
import 'package:qabilati/feature/groub_chat/domain/usecase/get_goubs_usecase.dart';
import 'package:qabilati/feature/groub_chat/domain/usecase/get_group_members_usecase.dart';

part 'groub_chat_state.dart';

class GroubChatCubit extends Cubit<GroubChatState> {
  GroubChatCubit(
    this.createNewGroubUsecase,
    this.getGroubsUsecase,
    this.getGroupMembersUsecase,
    this.deleteMembersUsecase,
  ) : super(GroubChatInitial());
  late CreateNewGroubUsecase createNewGroubUsecase;
  late GetGroubsUsecase getGroubsUsecase;
  late GetGroupMembersUsecase getGroupMembersUsecase;
  late DeleteMembersUsecase deleteMembersUsecase;
  String pathImage = "";
  List groups = [];
  List<MemberGroupModel> groupMembers = [];
  Future<void> createGroub(String groubName) async {
    emit(GroubChatLoading());
    var response = await createNewGroubUsecase.createNewGroub(
      groubName,
      pathImage,
    );
    if (response is ApiSuccess) {
      emit(GroubChatSuccess());
    } else {
      emit(GroubChatError());
    }
  }

  Future<void> getGroubs() async {
    groups.clear();
    emit(GroubChatLoading());
    var response = await getGroubsUsecase.getGroubs();
    if (response is ApiSuccess) {
      groups = response.data;
      emit(GroubChatSuccess());
    } else {
      emit(GroubChatError());
    }
  }

  Future<void> getGroupMembers(int groubId) async {
    groupMembers.clear();
    var response = await getGroupMembersUsecase.getGroupMembers(groubId);
    if (response is ApiSuccess) {
      groupMembers = response.data;
    }
  }

  Future<void> removeMembers(int id) async {
    await deleteMembersUsecase.removeMembers(id);
  }
}
