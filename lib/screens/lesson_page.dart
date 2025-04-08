import 'package:dio/dio.dart';
import 'package:edu_project/habit/lesson/dio.dart';
import 'package:flutter/material.dart';
import 'package:edu_project/habit/lesson/lesson.dart';
import 'package:edu_project/habit/lesson/lesson_api.dart';

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
    // Используем синглтон DioClient, созданный ранее:
    final dio = DioClient().dio;
    lessonApi = LessonApi(dio);
    fetchLessons();
  }

  Future<void> fetchLessons() async {
    try {
      print('fetching lessons...');
      final fetchedLessons = await lessonApi.getLessons();
      print('Fetched lessons: $fetchedLessons');
      setState(() {
        lessons = fetchedLessons;
      });
    } on DioException catch (e) {
      print('❌ Dio error message: ${e.message}');
      print('❌ Dio error type: ${e.type}');
      print('❌ Dio error response: ${e.response}');
      print('❌ Dio error request: ${e.requestOptions.uri}');
      rethrow;
    } on Exception catch (e) {
      print('❌ Error fetching lessons: $e');
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
