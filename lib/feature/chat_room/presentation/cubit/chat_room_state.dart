part of 'chat_room_cubit.dart';

@immutable
sealed class ChatRoomState {}

final class ChatRoomInitial extends ChatRoomState {}

final class EmojiTrue extends ChatRoomState {}

final class EmojiFalse extends ChatRoomState {}

final class ShowFileFalse extends ChatRoomState {}

final class ShowFileTrue extends ChatRoomState {}

final class FileTrue extends ChatRoomState {}

final class FileFalse extends ChatRoomState {}

final class RecordTrue extends ChatRoomState {}

final class RecordFalse extends ChatRoomState {}

final class TextButtonTrue extends ChatRoomState {}

final class TextButtonFalse extends ChatRoomState {}
