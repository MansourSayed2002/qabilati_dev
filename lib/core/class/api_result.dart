import 'package:qabilati/core/enum/status_request.dart';

class ApiResult {}

class ApiSuccess<T> extends ApiResult {
  final T data;
  ApiSuccess(this.data);
}

class ApiFailure extends ApiResult {
  final StatusRequest statusRequest;
  ApiFailure(this.statusRequest);
}
