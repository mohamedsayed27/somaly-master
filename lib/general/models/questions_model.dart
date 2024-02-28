import 'package:json_annotation/json_annotation.dart';

part 'questions_model.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class QuestionsModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'question')
  String? question;
  @JsonKey(name: 'questionEn')
  String? questionEn;
  @JsonKey(name: 'answer')
  String? answer;
  @JsonKey(name: 'answerEn')
  String? answerEn;

  QuestionsModel(
      {this.id, this.question, this.questionEn, this.answer, this.answerEn});

  factory QuestionsModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsModelToJson(this);
}
