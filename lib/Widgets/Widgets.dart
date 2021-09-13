import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_verification/Screens/VerificationScreen/verification_screen.dart';

class Button extends StatelessWidget {
  const Button({
    Key key, this.label, this.iconData,
  }) : super(key: key);

  final String label;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VerifyOtpScreen()));
      },
      elevation: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  iconData,
                  size: 15,
                )),
          )
        ],
      ),
    );
  }
}

BoxShadow buildBoxShadow() {
  return BoxShadow(
    offset: Offset(2, 5),
    blurRadius: 15,
    spreadRadius: 0,
    color: Colors.grey..withOpacity(0.1),
  );
}