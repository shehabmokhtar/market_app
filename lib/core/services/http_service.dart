import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:market_app/core/error/http_exception.dart';
import 'package:market_app/core/services/http_service_interface.dart';

import '../error/exception_model.dart';
import '../error/http_failure.dart';
import 'global_variables.dart';

class HttpService extends HttpServiceInterface {
  @override
  Future<Either<HttpFailure, T?>> get<T>({
    required String url,
    String? query,
    required T? Function(dynamic p1) fromJson,
    Map<String, dynamic> headers = const {},
    bool requireToken = true,
  }) async {
    try {
      final urlParsed = Uri.parse('$url${query != null ? '?$query' : ''}');

      final requestHeaders = await _buildRequestHeader(headers, requireToken);

      final response = await http
          .get(
        urlParsed,
        headers: requestHeaders,
      )
          .timeout(const Duration(seconds: 60), onTimeout: () {
        throw TimeoutException(
            'Sorry, the operation took too long to complete. Please try again!');
      });

      if (response.statusCode == 204) {
        return right(null);
      }

      final decodedResponse = jsonDecode(response.body);

      if (response.statusCode > 299) {
        final error = ExceptionModel.fromJson(decodedResponse);
        throw HttpException(error.message);
      }

      final parsedModel = fromJson(decodedResponse);

      return right(parsedModel);
    } catch (error) {
      print(error);
      return handleException(error);
    }
  }

  @override
  Future<Either<HttpFailure, T?>> patch<T>(
      {required String url,
      String? query,
      required T? Function(dynamic p1) fromJson,
      Map<String, dynamic>? body,
      Map<String, dynamic> headers = const {},
      bool requireToken = true}) async {
    try {
      final urlParsed = Uri.parse('$url${query != null ? '?$query' : ''}');
      print(urlParsed);

      final requestHeaders = await _buildRequestHeader(headers, requireToken);

      final response = await http
          .patch(
        body: body,
        urlParsed,
        headers: requestHeaders,
      )
          .timeout(const Duration(seconds: 60), onTimeout: () {
        throw TimeoutException(
            'Sorry, the operation took too long to complete. Please try again!');
      });

      final decodedResponse = jsonDecode(response.body);

      print(decodedResponse);

      if (response.statusCode > 299) {
        final error = ExceptionModel.fromJson(decodedResponse);
        throw HttpException(error.message);
      }

      final parsedModel = fromJson(decodedResponse);

      return right(parsedModel);
    } catch (error) {
      print(error);
      return handleException(error);
    }
  }

  Future<Map<String, String>> _buildRequestHeader(
    Map<String, dynamic> headers,
    bool requireToken,
  ) async {
    Map<String, String> requestHeaders = {
      'content-type': "application/json",
      ...headers,
    };

    // will be added later to add the token if required

    if (requireToken) {
      //   String? token =
      //       await sharedPreferencesService.getData<String>(StringConstants.token);
      //   print(token);
      // if (token != null) {
      requestHeaders['Authorization'] = token!;
      // }
    }

    return requestHeaders;
  }
}
