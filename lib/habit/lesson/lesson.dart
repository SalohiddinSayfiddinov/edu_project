import 'package:json_annotation/json_annotation.dart';

part 'lesson.g.dart';

@JsonSerializable()
class Lesson {
  final String id;
  final String title;

  Lesson({
    required this.id,
    required this.title,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    print('Parsing lesson from JSON: $json');  
    return _$LessonFromJson(json);
  }

  Map<String, dynamic> toJson() {
    print('Converting lesson to JSON: $this');  
    return _$LessonToJson(this);
  }
}
