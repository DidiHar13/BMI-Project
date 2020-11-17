import 'package:bmi/BMIModel.dart';
import 'package:bmi/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
//  variable
  double _heightofuser = 100.0;
  double _weightofuser = 40.0;
  double _bmi = 0;

  BMIModel _bmiModel;
  // -----
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 200,
                  height: 200,
                  child: SvgPicture.asset(
                    "assets/images/heart.svg",
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                height: 16,
              ),
              Text(
                "BMI Calculator",
                style: TextStyle(
                    color: Colors.red[600],
                    fontSize: 34,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "We care about your health",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "Tinggi (CM)",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 80.0,
                  max: 250.0,
                  onChanged: (height) {
                    setState(() {
                      _heightofuser = height;
                    });
                  },
                  value: _heightofuser,
                  divisions: 100,
                  activeColor: Colors.pink,
                  label: "$_heightofuser",
                ),
              ),
              Text(
                "$_heightofuser cm",
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 24,
              ),
              // KG
              Text(
                "Berat (KG)",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 30.0,
                  max: 120.0,
                  onChanged: (height) {
                    setState(() {
                      _weightofuser = height;
                    });
                  },
                  value: _weightofuser,
                  divisions: 100,
                  activeColor: Colors.pink,
                  label: "$_weightofuser",
                ),
              ),
              Text(
                "$_weightofuser kg",
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                child: FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      _bmi = _weightofuser /
                          ((_heightofuser / 100) * (_heightofuser / 100));
                      if (_bmi >= 18.5 && _bmi <= 25) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: true,
                            comments: "Anda Sangat Bugar");
                      } else if (_bmi < 18.5) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: "Anda memiliki berat badan yang kurang");
                      } else if (_bmi > 25 && _bmi <= 30) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: "Anda kelebihan berat badan");
                      } else {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: "Anda obesitas");
                      }
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(
                                  bmiModel: _bmiModel,
                                )));
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  label: Text("Calculate"),
                  textColor: Colors.white,
                  color: Colors.pink,
                ),
                width: double.infinity,
                padding: EdgeInsets.only(right: 16, left: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
