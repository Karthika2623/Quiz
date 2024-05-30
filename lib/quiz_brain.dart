import 'question.dart';
class QuizBrain {

  int _questionNumber=0;

  final List<Question> _questionBank =[
    Question(q:  ' Is Flutter for Web and Desktop available in stable version?', a: true),
    Question(q: 'Nine players are there in one Baseball team' , a: false),
    Question(q:  'In the year 1816 was the camera invented' , a: false),
  ];
  void nextQuestion(){
    if(_questionNumber < _questionBank.length-1){
      _questionNumber++;
    }
  }

  String getQuestionText (){
    return _questionBank[_questionNumber].questionText;
  }
  bool getCorrectAnswer (){
    return _questionBank[_questionNumber].questionAnswer;
  }

}