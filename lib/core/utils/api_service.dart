import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/';
  final Dio _dio;

  ApiService(this._dio);

  Future get() async {
    Response response = await _dio.get(
      '${_baseUrl}posts',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    return response;
  }

  Future post({
    required Map<String, dynamic> data,
  }) async {
    Response response = await _dio.post(
      '${_baseUrl}posts',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
      data: data,
    );
    return response;
  }

  Future delete({
    required int id,
  }) async {
    Response response = await _dio.delete(
      '${_baseUrl}posts/$id',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    return response;
  }

  Future update({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    Response response = await _dio.patch(
      '${_baseUrl}posts/$id',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
      data: data,
    );
    return response;
  }
}
