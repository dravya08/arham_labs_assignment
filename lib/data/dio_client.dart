import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../model/condition/condition_model.dart';

class DioClient {
  Dio? dio;

  DioClient() {
    dio = Dio();

    dio?.interceptors.add(PrettyDioLogger(
        requestHeader: true, requestBody: true, responseHeader: true));
  }

  final _baseUrl = 'https://api.npoint.io';

  Future<List<Datapoint>> getConditionList() async {
    try {
      Response userData = await dio!.get('$_baseUrl/9e770042fdd8054110f1');

      final response = Condition.fromJson(userData.data);

      return response.datapoints;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        log('Dio error!');
        log('STATUS: ${e.response?.statusCode}');
        log('DATA: ${e.response?.data}');
        log('HEADERS: ${e.response?.headers}');
        return [];
      } else {
        // Error due to setting up or sending the request
        log('Error sending request!');
        log("${e.message}");
        return [];
      }
    }
  }
}
