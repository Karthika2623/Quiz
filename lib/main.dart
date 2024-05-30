import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain= QuizBrain();

void main() => runApp(Quizpage());

class Quizpage extends StatelessWidget {
  const Quizpage({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,backgroundColor: Colors.blue,
          title: Text('Quiz Page'),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Page(),
          ),
        ),
      ),
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}
class _PageState extends State<Page> {
  List<Icon> ScoreKeeper =[];
  void checkAnswer(bool pickedAnswer){
    bool crtans= quizBrain.getCorrectAnswer();
    if(pickedAnswer==crtans){
      ScoreKeeper.add(Icon(Icons.check,color: Colors.green,));
    }
    else{
      ScoreKeeper.add(Icon(Icons.close,color: Colors.red,));
    }
    setState(() {
      quizBrain.nextQuestion();
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget> [
        Expanded(
          flex: 6,
          child: Padding(
              padding: EdgeInsets.all(30),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,fontSize: 35.0,fontWeight: FontWeight.bold),
                ),
              )
          ),),
        Expanded(
          child: Padding(padding: EdgeInsets.all(20.0),
            child: ElevatedButton(onPressed: (){
              checkAnswer(true);
            },
              style: ElevatedButton.styleFrom( backgroundColor: Colors.green),
              child: Text('True',style: TextStyle(fontSize: 20.0),),
            ),
          ),
        ),
        Expanded(
          child: Padding(padding: EdgeInsets.all(20.0),
            child: ElevatedButton(onPressed: (){
              checkAnswer(false);
            },
              style: ElevatedButton.styleFrom( backgroundColor: Colors.red),
              child: Text('False',style: TextStyle(fontSize: 20.0)),
            ),
          ),
        ),
        Row(
          children: ScoreKeeper,
        ),
      ],
    );
  }
}