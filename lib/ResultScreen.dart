import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;

  ResultScreen({this.bmiModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              child: bmiModel.isNormal
                  ? SvgPicture.asset(
                      "assets/images/happy.svg",
                      fit: BoxFit.contain,
                    )
                  : SvgPicture.asset(
                      "assets/images/sad.svg",
                      fit: BoxFit.contain,
                    ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "BMI Anda adalah ${bmiModel.bmi.round()}",
              style: TextStyle(
                  color: Colors.red[600],
                  fontSize: 34,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "${bmiModel.comments}",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 16,
            ),
            bmiModel.isNormal
                ? Text(
                    "Horeee! BMI Anda Normal",
                    style: TextStyle(
                        color: Colors.red[600],
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  )
                : Text(
                    "Hmmm! BMI Anda Tidak Normal",
                    style: TextStyle(
                        color: Colors.red[600],
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
            SizedBox(
              height: 16,
            ),
            Container(
              child: FlatButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                label: Text("Ayo Hitung lagi!"),
                textColor: Colors.white,
                color: Colors.pink,
              ),
              width: double.infinity,
              padding: EdgeInsets.only(right: 16, left: 16),
            )
          ],
        ),
      ),
    );
  }
}
