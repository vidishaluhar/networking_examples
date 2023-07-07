import 'package:flutter/material.dart';
import 'package:networking_examples/completer_example.dart';
import 'package:networking_examples/routes/dio/dio_example.dart';
import 'package:networking_examples/routes/dio/dio_get_data.dart';
import 'package:networking_examples/routes/http/delete_request.dart';
import 'package:networking_examples/routes/http/get_request.dart';
import 'package:networking_examples/routes/http/http_example.dart';
import 'package:networking_examples/routes/http/patch_request.dart';
import 'package:networking_examples/routes/http/post_request.dart';
import 'package:networking_examples/routes/http/put_request.dart';
import 'package:networking_examples/routes/retrofit/retrofit_example.dart';
import 'package:networking_examples/routes/retrofit/retrofit_get_data.dart';
import 'package:networking_examples/routes/retrofit/retrofit_get_specific_data.dart';
import 'package:networking_examples/routes/retrofit/retrofit_post_put_delete_patch_data.dart';
import 'package:networking_examples/routes/retrofit/retrofit_query_parameter.dart';

class Routes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/http':
        return MaterialPageRoute(builder: (BuildContext context) {
          return HttpExample();
        });

      case '/httpGet':
        return MaterialPageRoute(builder: (BuildContext context) {
          return const GetRequest();
        });

      case '/httpPost':
        return MaterialPageRoute(builder: (BuildContext context) {
          return const PostRequest();
        });

      case '/httpPut':
        return MaterialPageRoute(builder: (BuildContext context) {
          return const PutRequest();
        });

      case '/httpPatch':
        return MaterialPageRoute(builder: (BuildContext context) {
          return const PatchRequest();
        });

      case '/httpDelete':
        return MaterialPageRoute(builder: (BuildContext context) {
          return const DeleteRequest();
        });

      case '/completerExample':
        return MaterialPageRoute(builder: (BuildContext context) {
          return const CompleterExample();
        });

      case '/dio':
        return MaterialPageRoute(builder: (BuildContext context) {
          return const DioExample();
        });

      case '/dioGetData':
        return MaterialPageRoute(builder: (BuildContext context) {
          return const DioGetData();
        });

      case '/retrofitExample':
        return MaterialPageRoute(builder: (BuildContext context) {
          return const RetrofitExample();
        });

      case '/retrofitGetData':
        return MaterialPageRoute(builder: (BuildContext context) {
          return RetrofitGetData();
        });

      case '/retrofitGetSpecificData':
        return MaterialPageRoute(builder: (BuildContext context) {
          return RetrofitGetSpecificDataExample();
        });

      case '/retrofitQueryParameter':
        return MaterialPageRoute(builder: (BuildContext context) {
          return RetrofitQueryParameterExample();
        });

      case '/retrofitPostData':
        return MaterialPageRoute(builder: (BuildContext context) {
          return RetrofitPostDataExample();
        });

    }
    return null;
  }
}
