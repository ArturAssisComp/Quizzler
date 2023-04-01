import 'package:quizzler/Question.dart';

class QuizManager {
  final List<Question> _questions = [
    Question(
      statement: 'The sky is blue.',
      answer: true,
    ),
    Question(
      statement: 'The capital of Brazil is Brasília.',
      answer: true,
    ),
    Question(
      statement: 'The largest bone in the human body is the femur.',
      answer: true,
    ),
    Question(
      statement: 'The sun is a planet.',
      answer: false,
    ),
    Question(
      statement: 'The Nile is the longest river in the world.',
      answer: true,
    ),
    Question(
      statement:
          'Albert Einstein won the Nobel Prize for his theory of relativity.',
      answer: false,
    ),
    Question(
      statement: 'Shakespeare wrote Hamlet.',
      answer: true,
    ),
    Question(
      statement: 'Dogs can see colors.',
      answer: false,
    ),
    Question(
      statement: 'Venus is the hottest planet in the solar system.',
      answer: true,
    ),
    Question(
      statement: 'The Great Wall of China can be seen from space.',
      answer: false,
    ),
    Question(
      statement: 'The smallest country in the world is Vatican City.',
      answer: true,
    ),
  ];

  int _questionIndex = 0;
  bool _finishedQuiz = false;
  int _totalScore = 0;
  bool? _lastResult;

  //Getters:
  bool get isQuizFinished => _finishedQuiz;
  bool? get lastResult => _lastResult;
  int get totalScore => _totalScore;
  int get maxScore => _questions.length;
  String get statementOfCurrentQuestion =>
      _finishedQuiz ? 'QUIZ FINISHED' : _questions[_questionIndex].statement;

  //Methods:
  void reset() {
    _questionIndex = 0;
    _finishedQuiz = false;
    _totalScore = 0;
    _lastResult = null;
  }

  Question? getCurrentQuestion() =>
      _finishedQuiz ? null : _questions[_questionIndex];

  bool answerCurrentQuestion(bool answer) {
    if (_questionIndex >= _questions.length) return false;

    _lastResult = _questions[_questionIndex++].answer == answer;

    //Check if the quiz finished:
    if (_questionIndex >= _questions.length) _finishedQuiz = true;

    //Update total score:
    if (_lastResult ?? false) {
      _totalScore++;
    }

    return true;
  }
}
