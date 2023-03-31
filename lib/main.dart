import 'package:flutter/material.dart';

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

class _question {
  _question({
    required this.statement,
    required this.answer,
  });
  String statement;
  bool answer;
}

class _QuizzlerStatefulAppState extends State<QuizzlerStatefulApp> {
  int currentQuestionIndex = 0;
  List<Icon> scoreKeeper = [];
  final List<_question> questions = [
    _question(
      statement: 'The sky is blue.',
      answer: true,
    ),
    _question(
      statement: 'The capital of Brazil is Brasília.',
      answer: true,
    ),
    _question(
      statement: 'The largest bone in the human body is the femur.',
      answer: true,
    ),
    _question(
      statement: 'The sun is a planet.',
      answer: false,
    ),
    _question(
      statement: 'The Nile is the longest river in the world.',
      answer: true,
    ),
    _question(
      statement:
          'Albert Einstein won the Nobel Prize for his theory of relativity.',
      answer: false,
    ),
    _question(
      statement: 'Shakespeare wrote Hamlet.',
      answer: true,
    ),
    _question(
      statement: 'Dogs can see colors.',
      answer: false,
    ),
    _question(
      statement: 'Venus is the hottest planet in the solar system.',
      answer: true,
    ),
    _question(
      statement: 'The Great Wall of China can be seen from space.',
      answer: false,
    ),
    _question(
      statement: 'The smallest country in the world is Vatican City.',
      answer: true,
    ),
  ];

  String questionStatement = '';
  bool finishedGame = false;

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
    questionStatement = questions[currentQuestionIndex].statement;
    super.initState();
  }

  void tryAnswer(bool answer) {
    if (!finishedGame) {
      setState(() {
        //Check if the answer was correct:
        if (questions[currentQuestionIndex++].answer == answer) {
          scoreKeeper.add(createIconResult(true));
        } else {
          scoreKeeper.add(createIconResult(false));
        }

        //Update the question statement
        if (currentQuestionIndex >= questions.length) {
          finishedGame = true;
          questionStatement = 'GAME FINISHED';
        } else {
          questionStatement = questions[currentQuestionIndex].statement;
        }
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
          children: scoreKeeper,
        ),
      ],
    );
  }
}
