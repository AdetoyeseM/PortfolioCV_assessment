import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio_cv_assessment/services/network_constant/network_constants.dart';

class HttpService {
  // Perform HTTP GET request and handle exceptions
  Future<ApiResponse<Map<String, dynamic>>> get(
      {@required url, BuildContext? context}) async {
    var uri = Uri.parse(url);
    var response;
    var data;

    try {
      response = await http.get(uri).timeout(Duration(seconds: 30));

      data = json.decode(response.body);
    } catch (e) {
      switch (e) {
        case SocketException:
          data = "Socket Exception";
          break;
        case TimeoutException:
          data = "Timeout Exception";
          break;
        default:
          data = e;
      }
    }

    return ApiResponse<Map<String, dynamic>>(
      data: data,
      statusCode: response != null ? response.statusCode : 504,
    );
  }
}
