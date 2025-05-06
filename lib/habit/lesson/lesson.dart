import 'package:json_annotation/json_annotation.dart';

part 'lesson.g.dart';

@JsonSerializable()
class Lesson {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String title;
  final String? video;
  final String description;
  final bool isPremium;
  final int duration;
  final String? createdBy; 
  final String? updatedBy;
  final String? chapter;
  Lesson(
    this.createdAt,
    this.updatedAt,
    this.video,
    this.description,
    this.isPremium,
    this.duration,
    this.createdBy,
    this.updatedBy,
    this.chapter, {
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
