import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networking_examples/routes/http/delete_request.dart';
import 'package:networking_examples/routes/http/get_request.dart';
import 'package:networking_examples/routes/http/http_example.dart';
import 'package:networking_examples/routes/http/patch_request.dart';
import 'package:networking_examples/routes/http/post_request.dart';
import 'package:networking_examples/routes/http/put_request.dart';

class Routes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/http':
        return MaterialPageRoute(builder: (BuildContext context) {
          return HttpExample();
        });

      case '/httpGet':
        return MaterialPageRoute(builder: (BuildContext context) {
          return GetRequest();
        });

      case '/httpPost':
        return MaterialPageRoute(builder: (BuildContext context) {
          return PostRequest();
        });

      case '/httpPut':
        return MaterialPageRoute(builder: (BuildContext context) {
          return PutRequest();
        });

      case '/httpPatch':
        return MaterialPageRoute(builder: (BuildContext context) {
          return PatchRequest();
        });

      case '/httpDelete':
        return MaterialPageRoute(builder: (BuildContext context) {
          return DeleteRequest();
        });
    }
  }
}
