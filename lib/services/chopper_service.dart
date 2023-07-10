import 'package:networking_examples/routes/chopper/chopper_example.dart';
import 'package:chopper/chopper.dart';

part 'chopper_service.g.dart';

@ChopperApi(baseUrl: 'https://jsonplaceholder.typicode.com/posts')
abstract class ApiService extends ChopperExample
{
  Future<ChopperApi> getPosts();
}