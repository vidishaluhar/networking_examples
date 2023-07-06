import 'package:networking_examples/model/retrofit_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'retrofit_services.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class ApiService
{
    factory ApiService(Dio dio) = _ApiService;

    @GET('posts')
    Future<List<RetrofitModel>> getData();
}