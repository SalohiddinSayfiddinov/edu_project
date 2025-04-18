import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'lesson.dart';

part 'lesson_api.g.dart';

@RestApi(baseUrl: "https://f51f-90-156-198-203.ngrok-free.app/api/v1")
abstract class LessonApi {
  factory LessonApi(Dio dio, {String baseUrl}) = _LessonApi;

  @GET("/lessons/lessons/")
  Future<List<Lesson>> getLessons();
}
