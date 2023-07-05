import 'package:shared_preferences/shared_preferences.dart';
class Store
{
  const Store._();

  static const String tokenKey="TOKEN";

  static Future<void> setToken(String token) async
  {
    final preference=await SharedPreferences.getInstance();
    await preference.setString(tokenKey,token);
  }

  static Future<String?> getToken() async
  {
    final preference=await SharedPreferences.getInstance();
    return preference.getString(tokenKey);
  }

  static Future<void> clear() async
  {
    final preference=await SharedPreferences.getInstance();
    await preference.clear();
  }
}