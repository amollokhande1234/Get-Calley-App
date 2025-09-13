import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:getcalleyapp/consts/font.dart';
import 'package:getcalleyapp/provider/auth_provider.dart';
import 'package:getcalleyapp/screens/Auth/otp_screen.dart';
import 'package:getcalleyapp/screens/Auth/signIn_screen.dart';
import 'package:getcalleyapp/utils/widgets/customButton.dart';
import 'package:getcalleyapp/utils/widgets/customTextFormFeild.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _name = TextEditingController();

  TextEditingController _pass = TextEditingController();

  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /*
    return Scaffold(
      resizeToAvoidBottomInset: true, // i
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
                SingleChildScrollView(
                  reverse: true,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Texts main
                        Text(
                          "Welcome!",
                          style: customStyle(size: 32, weight: FontWeight.w700),
                        ),
                        // subText
                        Text(
                          "Please register to continue",
                          style: customStyle(
                            color: const Color.fromARGB(255, 41, 29, 29),
                            size: 15,
                            weight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 10),
                        customTextFormField(
                          context,
                          hint: "Name",
                          icon: Icons.person_outline_outlined,
                          controller: _name,
                        ),

                        // Email
                        customTextFormField(
                          context,
                          hint: "Email address",
                          icon: Icons.mail_outline_outlined,
                          controller: _email,
                        ),

                        // Passoword
                        customTextFormField(
                          context,
                          hint: "Password",
                          icon: Icons.lock_outline_rounded,
                          controller: _pass,
                          obSecure: true,
                        ),

                        // Number
                        customTextFormField(
                          context,
                          hint: "+91",
                          icon: Icons.call_outlined,
                        ),
                        customTextFormField(
                          context,
                          hint: "Mobile Number",
                          icon: Icons.phone_iphone_outlined,
                        ),

                        // terms and conditions
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_box_outline_blank,
                              color: Colors.grey,
                              size: 18,
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: [
                                  TextSpan(text: 'I agree to the '),
                                  TextSpan(
                                    text: 'Terms and Conditions',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
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
        child: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min, // 👈 keeps it compact at bottom
            children: [
              // already have account
              RichText(
                text: TextSpan(
                  style: customStyle(size: 15, weight: FontWeight.w400),
                  children: [
                    const TextSpan(text: 'Already have an account?'),
                    TextSpan(
                      text: '  Sign In',
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
                                  builder: (context) => SignInScreen(),
                                ),
                              );
                            },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // sign up
              CustomButton(context, "Sign Up", () async {
                bool flag = false;
                flag = await AuthProvider().register(
                  _name.text.trim(),
                  _email.text.trim(),
                  _pass.text.trim(),
                  context,
                );

                if (flag == false) {
                  CircularProgressIndicator();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Something Went Wrong"),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => OTPScreen(email: _email.text.trim()),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
 
 */
    return Scaffold(
      resizeToAvoidBottomInset: true, // important
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // App logo
              Image.asset('assets/logos/appLogo.png'),
              SizedBox(height: 20),

              // Sign Up box
              Container(
                width: double.infinity,
                // height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade500, width: 0.5),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Welcome text
                    Text(
                      "Welcome!",
                      style: customStyle(size: 32, weight: FontWeight.w700),
                    ),
                    Text(
                      "Please register to continue",
                      style: customStyle(color: Colors.grey, size: 15),
                    ),
                    SizedBox(height: 20),
                    customTextFormField(
                      context,
                      hint: "Name",
                      icon: 'user.png',
                      controller: _name,
                    ),
                    customTextFormField(
                      context,
                      hint: "Email address",
                      icon: 'mail.png',
                      controller: _email,
                    ),
                    customTextFormField(
                      context,
                      hint: "Password",
                      icon: 'password.png',
                      controller: _pass,
                      obSecure: true,
                    ),
                    customTextFormField(
                      context,
                      hint: " +91",
                      icon: 'whatsUp.png',
                      frontLogo: 'flag.png',
                    ),
                    customTextFormField(
                      context,
                      hint: "Mobile Number",
                      icon: 'number.png',
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_box_outline_blank,
                          color: Colors.grey,
                          size: 18,
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            children: [
                              TextSpan(text: '  I agree to the '),
                              TextSpan(
                                text: 'Terms and Conditions',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 100),
                  ],
                ),
              ),
            ],
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
            RichText(
              text: TextSpan(
                style: customStyle(size: 15, weight: FontWeight.w400),
                children: [
                  TextSpan(text: "Already have an account?"),
                  TextSpan(
                    text: ' Sign In',
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
                                builder: (context) => SignInScreen(),
                              ),
                            );
                          },
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            CustomButton(context, "Sign Up", () async {
              bool flag = await AuthProvider().register(
                _name.text.trim(),
                _email.text.trim(),
                _pass.text.trim(),
                context,
              );

              if (!flag) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Something Went Wrong"),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OTPScreen(email: _email.text.trim()),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
