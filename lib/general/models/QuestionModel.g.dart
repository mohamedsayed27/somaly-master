// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuestionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      question: json['question'] as String,
      answer: json['answer'] as String,
      closed: json['closed'] as bool? ?? true,
    )
      ..questionEn = json['questionEn'] as String?
      ..answerEn = json['answerEn'] as String?;

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
      'questionEn': instance.questionEn,
      'answerEn': instance.answerEn,
      'closed': instance.closed,
    };
