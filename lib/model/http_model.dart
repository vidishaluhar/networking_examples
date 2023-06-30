import 'package:json_annotation/json_annotation.dart';
part 'http_model.g.dart';

@JsonSerializable()
class HttpModel
{
  final int userId;
  final String title;

  HttpModel({required this.userId,required this.title});

  factory HttpModel.fromJson(Map<String, dynamic> map) => _$HttpModelFromJson(map);

  Map<String, dynamic> toJson() => _$HttpModelToJson(this);
}