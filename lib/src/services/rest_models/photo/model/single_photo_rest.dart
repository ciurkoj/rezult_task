import 'package:json_annotation/json_annotation.dart';

part 'single_photo_rest.g.dart';

@JsonSerializable(explicitToJson: true)
class SinglePhotoRest {
  final int? albumId;
  final int? id;
  final String? title;
  final String? url;
  @JsonKey(name: "thumbnailUrl")
  final String? thumbnail;

  SinglePhotoRest({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnail,
  });

  static const fromJsonFactory = _$SinglePhotoRestFromJson;

  factory SinglePhotoRest.fromJson(Map<String, dynamic> json) =>
      _$SinglePhotoRestFromJson(json);

  Map<String, dynamic> toJson() => _$SinglePhotoRestToJson(this);
}
