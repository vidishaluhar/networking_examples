import 'package:dio/dio.dart';

class ServerError implements Exception
{
  int? errorCode;

  String errorMsg="";

  ServerError.withError({DioException? error})
  {
    handleError(error!);
  }

  getErrorCode()
  {
    return errorCode;
  }

  getErrorMsg()
  {
    return errorMsg;
  }

  handleError(DioException error)
  {
      switch(error.type)
      {
        case DioExceptionType.cancel : errorMsg="Request was cancelled"; break;
        case DioExceptionType.connectionTimeout : errorMsg="Connection Timeout"; break;
        case DioExceptionType.unknown : errorMsg="failed due to internet connection"; break;
        case DioExceptionType.receiveTimeout : errorMsg="Receive timeout in connection"; break;
        case DioExceptionType.badResponse : errorMsg="Received invalid status code: ${error.response?.statusCode}"; break;
        case DioExceptionType.sendTimeout : errorMsg="Receive timeout in send request"; break;
        case DioExceptionType.badCertificate : errorMsg="bad certificate"; break;
        case DioExceptionType.connectionError : errorMsg="Connection Error  "; break;
      }
      return errorMsg;
  }
}