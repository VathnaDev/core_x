import 'package:dio/dio.dart';

class DioUtils {
  static Dio getClient({
    required String url,
    Map<String, dynamic> headers = const {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    List<Interceptor>? interceptors,
  }) {
    final client = Dio(
      BaseOptions(
        baseUrl: url,
        headers: headers,
      ),
    );

    interceptors?.forEach((interceptor) {
      client.interceptors.add(interceptor);
    });
    return client;
  }
}
