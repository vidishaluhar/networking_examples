
import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:networking_examples/model/chopper_model.dart';

part 'chopper_service.chopper.dart';

@ChopperApi()
abstract class ChopperApiService extends ChopperService {

  @Get(path: '/posts')
  Future<Response> getData();

  @Get(path: "/posts/{id}")
  Future<Response> getSpecificData(@Path('id') int id);

  @Post(path: '/posts')
  Future<Response> postData(@Body() ChopperModel chopperModel);

  @Put(path: '/posts/{id}')
  Future<Response> putData(@Path('id') int id,@Body() ChopperModel chopperModel);

  @Patch(path: '/posts/{id}')
  Future<Response> patchData(@Path('id') int id, @Body() Map<String,dynamic> patchData);

  @Delete(path: '/posts/{id}')
  Future<Response> deleteData(@Path('id') int id);

  static ChopperApiService create() {
    final client = ChopperClient(
        baseUrl: Uri.parse('https://jsonplaceholder.typicode.com'),
        services: [_$ChopperApiService()],
        converter: JsonConverter());
    return _$ChopperApiService(client);
  }
}
