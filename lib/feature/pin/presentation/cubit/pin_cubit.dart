import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qabilati/core/function/hashing_pin.dart';
import 'package:qabilati/feature/pin/data/api/pin_api.dart';

part 'pin_state.dart';

class PinCubit extends Cubit<PinState> {
  PinCubit() : super(PinInitial());

  checkPin({required String pin, required int walletId}) async {
    emit(PinLoading());
    String pinHash = hashingPin(pin);
    Map pinHashDb = await PinApi.where(walletId: walletId);
    if (pinHash == pinHashDb['pin_hash']) {
      emit(PinSuccess());
    } else {
      emit(PinError());
    }
  }
}
