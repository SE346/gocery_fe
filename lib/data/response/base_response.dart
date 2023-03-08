class BaseResponse {
  dynamic result;
  dynamic targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  BaseResponse({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.bAbp,
  });

  BaseResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    targetUrl = json['targetUrl'];
    success = json['success'];
    error = json['error'];
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }
}
