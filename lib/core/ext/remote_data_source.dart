import 'dart:io';

import 'package:data_source/data_source/data_source.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import '../../app_data/app_data.dart';

extension GetFile on RemoteDataSource {
  Future<File?> getFile(String endpoint, String fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();

      final String filePath = '${directory.path}/$fileName';

      final response = await dio.download(
        dio.options.baseUrl + endpoint,
        filePath,
        options: Options(
          headers: dio.options.headers,
        ),
      );

      if (response.statusCode == 200) {
        return File(filePath);
      } else {
        return null;
      }
    } catch (e, st) {
      AppData.logger.e('message', error: e, stackTrace: st);
      return null;
    }
  }
}
