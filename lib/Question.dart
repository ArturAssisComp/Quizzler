class Question {
  Question({
    required statement,
    required answer,
  }) {
    _statement = statement;
    _answer = answer;
  }
  late final String _statement;
  late final bool _answer;
  String get statement => _statement;
  bool get answer => _answer;
}
