import 'package:qabilati/feature/groub_chat/data/model/member_group_model.dart';

getInfoMemebr(List<MemberGroupModel> members, int memberId) {
  for (int i = 0; i < members.length; i++) {
    if (members[i].memberId == memberId) {
      return members[i];
    }
  }
}
