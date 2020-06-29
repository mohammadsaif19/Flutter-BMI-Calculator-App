import 'package:flutter/material.dart';
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }
  
}

class BmiState extends State<Home>{
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double inches = 0.0;
  double results = 0.0;
  String _resultsReading ="";

  String _finalResults ="";

  void _calculateBMI(){
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      inches = height*12;
      double weight = double.parse(_weightController.text);

      if((_ageController.text.isNotEmpty || age > 0) && (_heightController.text.isNotEmpty || inches > 0) &&
          (_weightController.text.isNotEmpty || weight > 0) ){
        results =  weight / (inches * inches) * 703;

        if(double.parse(results.toStringAsFixed(1)) <18.5) {
          _resultsReading = "UnderWeight";
          print(_resultsReading);
        }
        else if (double.parse(results.toStringAsFixed(1)) >= 18.5 && results < 25) {
          _resultsReading = "Great Shape :)";
          print(_resultsReading);
        }

        else if (double.parse(results.toStringAsFixed(1)) >= 25.0 && results < 30) {
          _resultsReading = "Overweight :(";
          print(_resultsReading);
        }

        else if (double.parse(results.toStringAsFixed(1)) >= 30.0) {
          _resultsReading = "Obese :(";
          print(_resultsReading);
        }






      }else{
        results = 0.0;
      }

    });
    _finalResults = "Your BMI: ${results.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,

      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('images/logo.png',
              height: 85.0,
              width: 75.0,),

            new Container(
              margin: const EdgeInsets.all(3.0),



              height: 245.0,
              width: 290.0,
              color: Colors.grey.shade300,

              child: new Column(
                children: <Widget>[
                  new TextField(
                   controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Age:",
                      hintText: "e.g: 18",

                      icon: new Icon(Icons.person_outline)
                    ),
                  ),

                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Height in feet:",
                        hintText: "e.g: 5.8",

                        icon: new Icon(Icons.insert_chart)
                    ),
                  ),

                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Weight in lbs:",
                        hintText: "e.g: 150",

                        icon: new Icon(Icons.line_weight)
                    ),
                  ),

                  new Padding(padding: new EdgeInsets.all(10.6)),
                //calculate button
              new Container(
                alignment: Alignment.center,
                child: new RaisedButton(
                  onPressed: _calculateBMI,
                  color: Colors.pinkAccent,
                  child: new Text("Calculate"),
                  textColor: Colors.white,

                ),

            )


                ],
              ),


            ),

              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("$_finalResults",
                  style: new TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    fontSize: 19.9,
                  ),),

                  new Padding(padding: new EdgeInsets.all(5.0)),
                  new Text("Your Lavel: $_resultsReading",
                  style: new TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic
                  ),)
                ],
              )
          ],
        ),
      ),
    );
  }
}
