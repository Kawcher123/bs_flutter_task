import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../../exceptions/customExceptions.dart';


class APIManager {

  final http.Client client;
  APIManager(this.client);



  Future<dynamic> postAPICallWithHeader({String? url, var param, Map<String, String>? headerData}) async {
    log("Calling API: $url");
    log("Calling parameters: ${param}");
    log("Calling parameters: ${headerData}");

    var responseJson;
    try {
      final response = await client.post(Uri.parse(url!), body: param, headers: headerData ?? {});

      log('APIManager.postAPICallWithHeader:${response.body}');
      responseJson = apiResponse(response);
    } on SocketException catch (e) {
      log('APIManager.postAPICallWithHeader: $e');

      throw ServerException('Socket Exception in postAPICallWithHeader :${e.toString()}');
    } catch (e) {
      throw ('Exception in postAPICallWithHeader :${e.toString()}');
    }
    return responseJson;
  }



  Future<dynamic> getWithHeader({String? url, Map<String, String>? headerData}) async {
    log("Calling API: $url");
    log("Calling API header: $headerData");
    var responseJson;
    try {
      final response = await client.get(Uri.parse(url!), headers: headerData ?? {});


      responseJson = apiResponse(response);
    } on SocketException catch (e) {
      throw ServerException('Socket Exception in getWithHeader :${e.toString()}');
    } catch (e) {
      throw ('Exception in getWithHeader :${e.toString()}');
    }
    return responseJson;
  }

  dynamic apiResponse(http.Response response) {
    log('APIManager.apiResponse:${response.statusCode}');
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw ServerException(response.body.toString());
    }
  }
}
