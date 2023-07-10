import 'package:json_annotation/json_annotation.dart';

part 'dio_model.g.dart';

@JsonSerializable()
class DioModel {
  final int userId;
  final String title;

  DioModel({required this.userId, required this.title});

  factory DioModel.fromJson(Map<String, dynamic> map) =>
      _$DioModelFromJson(map);

  Map<String, dynamic> toJson() => _$DioModelToJson(this);
}
