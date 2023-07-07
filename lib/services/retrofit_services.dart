import 'package:networking_examples/model/retrofit_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'retrofit_services.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class ApiService {
  // factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
        contentType: 'application/json',
        receiveTimeout: const Duration(seconds: 5),
        connectTimeout: const Duration(seconds: 5),
        headers: {'Authorization': 'Authorized'});

    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET('posts')
  Future<List<RetrofitModel>> getData();

  @GET('posts/{id}')
  Future<RetrofitModel> getSpecificData(@Path("id") String userId);

  @GET('posts')
  Future<List<RetrofitModel>> getDataUptoQueryParameter(
      @Query('limit') int limit);

  @POST('/posts')
  Future<RetrofitModel> postData(@Body() RetrofitModel retrofitModel);

  @POST('/posts{id}')
  @MultiPart()
  Future<RetrofitModel> postSpecificData(@Path('id') String id,
      @Body() RetrofitModel retrofitModel, @Part() String userName);

  @PUT('posts/{id}')
  Future<RetrofitModel> updatePostData(
      @Path('id') String id, @Body() RetrofitModel retrofitModel);

  @PATCH('posts/{id}')
  Future<RetrofitModel> patchData(
      @Path('id') String id, @Body() RetrofitModel retrofitModel);

  @DELETE('posts/{id}')
  Future<RetrofitModel> deleteData(@Path('id') String id);
}
