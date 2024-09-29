class Response {
  final dynamic data;
  final int code;
  final String message;

  Response({
    required this.data,
    required this.code,
    required this.message,
  });

  factory Response.formMap(Map<String, dynamic> map){
    return Response(
      data: map['data'] as dynamic,
      code: map['code'],
      message: map['message'],
    );
  }
}