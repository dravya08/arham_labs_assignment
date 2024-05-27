import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../model/condition/condition_model.dart';
import '../model/home/get_chip_data_model.dart';
import '../model/home/get_home_feed.dart' as home;

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

  Future<List<CommunityGroup>> getChipsData() async {
    try {
      Response userData = await dio!.get('$_baseUrl/f31b1f0d9a0c1ab4c945');

      final response = GetChipsDataResponse.fromJson(userData.data);
      return response.communityGroups;
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

  Future<List<home.UserFeed>> getHomeFeed() async {
    try {
      Response userData = await dio!.get('$_baseUrl/bb8567e6fdfb0336a4bf');

      final response = home.HomeFeedResponse.fromJson(userData.data);
      return response.userFeeds;
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
