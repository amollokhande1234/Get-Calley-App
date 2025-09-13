import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getcalleyapp/consts/font.dart';
import 'package:getcalleyapp/screens/Auth/sign_up_page.dart';

import 'package:getcalleyapp/screens/get_started_page.dart';
import 'package:getcalleyapp/utils/widgets/customButton.dart';
import 'package:getcalleyapp/utils/widgets/customTextFormFeild.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey.shade500, // 👈 border color
                        width: 0.5, // 👈 border width
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center, // ✅ center vertically
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Texts main
                            Text(
                              "Welcome",
                              style: customStyle(
                                size: 32,
                                weight: FontWeight.w700,
                              ),
                            ),
                            // sub
                            Text(
                              'Please sign-in to continue ',
                              textAlign: TextAlign.center,
                              style: customStyle(
                                color: Colors.grey,
                                size: 15,
                                weight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 30),

                            // Email
                            customTextFormField(
                              context,
                              hint: "Email address",
                              icon: 'mail.png',
                            ),

                            // Passoword
                            customTextFormField(
                              context,
                              hint: "Password",
                              icon: 'password.png',
                            ),

                            // forgot password
                            Padding(
                              padding: const EdgeInsets.only(right: 25.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Forgot Password?',
                                  style: customStyle(
                                    size: 15,
                                    weight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // sigh up
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // already have account
            RichText(
              text: TextSpan(
                style: customStyle(size: 15, weight: FontWeight.w400),
                children: [
                  TextSpan(text: "Don’t have an account? "),
                  TextSpan(
                    text: '  Sign Up',
                    style: customStyle(
                      size: 15,
                      color: Colors.blue,
                      weight: FontWeight.w600,
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                            );
                          },
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),

            // Sign In
            CustomButton(context, "Sign In", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GetStartedScreen()),
              );
            }),
          ],
        ),
      ),
    );
  }
}
