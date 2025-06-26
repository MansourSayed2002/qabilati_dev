import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';
import 'package:qabilati/feature/auth/domain/usecase/check_verify.dart';
import 'package:qabilati/feature/auth/domain/usecase/create_verify_and_send_usecase.dart';
import 'package:qabilati/feature/auth/domain/usecase/login_usecase.dart';
import 'package:qabilati/feature/auth/domain/usecase/register_usecase.dart';
import 'package:qabilati/feature/auth/domain/usecase/upload_image_user_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.logInUseCase,
    this.registerUsecase,
    this.createVerify,
    this.checkVerifyUseCase,
    this.uploadImageUserUsecase,
  ) : super(AuthInitial());

  late LoginUsecase logInUseCase;
  late RegisterUsecase registerUsecase;
  late CreateVerifyAndSendUsecase createVerify;
  late CheckVerifyUseCase checkVerifyUseCase;
  late UploadImageUserUsecase uploadImageUserUsecase;
  UserModel? userModel;
  String? pathImage;
  Future<void> login(String phone) async {
    emit(LogInLoading());
    var response = await logInUseCase.login(phone);
    if (response is ApiSuccess) {
      userModel = response.data;
      emit(LogInSuccess());
    } else if (response is ApiFailure) {
      emit(LogInError());
    }
  }

  Future<void> register(UserModel data) async {
    emit(RegisterLoading());
    var response = await registerUsecase.register(data);
    if (response is ApiSuccess) {
      emit(RegisterSuccess());
    } else if (response is ApiFailure) {
      emit(RegisterError());
    }
  }

  Future<void> sendVerify() async {
    try {
      await createVerify.operationOfVerify();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> checkCode(otp) async {
    emit(VerifyCodeLoading());
    try {
      var resposne = await checkVerifyUseCase.checkVerifyCode(otp);
      if (resposne is ApiSuccess) {
        emit(VerifyCodeSuccess());
      } else if (resposne is ApiFailure) {
        emit(VerifyCodeWrong());
      }
    } catch (e) {
      emit(VerifyCodeFail());
    }
  }

  uploadFile() async {
    emit(ImageLoading());
    if (pathImage != null) {
      await uploadImageUserUsecase.upload(File(pathImage!));
      emit(ImageSuccess());
    } else {
      emit(ImageError());
    }
  }
}
