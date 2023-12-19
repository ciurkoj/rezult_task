import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:rezult_test/src/domain_models/photo.dart';
import 'package:rezult_test/src/mappers/photo_rest_to_domain_mapper.dart';
import 'package:rezult_test/src/services/exceptions/exception_converter.dart';
import 'package:rezult_test/src/services/exceptions/exceptions.dart';
import 'package:rezult_test/src/services/photos_rest.dart';
import 'package:rezult_test/src/services/photos_service.dart';
import 'package:rezult_test/src/services/rest_models/photo/model/single_photo_rest.dart';
import 'package:tuple/tuple.dart';

class PhotosServiceImpl implements PhotosService {
  final PhotosRest photosRest;

  PhotosServiceImpl({required this.photosRest});

  @override
  Future<List<PhotoDomain>?> get getPhotos async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        throw InternetConnectionError();
      }
      List<SinglePhotoRest>? response = await photosRest.getPhotos();

      return response?.map((e) => e.mapToDomain()).toList();

      // List<PhotoDomain?> _photos = [];

      // if (response?.photos != null) {
      //   return response?.photos?.map((e) => e.mapToDomain()).toList();
        // List<Future> futures = [];
        // for (SinglePhotoRest card in response!.photos!) {
        //   futures
        //       .add(getCardWithImages(card).then((value) => _photos.add(value)));
        // }
        // await Future.wait(futures);
      // }
      // _photos.removeWhere((element) => element == null);
      // List<PhotoDomain> photos = _photos.map((e) => e!).toList();
      // return photos;
    } on DioException catch (e) {
      throw RestExceptionConverter.catchDioError(
        e,
      );
    }
  }

  // Future<PhotoDomain?> getCardWithImages(SinglePhotoRest card) async {
  //   try {
  //     final urlPhoto = photosRest.getPhoto(url: card.url!) ;
  //     final thumnailPhoto = photosRest.getPhoto(url: card.thumbnail!);
  //     final images = await getImagesConcurrently(urlPhoto, thumnailPhoto);
  //
  //     return PhotoDomain(
  //       albumId: card.albumId,
  //       id: card.id,
  //       title: card.title,
  //       urlPhoto: images?.item1,
  //       thumnailPhoto: images?.item2,
  //     );
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<Tuple2<T1?, T2?>?> getImagesConcurrently<T1, T2>(
    Future<T1?> future1,
    Future<T2?> future2,
  ) async {
    late T1? result1;
    late T2? result2;

    await Future.wait([
      future1.then((value) => result1 = value),
      future2.then((value) => result2 = value)
    ]);

    return Future.value(Tuple2(result1, result2));
  }
}
