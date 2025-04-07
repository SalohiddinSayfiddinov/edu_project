import 'package:edu_project/habit/lesson/lesson.dart';
import 'package:edu_project/habit/lesson/lesson_api.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class LessonsPage extends StatefulWidget {
  @override
  _LessonsPageState createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  late LessonApi lessonApi;
  List<Lesson> lessons = [];

  @override
  void initState() {
    super.initState();
    final dio = Dio(BaseOptions(headers: {
      'Accept': 'application/json',
      // 'X-CSRFToken': 'KzT1izmGsah6Fh3sec9Yf3rEQunIDItv9BH9QlQtpNbSmXg67xsmCk2Z1kWuLbwm',
    }));
    lessonApi = LessonApi(dio);
    fetchLessons();
  }

  
  Future<List<Lesson>> fetchLessons() async {
    try {
      print('fetching lessons...');
      final lessons = await lessonApi.getLessons();
      print('Fetched lessons: $lessons'); 
      return [];
    } on DioException catch (e) {
      print('Error fetching lessons: ${e.response?.data}'); 
      rethrow;
    } on Exception 
    catch (e) {
      print('Error fetching lessons: $e'); 
      rethrow;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lessons')),
      body: lessons.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(lessons[index].title),
                  subtitle: Text(lessons[index].id),
                );
              },
            ),
    );
  }
}
