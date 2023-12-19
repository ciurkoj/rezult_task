// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_photos_response_rest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPhotosResponseRest _$GetPhotosResponseRestFromJson(
        Map<String, dynamic> json) =>
    GetPhotosResponseRest(
      someCustomParameterFromAPI:
          (json['someCustomParameterFromAPI'] as List<dynamic>?)
              ?.map((e) => SinglePhotoRest.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$GetPhotosResponseRestToJson(
        GetPhotosResponseRest instance) =>
    <String, dynamic>{
      'someCustomParameterFromAPI':
          instance.someCustomParameterFromAPI?.map((e) => e.toJson()).toList(),
    };
