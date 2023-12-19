import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:rezult_test/src/services/exceptions/exception_converter.dart';
import 'package:rezult_test/src/services/rest_models/photo/model/single_photo_rest.dart';

class PhotosRest {
  final Dio _dio;

  PhotosRest(
    this._dio,
  );

  Future<List<SinglePhotoRest>?> getPhotos() async {
    try {
      final Response<List> response = await _dio.get(
        "/photos",
      );
      if (response.statusCode == 200) {
        return response.data
            ?.map((e) => SinglePhotoRest.fromJsonFactory(e))
            .toList();
      }
      return null;
    } on DioException catch (e) {
      throw RestExceptionConverter.catchDioError(
        e,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Uint8List?> getPhoto({required String url}) async {
    try {
      final response = await Dio().get(url,
          options: Options(
            responseType: ResponseType.bytes,
          ));
      if (response.statusCode != 200 || response.data == null) {
        return null;
      }
      return Uint8List.fromList(response.data);
    } on DioException catch (e) {
      throw RestExceptionConverter.catchDioError(
        e,
      );
    } catch (e) {
      rethrow;
    }
  }
}
