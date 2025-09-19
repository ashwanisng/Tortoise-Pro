import 'package:flutter_bloc_starter/utils/helper/exception_handler.dart' show APIException;

class RepoResponse<T> {
  final APIException? error;
  final T? data;

  RepoResponse({this.error, this.data});
}
