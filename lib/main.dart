// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.amber,
//         scaffoldBackgroundColor: Colors.white,
//         colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
//       ),
//       darkTheme: ThemeData.dark().copyWith(
//         primaryColor: Colors.blue,
//         scaffoldBackgroundColor: Colors.black,
//         colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
//       ),
//       home: HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('images/aa.jpg'), // Replace with your image asset
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   'Welcome to Quiz App',
//                   style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => QuizSelectionScreen(),
//                       ),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(primary: Theme.of(context).colorScheme.secondary),
//                   child: Text('Start a Quiz', style: TextStyle(color: Colors.white)),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class QuizSelectionScreen extends StatelessWidget {
//   final List<String> quizzes = ['Tech Quiz', 'General Quiz'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         title: Text('Quiz Selection'),
//       ),
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('images/aa.jpg'), // Replace with your image asset
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Container(
//             color: Colors.black.withOpacity(0.6), // Add a semi-transparent background color
//             child: ListView.builder(
//               itemCount: quizzes.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   elevation: 3,
//                   margin: EdgeInsets.all(8),
//                   child: ListTile(
//                     title: Text(quizzes[index]),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => QuizQuestionsScreen(quizName: quizzes[index]),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
// class QuizQuestionsScreen extends StatefulWidget {
//   final String quizName;
//
//   QuizQuestionsScreen({required this.quizName});
//
//   @override
//   _QuizQuestionsScreenState createState() => _QuizQuestionsScreenState();
// }
//
// class _QuizQuestionsScreenState extends State<QuizQuestionsScreen> {
//   int currentQuestion = 0;
//   int score = 0;
//   List<Map<String, dynamic>> questions = [];
//
//   @override
//   void initState() {
//     if (widget.quizName == 'Tech Quiz') {
//       questions = [
//         {
//           'question': 'What is Flutter?',
//           'options': ['A framework', 'A fruit', 'A bird'],
//           'correctIndex': 0,
//         },
//         {
//           'question': 'What programming language is Flutter based on?',
//           'options': ['Dart', 'Java', 'C++'],
//           'correctIndex': 0,
//         },
//       ];
//     } else if (widget.quizName == 'General Quiz') {
//       questions = [
//         {
//           'question': 'What is the capital of the USA?',
//           'options': ['New York', 'Washington D.C.', 'Los Angeles'],
//           'correctIndex': 1,
//         },
//         {
//           'question': 'Which planet is known as the Red Planet?',
//           'options': ['Mars', 'Jupiter', 'Venus'],
//           'correctIndex': 0,
//         },
//       ];
//     }
//     super.initState();
//   }
//
//   void answerQuestion(int selectedOption) {
//     int correctOption = questions[currentQuestion]['correctIndex'];
//     bool isCorrect = selectedOption == correctOption;
//
//     setState(() {
//       if (isCorrect) {
//         score++;
//       }
//       if (currentQuestion < questions.length - 1) {
//         currentQuestion++;
//       } else {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ResultScreen(widget.quizName, score, questions),
//           ),
//         );
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         title: Text(widget.quizName),
//       ),
//       body: QuizWidget(
//         question: questions[currentQuestion]['question'],
//         options: questions[currentQuestion]['options'],
//         answerQuestion: answerQuestion,
//       ),
//     );
//   }
// }
//
// class QuizWidget extends StatelessWidget {
//   final String question;
//   final List<String> options;
//   final Function(int) answerQuestion;
//
//   QuizWidget({required this.question, required this.options, required this.answerQuestion});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Card(
//             elevation: 3,
//             margin: EdgeInsets.only(bottom: 16),
//             child: ListTile(
//               title: Text(
//                 question,
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           ...options.asMap().entries.map((entry) {
//             int index = entry.key;
//             String option = entry.value;
//             return ElevatedButton(
//               onPressed: () {
//                 answerQuestion(index);
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Theme.of(context).colorScheme.secondary,
//                 padding: EdgeInsets.all(16),
//               ),
//               child: Text(
//                 option,
//                 style: TextStyle(fontSize: 16, color: Colors.white),
//               ),
//             );
//           }).toList(),
//         ],
//       ),
//     );
//   }
// }
//
// class ResultScreen extends StatelessWidget {
//   final String quizName;
//   final int score;
//   final List<Map<String, dynamic>> questions;
//
//   ResultScreen(this.quizName, this.score, this.questions);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Quiz Results'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Quiz: $quizName',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               'Your Score: $score/${questions.length}',
//               style: TextStyle(fontSize: 20),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.popUntil(context, (route) => route.isFirst);
//               },
//               style: ElevatedButton.styleFrom(primary: Theme.of(context).colorScheme.secondary),
//               child: Text('Back to Home', style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/aa.jpg'), // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome to Quiz App',
                  style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizSelectionScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(primary: Theme.of(context).colorScheme.secondary),
                  child: Text('Start a Quiz', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuizSelectionScreen extends StatelessWidget {
  final List<String> quizzes = ['Tech Quiz', 'General Quiz'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Quiz Selection'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/aa.jpg'), // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.6), // Add a semi-transparent background color
            child: ListView.builder(
              itemCount: quizzes.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(quizzes[index]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizQuestionsScreen(quizName: quizzes[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class QuizQuestionsScreen extends StatefulWidget {
  final String quizName;

  QuizQuestionsScreen({required this.quizName});

  @override
  _QuizQuestionsScreenState createState() => _QuizQuestionsScreenState();
}

class _QuizQuestionsScreenState extends State<QuizQuestionsScreen> {
  int currentQuestion = 0;
  int score = 0;
  List<Map<String, dynamic>> questions = [];

  @override
  void initState() {
    if (widget.quizName == 'Tech Quiz') {
      questions = [
        {
          'question': 'What is Flutter?',
          'options': ['A framework', 'A fruit', 'A bird'],
          'correctIndex': 0,
        },
        {
          'question': 'What programming language is Flutter based on?',
          'options': ['Dart', 'Java', 'C++'],
          'correctIndex': 0,
        },
      ];
    } else if (widget.quizName == 'General Quiz') {
      questions = [
        {
          'question': 'What is the capital of the USA?',
          'options': ['New York', 'Washington D.C.', 'Los Angeles'],
          'correctIndex': 1,
        },
        {
          'question': 'Which planet is known as the Red Planet?',
          'options': ['Mars', 'Jupiter', 'Venus'],
          'correctIndex': 0,
        },
      ];
    }
    super.initState();
  }

  void answerQuestion(int selectedOption) {
    int correctOption = questions[currentQuestion]['correctIndex'];
    bool isCorrect = selectedOption == correctOption;

    setState(() {
      if (isCorrect) {
        score++;
      }
      if (currentQuestion < questions.length - 1) {
        currentQuestion++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(widget.quizName, score, questions),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(widget.quizName),
      ),
      body: QuizWidget(
        question: questions[currentQuestion]['question'],
        options: questions[currentQuestion]['options'],
        answerQuestion: answerQuestion,
      ),
    );
  }
}

class QuizWidget extends StatelessWidget {
  final String question;
  final List<String> options;
  final Function(int) answerQuestion;

  QuizWidget({required this.question, required this.options, required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            elevation: 3,
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              title: Text(
                question,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ...options.asMap().entries.map((entry) {
            int index = entry.key;
            String option = entry.value;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0), // Add vertical padding
              child: ElevatedButton(
                onPressed: () {
                  answerQuestion(index);
                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.secondary,
                  padding: EdgeInsets.all(16),
                ),
                child: Text(
                  option,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final String quizName;
  final int score;
  final List<Map<String, dynamic>> questions;

  ResultScreen(this.quizName, this.score, this.questions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Quiz Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Quiz: $quizName',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              'Your Score: $score/${questions.length}',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(primary: Theme.of(context).colorScheme.secondary),
              child: Text('Back to Home', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
