import 'package:json_annotation/json_annotation.dart';
part 'retrofit_model.g.dart';
@JsonSerializable()
class RetrofitModel
{
  final int userId;
  final int id;
  final String title;
  final String body;

  RetrofitModel({required this.userId,required this.id,required this.title,required this.body});

  factory RetrofitModel.fromJson(Map<String, dynamic> map) => _$RetrofitModelFromJson(map);

  Map<String,dynamic> toJson() => _$RetrofitModelToJson(this);
}