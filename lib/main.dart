import 'package:flutter/material.dart';
import 'package:quizzler/QuizManager.dart';

QuizManager currentQuiz = QuizManager();

void main() {
  runApp(const QuizzlerApp());
}

class QuizzlerApp extends StatelessWidget {
  const QuizzlerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzler',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Quizzler'),
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.black,
          body: const QuizzlerStatefulApp(),
        ),
      ),
    );
  }
}

class QuizzlerStatefulApp extends StatefulWidget {
  const QuizzlerStatefulApp({Key? key}) : super(key: key);

  @override
  State<QuizzlerStatefulApp> createState() => _QuizzlerStatefulAppState();
}

class _QuizzlerStatefulAppState extends State<QuizzlerStatefulApp> {
  List<Icon> scoreRowIcons = [];

  String questionStatement = '';

  Icon createIconResult(bool rightAnswer) {
    IconData icon;
    Color color;
    if (rightAnswer) {
      icon = Icons.check;
      color = Colors.green;
    } else {
      icon = Icons.close;
      color = Colors.red;
    }
    return Icon(
      icon,
      color: color,
    );
  }

  @override
  void initState() {
    questionStatement = currentQuiz.statementOfCurrentQuestion;
    super.initState();
  }

  void tryAnswer(bool answer) {
    if (!currentQuiz.isQuizFinished) {
      setState(() {
        //Check if the answer was correct:
        currentQuiz.answerCurrentQuestion(answer);
        if (currentQuiz.lastResult!) {
          scoreRowIcons.add(createIconResult(true));
        } else {
          scoreRowIcons.add(createIconResult(false));
        }

        //Update the question statement
        questionStatement = currentQuiz.statementOfCurrentQuestion;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text(
              questionStatement,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            tryAnswer(true);
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: const Size(0, 80),
          ),
          child: const Text(
            'True',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: () {
            tryAnswer(false);
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.red,
            minimumSize: const Size(0, 80),
          ),
          child: const Text(
            'False',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: scoreRowIcons,
        ),
      ],
    );
  }
}
