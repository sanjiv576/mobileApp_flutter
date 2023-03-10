import 'package:flutter/material.dart';
// import 'package:quizzer_flutter/question.dart';
import 'package:quizzer_flutter/quiz_brain.dart';
// alert
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: DicePage(),
        ),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  // const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // assigned questionNumber in quiz_brain dart file
  // int questionNumber = 0;

  List<Icon> scoreKeeper = [];
  // old technique
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];

  // List<bool> answers = [false, true, true];
  // Question q3 = Question(question: 'A slug\'s blood is green.', answer: true);

// using class and object technique and now these are abstracted
  // List<Question> questionBank = [
  //   Question(
  //       question: 'You can lead a cow down stairs but not up stairs.',
  //       answer: false),
  //   Question(
  //       question: 'Approximately one quarter of human bones are in the feet.',
  //       answer: true),
  //   Question(question: 'A slug\'s blood is green.', answer: true)
  // ];

  QuizBrain quizBrain = QuizBrain();

  void checkUserAnswer(bool userAnswer) {
    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
                context: context,
                title: "Finished!",
                desc: "You've reached the end of the quiz.")
            .show();

        //  reset
        quizBrain.reset();
        // clear the scorekeeper
        scoreKeeper = [];
      } else {
        // this can be changed so needs encapsulation
        // quizBrain.questionBank[questionNumber].answer = true;
        if (userAnswer == quizBrain.getAnswer()) {
          scoreKeeper.add(
            Icon(Icons.check, color: Colors.green),
          );
        } else {
          scoreKeeper.add(
            Icon(Icons.close, color: Colors.red),
          );
        }
        // show next question
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              '${quizBrain.getQuestionText()}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                checkUserAnswer(true);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text(
                'True',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                checkUserAnswer(false);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'False',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: scoreKeeper,
          ),
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
