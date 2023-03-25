// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_dev_test/data/utils/model.dart';

enum RequestMethods { get, post, put, delete, patch }

class Services {
  Dio dio = Dio();

  Future request<T extends Model>({
    RequestMethods method = RequestMethods.post,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    required String methodRequest,
    required String tblRequest,
    required String baseUrl,
    required dynamic params,
    required T models,
  }) async {
    Response? response;

    headers = {
      "Content-Type": "application/json",
    };

    String finalUrl = baseUrl + "/" + tblRequest + methodRequest;
    debugPrint("URL : $finalUrl");

    try {
      switch (method) {
        case RequestMethods.get:
          response = await dio.get(finalUrl);
          break;
        case RequestMethods.post:
          response = await dio.post(finalUrl,
              data: params,
              options:
                  Options(headers: headers, receiveDataWhenStatusError: true));
          break;
        case RequestMethods.put:
          response = await dio.put(finalUrl);
          break;
        case RequestMethods.delete:
          response = await dio.delete(finalUrl);
          break;
        case RequestMethods.patch:
          response = await dio.patch(finalUrl);
          break;
      }

      debugPrint(" ############ Response Data  ##############");
      debugPrint(response.toString());

      models.fromJson(response.data);
    } on DioError catch (error) {
      if (error.type == DioErrorType.connectionTimeout) {
        debugPrint("Connection Time Out! $error");
        return "Connection Time Out";
      } else if (error.type == DioErrorType.unknown) {
        debugPrint("Error Other $error");
        return "Service Error";
      } else {
        debugPrint("Unknown Error $error");
        return "Unknown Error";
      }
    }
    return models;
  }
}
