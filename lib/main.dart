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

class _QuizzlerStatefulAppState extends State<QuizzlerStatefulApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Expanded(
          child: Center(
            child: Text(
              'This is where the question text will go.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
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
          onPressed: () {},
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
      ],
    );
  }
}
