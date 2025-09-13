import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getcalleyapp/consts/font.dart';
import 'package:getcalleyapp/provider/auth_provider.dart';
import 'package:getcalleyapp/screens/get_started_page.dart';
import 'package:getcalleyapp/utils/widgets/customButton.dart';

class OTPScreen extends StatelessWidget {
  String email;
  OTPScreen({super.key, required this.email});
  List<TextEditingController> _otpController = List.generate(
    6,
    (_) => TextEditingController(),
  );
  List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  Widget build(BuildContext context) {
    int otpLength = 6;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10),
            child: Column(
              children: [
                // app logo
                Image.asset('assets/logos/appLogo.png'),

                SizedBox(height: 20),
                // Sign Up box
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 5,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey.shade500, // 👈 border color
                        width: 0.5, // 👈 border width
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Texts main
                          Text(
                            "Whatsapp OTP!",
                            style: customStyle(
                              size: 32,
                              weight: FontWeight.w700,
                            ),
                          ),
                          // subText
                          Text(
                            "Verification",
                            style: customStyle(
                              size: 32,
                              weight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 5),

                          Text(
                            'Please ensure that the email id mentioned is valid as we have sent an OTP to your email.',
                            textAlign: TextAlign.center,
                            style: customStyle(
                              color: Colors.grey,
                              size: 15,
                              weight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 30),

                          // OTP BOxes
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(otpLength, (index) {
                                  return Container(
                                    width: 45,
                                    height: 55,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                    ),
                                    child: TextFormField(
                                      focusNode: _focusNodes[index],
                                      controller: _otpController[index],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                      ],
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        if (value.isNotEmpty && index < 5) {
                                          _focusNodes[index + 1]
                                              .requestFocus(); // Move to next box
                                        } else if (value.isEmpty && index > 0) {
                                          _focusNodes[index - 1]
                                              .requestFocus(); // Move to previous box if deleted
                                        }
                                      },
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),

                          // terms and conditions
                          Text(
                            '+91 7676286822?',
                            style: customStyle(
                              size: 15,
                              weight: FontWeight.w400,
                            ),
                          ),

                          // SizedBox(height: 300),

                          // // sigh up
                          // CustomButton(context, "Verify", () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => OTPScreen(),
                          //     ),
                          //   );
                          // }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // already have account
            RichText(
              text: TextSpan(
                style: customStyle(size: 15, weight: FontWeight.w400),
                children: [
                  TextSpan(text: "Didn't receive OTP code? "),
                  TextSpan(
                    text: ' Resend OTP',
                    style: customStyle(
                      size: 15,
                      color: Colors.blue,
                      weight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            CustomButton(context, "Veritfy OTP", () async {
              String otp = _otpController.map((c) => c.text).join();
              print(otp);
              bool verify = false;
              verify = await AuthProvider().verifyOtp(email, otp);

              if (verify == false) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("OTP mismatch"),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("OTP Verified"),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GetStartedScreen()),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
