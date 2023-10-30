class ApiResponse<T> {
  final T? data;
  final String? message;
  final int statusCode;

  ApiResponse({this.data, this.message, required this.statusCode});
}
