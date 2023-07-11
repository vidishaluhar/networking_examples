// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chopper_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ApiService extends ApiService {
  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiService;

  @override
  Future<Response<dynamic>> getData() {
    final Uri $url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final Map<String, String> $headers = {
      'Contetnt_Type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getSpecificData(
    int id,
    String headerValue,
  ) {
    final Uri $url =
        Uri.parse('https://jsonplaceholder.typicode.com/posts/${id}');
    final Map<String, String> $headers = {
      'header-name': headerValue,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> postData(ChopperApi chopperApi) {
    final Uri $url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final $body = chopperApi;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
