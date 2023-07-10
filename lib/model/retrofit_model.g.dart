// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrofit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetrofitModel _$RetrofitModelFromJson(Map<String, dynamic> json) =>
    RetrofitModel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$RetrofitModelToJson(RetrofitModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
