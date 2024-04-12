import 'package:xammaths/userpages/revision.dart';

class Flashcards {
  final String question;
  final String answer;
  final String image;
  FlashcardStatus status;

  Flashcards({
    required this.question,
    required this.answer,
    required this.image,
    this.status = FlashcardStatus.toLearn,
  });

  factory Flashcards.fromJson(Map<String, dynamic> json) {
    return Flashcards(
      question: json['question'] as String,
      answer: json['answer'] as String,
      image: json['image'] as String,
    );
  }
}