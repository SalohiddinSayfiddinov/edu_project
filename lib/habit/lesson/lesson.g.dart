// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      DateTime.parse(json['createdAt'] as String),
      DateTime.parse(json['updatedAt'] as String),
      json['video'] as String?,
      json['description'] as String,
      json['isPremium'] as bool,
      (json['duration'] as num).toInt(),
      json['createdBy'] as String?,
      json['updatedBy'] as String?,
      json['chapter'] as String?,
      id: json['id'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'title': instance.title,
      'video': instance.video,
      'description': instance.description,
      'isPremium': instance.isPremium,
      'duration': instance.duration,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'chapter': instance.chapter,
    };
