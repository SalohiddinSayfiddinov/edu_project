import 'package:dio/dio.dart';
import 'lesson.dart';

class LessonApi {
  final Dio dio;
  final String baseUrl;

  LessonApi(this.dio, {this.baseUrl = "https://2ef0-90-156-198-203.ngrok-free.app/api/v1"});

 Future<List<Lesson>> getLessons() async {
  final response = await dio.get('$baseUrl/lessons/lessons/');
  final data = response.data;

  print('📥 API raw response: $data');  

  if (data is List) {
  
    return data.map((json) => Lesson.fromJson(json)).toList();
  } else if (data is Map && data.containsKey('results')) {
   
    return (data['results'] as List).map((json) => Lesson.fromJson(json)).toList();
  } else {
    print('❌ Неизвестный формат данных от сервера');
    return [];
  }
}

}
  