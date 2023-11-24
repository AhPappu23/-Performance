import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Portfolio App'),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Amir Hossen Pappu',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Skills:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SkillWidget(skill: 'HTML', percentage: 100),
            SkillWidget(skill: 'CSS', percentage: 80),
            SkillWidget(skill: 'Javascript', percentage: 65),
            SkillWidget(skill: 'Flutter', percentage: 60),
            SkillWidget(skill: 'Java', percentage: 50),
            SizedBox(height: 20),
            Text(
              'Education:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            EducationWidget(
              title: 'SSC:',
              institution: 'Satrajitpur High School',
              duration: '2012 to 2017',
              grade: 'GPA: 5.00',
            ),
            EducationWidget(
              title: 'HSC:',
              institution: 'Shamukhdum College',
              duration: '2017 to 2019',
              grade: 'GPA: 5.00',
            ),
            EducationWidget(
              title: 'B.Sc.:',
              institution: 'Daffodil International University',
              duration: '2020 to 2023',
              grade: 'CGPA: 3.20',
            ),
          ],
        ),
      ),
    );
  }
}

class SkillWidget extends StatelessWidget {
  final String skill;
  final int percentage;

  SkillWidget({required this.skill, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(skill),
        LinearProgressIndicator(
          value: percentage / 100,
          backgroundColor: Colors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class EducationWidget extends StatelessWidget {
  final String title;
  final String institution;
  final String duration;
  final String grade;

  EducationWidget({
    required this.title,
    required this.institution,
    required this.duration,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Text(institution),
        Text(duration),
        Text(grade),
        SizedBox(height: 10),
      ],
    );
  }
}




class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('portfolio/image/profile.jpg'), // Adjust the path accordingly
                ),
                SizedBox(height: 10),
                Text(
                  'Amir Hossein Pappu',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Contact Info'),
            onTap: () {
              // Handle tap on Contact Info
              // You can navigate to a new page or perform other actions
            },
          ),
          ListTile(
            title: Text('My Apps'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyAppsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}


class MyAppsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Apps'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculatorApp()),
                );
              },
              child: Text('Basic Calculator'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizApp()),
                );
              },
              child: Text('Quiz App'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeatherApp()),
                );
              },
              child: Text('Weather App'),
            ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Home'),
                ),
          ],
        ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int currentQuestionIndex = 0;
  List<List<String>> questions = [
    ['What is the capital of Bangladesh?', 'Rajshahi', 'Rangpur', 'Dhaka', 'Khulna', 'Dhaka'],
    ['Which Country is our Neighbor Country?', 'Pakistan', 'India', 'Sri Lanka', 'Bhutan', 'India'],
    ['Who is our first Prime Minister?', 'Sekh Mujibur Rahman', 'Ziaur Rahman', 'Sekh Hasina', 'Taz Uddin Ahmed', 'Taz Uddin Ahmed'],
  ];
  String selectedAnswer = '';
  int totalMarks = 0;

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1}: ${questions[currentQuestionIndex][0]}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Column(
              children: List.generate(
                4,
                (index) => ListTile(
                  title: Text(questions[currentQuestionIndex][index + 1]),
                  leading: Radio(
                    value: questions[currentQuestionIndex][index + 1],
                    groupValue: selectedAnswer,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswer = value as String;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Check if an answer is selected before moving to the next question
                    if (selectedAnswer.isNotEmpty) {
                      checkAnswer();
                      setState(() {
                        selectedAnswer = '';
                        if (currentQuestionIndex < questions.length - 1) {
                          // Move to the next question
                          currentQuestionIndex++;
                        } else {
                          // Show the result or perform other actions
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Quiz Result'),
                                content: Container(
                                  height: 120, // Adjust the height as needed
                                  child: Column(
                                    children: [
                                      Text('You have completed the quiz!'),
                                      SizedBox(height: 10),
                                      Text('Total Marks: $totalMarks'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      // Reset quiz state if needed
                                      setState(() {
                                        currentQuestionIndex = 0;
                                        totalMarks = 0;
                                      });
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      });
                    } else {
                      // Show a message or perform any action when no answer is selected
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Alert'),
                            content: Text('Please select an answer before proceeding.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text('Next'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Home'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void checkAnswer() {
    if (selectedAnswer == questions[currentQuestionIndex][5]) {
      // Correct answer
      totalMarks += 5;
    }
  }
}


class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You can replace this with actual weather data
    String weatherCondition = 'Sunny';
    String temperature = '28°C';

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Today\'s Weather in Dhaka',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Condition: $weatherCondition',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Temperature: $temperature',
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Home'),
                ),
          ],
        ),
      ),
    );
  }
}


class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Calculator'),
      ),
      body: CalculatorBody(),
    );
  }
}

class CalculatorBody extends StatefulWidget {
  @override
  _CalculatorBodyState createState() => _CalculatorBodyState();
}

class _CalculatorBodyState extends State<CalculatorBody> {
  String result = '';
  String operand = '';
  double num1 = 0.0;
  double num2 = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromARGB(255, 165, 202, 18),
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 100,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Color.fromARGB(255, 215, 124, 223)!),
            ),
            child: Text(
              result,
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildButton('0'),
              buildButton('.'),
              buildButton('='),
              buildButton('+'),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                result = '';
                operand = '';
                num1 = 0.0;
                num2 = 0.0;
              });
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            child: Text('Clear'),
          ),
          ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Home'),
                ),
        ],
      ),
    );
  }

  Widget buildButton(String text) {
    return ElevatedButton(
      onPressed: () {
        onButtonPressed(text);
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  void onButtonPressed(String buttonText) {
    if (buttonText == 'C') {
      clear();
    } else if (buttonText == '=') {
      calculate();
    } else {
      updateResult(buttonText);
    }
  }

  void clear() {
    setState(() {
      result = '';
      operand = '';
      num1 = 0.0;
      num2 = 0.0;
    });
  }

  void calculate() {
    if (operand.isNotEmpty) {
      num2 = double.parse(result);
      double output = performOperation(num1, num2, operand);
      setState(() {
        result = output.toString();
        operand = '';
        num1 = output;
        num2 = 0.0;
      });
    }
  }

  void updateResult(String buttonText) {
    setState(() {
      if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
        if (operand.isNotEmpty) {
          calculate();
        }
        operand = buttonText;
        num1 = double.parse(result);
        result = '';
      } else {
        result += buttonText;
      }
    });
  }

  double performOperation(double num1, double num2, String operand) {
    switch (operand) {
      case '+':
        return num1 + num2;
      case '-':
        return num1 - num2;
      case '*':
        return num1 * num2;
      case '/':
        return num1 / num2;
      default:
        return 0.0;
    }
  }
}

void showWeatherDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Weather App'),
        content: Text('Today\'s weather in Dhaka: Sunny'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
