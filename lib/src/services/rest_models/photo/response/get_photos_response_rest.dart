import 'package:json_annotation/json_annotation.dart';
import 'package:rezult_test/src/services/rest_models/photo/model/single_photo_rest.dart';

part 'get_photos_response_rest.g.dart';

@JsonSerializable(explicitToJson: true)
class GetPhotosResponseRest {
  /// An example of custom API parameters
  final List<SinglePhotoRest>? someCustomParameterFromAPI;

  GetPhotosResponseRest({
    this.someCustomParameterFromAPI,
  });

  static const fromJsonFactory = _$GetPhotosResponseRestFromJson;

  factory GetPhotosResponseRest.fromJson(Map<String, dynamic> json) =>
      _$GetPhotosResponseRestFromJson(json);

  Map<String, dynamic> toJson() => _$GetPhotosResponseRestToJson(this);
}
