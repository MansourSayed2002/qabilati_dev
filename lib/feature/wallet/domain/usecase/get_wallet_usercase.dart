import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';
import 'package:qabilati/feature/wallet/data/model/mywallet_model.dart';
import 'package:qabilati/feature/wallet/domain/repo_abs/wallet_repo_abs.dart';

class GetWalletUsercase {
  GetWalletUsercase({required this.walletRepoAbs});
  late WalletRepoAbs walletRepoAbs;

  Future<ApiResult> getWallet() async {
    try {
      UserModel user = LocalStorageApp.getHiveData(LocalStorageApp.userData);
      List response = await walletRepoAbs.getWallet(user.id ?? 0);
      print(response);
      return ApiSuccess(MywalletModel.fromJson(response.first));
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
