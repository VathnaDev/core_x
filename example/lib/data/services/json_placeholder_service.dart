import 'package:example/data/models/todo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'json_placeholder_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class JsonPlaceholderService {
  factory JsonPlaceholderService(Dio dio, {String baseUrl}) = _JsonPlaceholderService;

  @GET("/todos")
  Future<List<Todo>> getTodos();
}