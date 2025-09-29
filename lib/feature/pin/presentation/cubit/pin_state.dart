part of 'pin_cubit.dart';

@immutable
sealed class PinState {}

final class PinInitial extends PinState {}

final class PinLoading extends PinState {}

final class PinSuccess extends PinState {}

final class PinError extends PinState {}
