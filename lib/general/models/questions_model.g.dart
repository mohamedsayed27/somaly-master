// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionsModel _$QuestionsModelFromJson(Map<String, dynamic> json) =>
    QuestionsModel(
      id: json['id'] as int?,
      question: json['question'] as String?,
      questionEn: json['questionEn'] as String?,
      answer: json['answer'] as String?,
      answerEn: json['answerEn'] as String?,
    );

Map<String, dynamic> _$QuestionsModelToJson(QuestionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'questionEn': instance.questionEn,
      'answer': instance.answer,
      'answerEn': instance.answerEn,
    };
