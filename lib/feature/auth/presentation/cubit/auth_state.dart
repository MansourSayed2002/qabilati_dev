part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LogInLoading extends AuthState {}

final class LogInSuccess extends AuthState {}

final class LogInError extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class RegisterError extends AuthState {}

final class VerifyCodeLoading extends AuthState {}

final class VerifyCodeSuccess extends AuthState {}

final class VerifyCodeWrong extends AuthState {}

final class VerifyCodeFail extends AuthState {}

final class ImageLoading extends AuthState {}

final class ImageSuccess extends AuthState {}

final class ImageError extends AuthState {}
