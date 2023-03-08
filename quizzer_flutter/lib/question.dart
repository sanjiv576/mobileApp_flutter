class Question {
  String? question;
  bool? answer;
  // use Null Safety technique in Constructor
  Question({String? question, bool? answer}) {
    this.question = question!;
    this.answer = answer!;
  }
}
