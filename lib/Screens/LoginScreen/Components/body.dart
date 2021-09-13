import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_verification/Screens/VerificationScreen/verification_screen.dart';
import 'package:otp_verification/Widgets/Widgets.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({Key key}) : super(key: key);

  @override
  _LoginScreenBodyState createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 300.0, end: 50.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: size.width * 0.04),
              child: Lottie.asset("assets/otp.json",
                  height: size.height * 0.4, alignment: Alignment.bottomCenter),
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * 0.45,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(boxShadow: [
                    buildBoxShadow(),
                  ]),
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "Login with mobile number\n",
                            style: TextStyle(
                                color: Colors.blue.shade900,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: "We will send you an",
                                  style: TextStyle(color: Colors.black87),
                                  children: [
                                    TextSpan(
                                        text: " One Time Passcode(OTP)",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: " on the mobile number",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal))
                                  ])),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Container(
                                width: double.infinity,
                                child: InkWell(
                                  onTap: () {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                  },
                                  child: TextFormField(
                                    focusNode: _focusNode,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: "Enter Mobile number",
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.blueGrey)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.blueGrey))),
                                  ),
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.41),
                  child: Center(
                    child: SizedBox(
                      width: 120,
                      child: Button(label: "Next",iconData: Icons.arrow_forward_ios_rounded,),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }


}


