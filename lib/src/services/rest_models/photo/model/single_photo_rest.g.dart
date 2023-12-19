// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_photo_rest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SinglePhotoRest _$SinglePhotoRestFromJson(Map<String, dynamic> json) =>
    SinglePhotoRest(
      albumId: json['albumId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      thumbnail: json['thumbnailUrl'] as String?,
    );

Map<String, dynamic> _$SinglePhotoRestToJson(SinglePhotoRest instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnail,
    };
