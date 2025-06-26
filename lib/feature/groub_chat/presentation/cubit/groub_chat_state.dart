part of 'groub_chat_cubit.dart';

@immutable
sealed class GroubChatState {}

final class GroubChatInitial extends GroubChatState {}

final class GroubChatSuccess extends GroubChatState {}

final class GroubChatError extends GroubChatState {}

final class GroubChatLoading extends GroubChatState {}
