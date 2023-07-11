import 'package:networking_examples/routes/chopper/chopper_example.dart';
import 'package:chopper/chopper.dart';

part 'chopper_service.chopper.dart';

@ChopperApi(baseUrl: 'https://jsonplaceholder.typicode.com/posts')
abstract class ApiService extends ChopperService {
  @Get(headers: {'Contetnt_Type': 'application/json'})
  Future<Response> getData();

  @Get(path: "/{id}")
  Future<Response> getSpecificData(
      @Path('id') int id, @Header('header-name') String headerValue);

  @Post()
  Future<Response> postData(@Body() ChopperApi chopperApi);
}
