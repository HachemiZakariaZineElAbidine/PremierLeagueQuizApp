import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.stop,
            //color: Colors.grey[900],
          ),
          title: Text(
            'Premier League Quiz',
            style: TextStyle(
              color: Colors.grey[900],
              fontWeight: FontWeight.bold,
              fontSize: 23,
              fontFamily: 'Carter',
            ),
          ),
          backgroundColor: Colors.grey[50],
          centerTitle: true,
          toolbarOpacity: 0,
          elevation: 0,
        ),
        backgroundColor: Colors.grey[50],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  List<Icon> resultat = [];
  List<String> question = [
    'Blackburn Rovers Won the 1st Premier League Title',
    'Alan Shearer Is the Competition\'s Top Scorer',
    'Eric Cantona Scored the 1st Hat-Trick in League History',
    'Xabi Alonso Scored the Longest Goal in League History',
    'Steven Gerrard Made More Appearances Than Frank Lampard',
    'Thierry Henry Joined Arsenal From Monaco in 1999',
    'Kevin Philips Was the 1st Premier League Player to Win the European Golden Shoe',
    'Wayne Rooney is the Competition\'s Youngest Ever Goalscorer',
    'Roman Abramovich Bought Chelsea in 2004',
    'There Have Been 10 Different Players Who Won the Premier League With 2 Different Clubs',
  ];
  List<bool> answers = [
    false,
    true,
    true,
    false,
    false,
    false,
    true,
    false,
    false,
    true,
  ];

  int i = 0;

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                question[i],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                  fontFamily: 'Carter',
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                if (i < 9) {
                  if (answers[i] == true) {
                    resultat.add(
                      Icon(
                        Icons.check,
                        color: Colors.green[900],
                      ),
                    );
                  } else {
                    resultat.add(
                      Icon(
                        Icons.close,
                        color: Colors.red[900],
                      ),
                    );
                  }

                  i++;
                }
              });
            },
            color: Colors.green[600],
            child: Text(
              "True",
              style: TextStyle(
                color: Colors.grey[50],
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Carter',
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(15, 2, 15, 5),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                if (i < 9) {
                  if (answers[i] == false) {
                    resultat.add(
                      Icon(
                        Icons.check,
                        color: Colors.green[900],
                      ),
                    );
                  } else {
                    resultat.add(
                      Icon(
                        Icons.close,
                        color: Colors.red[900],
                      ),
                    );
                  }

                  i++;
                }
              });
            },
            color: Colors.red[600],
            child: Text(
              "False",
              style: TextStyle(
                color: Colors.grey[50],
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Carter',
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Container(
            child: Column(
              children: [
                Text(
                  'Results : ',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Carter',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: resultat,
                  ),
                )
              ],
            ),
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
