class NetworkError {
  static const String CommonErrorMessage = "网络异常，请稍后重试";

  final String? errorCode;
  final String? message;

  NetworkError({this.errorCode, this.message});
}