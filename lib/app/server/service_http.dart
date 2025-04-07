import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ayan_healthcare/app/server/app_exception.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/src/media_type.dart' as media;
import 'package:ayan_healthcare/app/server/server_config.dart';
import 'package:ayan_healthcare/app/utils/utilities.dart';

class ServiceHttp {
  /// Base URL for the API
  static const String baseUrl = ServerConfig.baseUrl;

  /// Endpoint path to be appended to base URL
  ///
  final String endPoint;

  static final Dio _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    queryParameters: {'SystemKey': ServerConfig.systemKey},
  ));

  static Dio get dio => _dio;

  ServiceHttp({required this.endPoint});

  final _chuckerHttpClient = ChuckerHttpClient(http.Client());

  /// ~~~~~~~~~~~~ HTTP POST ~~~~~~~~~~~~ ///
  Future<dynamic> post({
    required Map<String, dynamic> postBody,
    required Map<String, String> header,
  }) async {
    try {
      debugPrint(
          'HITTING POST API AT ==> $endPoint WITH BODY \n${(jsonEncode(postBody))}');
      // Making Request
      var response = await _chuckerHttpClient
          .post(Uri.parse(baseUrl + endPoint),
              headers: header, body: jsonEncode(postBody))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        return http.Response("connection timed out", 500);
      });
      debugPrint(
          'POST API RESPONSE OF ==> ${baseUrl + endPoint}  \n${response.body}');
      return returnResponse(response);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      throw checkException(e as Exception);
    }
  }

  /// ~~~~~~~~~~~~ HTTP GET ~~~~~~~~~~~~ ///
  Future<dynamic> get({
    required Map<String, String> header,
    Map<String, String>? params,
  }) async {
    try {
      print('HITTING GET API AT ==> ${baseUrl + endPoint}');
      // Making Request
      var response = await _chuckerHttpClient
          .get(
        Uri.parse(baseUrl + endPoint).replace(queryParameters: params),
        headers: header,
      )
          .timeout(const Duration(seconds: 10), onTimeout: () {
        return http.Response("connection times out", 500);
      });
      if (response.request != null) {
        debugPrint(
            'GET API RESPONSE OF ==> ${response.request!.url}\n With Headers $header  \n${response.body}');
      }
      return returnResponse(response);
    } catch (e) {
      print('type of error is $e');
      throw checkException(e as Exception);
    }
  }

  /// ~~~~~~~~~
  /// ~~~~~~~~~~~~ HTTP PUT ~~~~~~~~~~~~ ///
  Future<dynamic> put({
    required Map<String, dynamic> putBody,
    required Map<String, String> header,
  }) async {
    try {
      debugPrint(
          'HITTING PUT API AT ==> ${baseUrl + endPoint} \nWITH HEADERS\n$header\n WITH BODY \n${(jsonEncode(putBody))}');
      // Making Request
      var response = await _chuckerHttpClient
          .put(Uri.parse(baseUrl + endPoint),
              headers: header, body: jsonEncode(putBody))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        return http.Response("connection timed out", 500);
      });
      debugPrint(
          'PUT API RESPONSE OF ==> ${baseUrl + endPoint}  \n${response.body}');
      return returnResponse(response);
    } catch (e) {
      throw checkException(e as Exception);
    }
  }

  /// ~~~~~~~~~~~~ HTTP DELETE ~~~~~~~~~~~~ ///
  Future<dynamic> delete({required Map<String, String> header}) async {
    try {
      debugPrint(
          'HITTING DELETE API AT ==> ${baseUrl + endPoint} \nWITH HEADERS\n$header');
      // Making Request
      var response = await _chuckerHttpClient
          .delete(
        Uri.parse(baseUrl + endPoint),
        headers: header,
      )
          .timeout(const Duration(seconds: 10), onTimeout: () {
        return http.Response("connection timed out", 500);
      });
      debugPrint(
          'DELETE API RESPONSE OF ==> ${baseUrl + endPoint}  \n${response.body}');
      return returnResponse(response);
    } catch (e) {
      throw checkException(e as Exception);
    }
  }

  /// ~~~~~~~~~~~~ HTTP POST IMAGE ~~~~~~~~~~~~ ///
  Future<dynamic> postImage({
    required File file,
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(baseUrl + endPoint),
      );
      print('Image extension is ${Utilities.getImageExtension(file.path)}');
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          file.path,
          contentType: media.MediaType('image',
              Utilities.getImageExtension(file.path)), // Adjust if needed
        ),
      );
      http.StreamedResponse streamedResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamedResponse);

      debugPrint(
          'POST API RESPONSE OF ==> ${baseUrl + endPoint}  \n${response.body}');
      return returnResponse(response);
    } catch (e) {
      throw checkException(e as Exception);
    }
  }

  /// ~~~~~~~~~~~~ RESPONSE HANDLING ~~~~~~~~~~~~ ///
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(message: getMessage(response.body));
      case 401:
      case 403:
        throw UnauthorisedException(message: getMessage(response.body));
      case 404:
        throw UrlNotFoundException(message: getMessage(response.body));
      case 500:
        throw InternalServerError(message: getMessage(response.body));
      default:
        throw FetchDataException(
            'Server Communication Failed' ' ${response.statusCode}');
    }
  }

  String getMessage(response) {
    try {
      var json = jsonDecode(response);
      var messageData = json["message"];
      List<String>? parsedMessage;
      if (messageData is String) {
        parsedMessage = [messageData];
      } else if (messageData is List) {
        parsedMessage = List<String>.from(messageData.map((x) => x.toString()));
      }
      if (parsedMessage!.isNotEmpty) {
        return parsedMessage[0];
      } else {
        return '';
      }
    } catch (e, s) {
      print(e);
      print(s);
      rethrow;
    }
  }

  Exception checkException(Exception e) {
    if (e is SocketException) {
      throw NoInternetException();
    }
    throw e;
  }
}
