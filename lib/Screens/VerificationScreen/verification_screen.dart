import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_verification/Widgets/Widgets.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({Key key}) : super(key: key);

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
                child: Lottie.asset("assets/otpverification.json",
                    height: size.height * 0.4,
                    alignment: Alignment.bottomCenter),
              ),
              Stack(children: [
                Container(
                  width: double.infinity,
                  height: size.height * 0.4,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(boxShadow: [buildBoxShadow()]),
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Text(
                          "Verification",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          "Enter otp send to your mobile number",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OtpNumberBox(),
                            SizedBox(
                              width: 5,
                            ),
                            OtpNumberBox(),
                            SizedBox(
                              width: 5,
                            ),
                            OtpNumberBox(),
                            SizedBox(
                              width: 5,
                            ),
                            OtpNumberBox(),
                            SizedBox(
                              width: 5,
                            ),
                            OtpNumberBox()
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.36),
                  child: Center(
                    child: SizedBox(
                        width: 150,
                        height: 40,
                        child: Button(
                          label: "Continue",
                          iconData: Icons.arrow_forward_ios_rounded,
                        )),
                  ),
                )
              ])
            ],
          ),
        ));
  }
}

class OtpNumberBox extends StatelessWidget {
  const OtpNumberBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        keyboardType:
            TextInputType.numberWithOptions(decimal: false, signed: false),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}
