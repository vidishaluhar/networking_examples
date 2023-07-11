import 'package:json_annotation/json_annotation.dart';

part 'chopper_model.g.dart';

@JsonSerializable()
class ChopperModel {
   int? userId;
   String? title;

  ChopperModel({ this.userId,  this.title,});

  factory ChopperModel.fromJson(Map<String, dynamic> map) =>
      _$ChopperModelFromJson(map);

  Map<String, dynamic> toJson() => _$ChopperModelToJson(this);
}
