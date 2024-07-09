class BaseResponse<T> {
  final T? data;
  final bool? status;
  final String? message;

  const BaseResponse({
    this.data,
    this.status,
    this.message,
  }) : super();

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return BaseResponse(
      data: json['data'],
      message: json['message'],
      status: json['status'],
    );
  }

  factory BaseResponse.fromMap(Map<String, dynamic> json) {
    return BaseResponse(
      data: json['data'],
      status: json['status_code'] ?? false,
      message: json['message'] ?? 'An error occured',
    );
  }
}
