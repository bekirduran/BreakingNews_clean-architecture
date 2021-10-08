import 'package:dio/dio.dart';


abstract class DataState<T>{
  final T? data;
  final DioError? error;

   DataState(this.data,  this.error);
}



class DataSuccess<T> extends DataState<T>{
  DataSuccess(T data) : super(data,null);
}

class DataFailed<T> extends DataState<T>{
  DataFailed(DioError error) : super(null,error);
}