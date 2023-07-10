import 'package:json_annotation/json_annotation.dart';

part 'chopper_model.g.dart';

@JsonSerializable()
class ChopperModel {
  final int userId;
  final String title;

  ChopperModel({required this.userId, required this.title});

  factory ChopperModel.fromJson(Map<String, dynamic> map) =>
      _$ChopperModelFromJson(map);

  Map<String, dynamic> toJson() => _$ChopperModelToJson(this);
}
