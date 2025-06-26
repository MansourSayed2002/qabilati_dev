manageFriendShip(
  int status,
  Function(int) changeStatus,
  Function(int) unFriend,
  Function(int) requestFriend,
  idUnFriend,
  idFriendReply,
) {
  switch (status) {
    case 0:
      changeStatus(1);
      break;
    case 1:
      unFriend(idUnFriend);
      break;
    case 3:
      requestFriend(idFriendReply);
      break;
    default:
  }
}
