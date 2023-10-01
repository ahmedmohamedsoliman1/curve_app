import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'api_constants.dart';


// ignore: non_constant_identifier_names
final Api = ApiClient();

class ApiClient {
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        validateStatus: (_) => true,
        followRedirects: false,
        contentType: 'application/json',
        headers: {'accept': 'application/json'},
      ),
    );
    return dio;
  }
  Response _validate(Response res) {
    return res;
  }

  /// sends a [GET] request to the given [url]
  Future<Response> get(
      String url, {
        Map<String, dynamic> headers = const {},
        Map<String, dynamic> query = const {},
        bool attachToken = false,
        bool wantBytes = false,
      }) async {
      final res = await dio.get(
        url,
        queryParameters: {...query},
        options: Options(
          headers: {
            // if (attachToken && Prefs.getString(PrefsKeys.token).isNotEmpty)
            //   HttpHeaders.authorizationHeader:
            //   'Bearer ${Prefs.getString(PrefsKeys.token)}',
            // 'Accept-Language': getLanguageCode(),
            'accept': 'application/json',
            'Content-Type': 'application/json',
            ...headers,
          },
          responseType: wantBytes ? ResponseType.bytes : null,
        ),
      );
      print("From [$url] Requestbody:  \n RequestHeaders: ${res.requestOptions.headers.toString()} , \n Response:${res.data}");

      return _validate(res);
    }


  Future<Response> post(
      String path, {
        Map<String, dynamic> body = const {},
        Map<String, dynamic> headers = const {},
        Map<String, dynamic> query = const {},
        List<File> files = const [],
        String? contentType = 'application/json',
        bool isFormData = false,
        bool attachToken = false,
      }) async {
    // log("From [$path] Requestbody: ${body.toString()} , RequestHeaders: ${headers.toString()} ");
    // if (attachToken && Prefs.getString(PrefsKeys.token).isEmpty) {
    //   throw 'unauthenticated';
    // }
      final res = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(body) : body,
        queryParameters: query,
        options: Options(
          headers: {
            // if (attachToken)
            //   HttpHeaders.authorizationHeader:
            //   'Bearer ${Prefs.getString(PrefsKeys.token)}',
            'Content-Type': contentType,
            'accept': contentType,
            ...headers,
          },
          // contentType: contentType,
        ),
      );
      log("From [$path] Requestbody: ${body.toString()} \n RequestHeaders: ${res.requestOptions.headers.toString()} , \n Response:${res.data}");
      print("From [$path] Requestbody: ${body.toString()} \n RequestHeaders: ${res.requestOptions.headers.toString()} , \n Response:${res.data}");
      return _validate(res);
  }

  Future<Response> put(
      String path, {
        dynamic body = const {},
        bool attachToken = true,
        Map<String, dynamic> headers = const {},
        Map<String, dynamic> query = const {},
      }) async {
      final res = await dio.put(
        path,
        data: body,
        queryParameters: {...query},
        options: Options(
          headers: {
            // if (attachToken)
            //   HttpHeaders.authorizationHeader:
            //   'Bearer ${Prefs.getString(PrefsKeys.token)}',
            'accept' : "application/json" ,
            "Content-Type" : "application/json",
            ...headers,
          },
        ),
      );
      return _validate(res);

  }

  Future<Response> delete(
      String path, {
        dynamic body = const {},
        Map<String, dynamic> headers = const {},
        Map<String, dynamic> query = const {},
      }) async {
      final res = await dio.delete(
        path,
        data: body,
        queryParameters: {...query},
        options: Options(
          headers: {
            'accept' : "application/json" ,
            "Content-Type" : "application/json",
            ...headers,
          },
        ),
      );
      return _validate(res);
  }
}
