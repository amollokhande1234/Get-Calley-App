import 'package:flutter/material.dart';
import 'package:getcalleyapp/consts/languageList.dart';

import 'package:getcalleyapp/screens/Auth/sign_up_page.dart';
import 'package:getcalleyapp/utils/widgets/customButton.dart';
import 'package:getcalleyapp/utils/widgets/languageWidget.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Text
              Text(
                "Choose Your Language",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              // Box of lanugages
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade500, // 👈 border color
                      width: 0.5, // 👈 border width
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: languages.length,
                    itemBuilder: (context, index) {
                      final lang = languages[index];
                      return index == 0
                          ? languageWidget(
                            lang['language']!,
                            lang['hi']!,
                            checked: true,
                          )
                          : languageWidget(lang['language']!, lang['hi']!);
                    },
                  ),
                ),
              ),
              SizedBox(height: 15),
              // customButton
              CustomButton(context, "Select", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
