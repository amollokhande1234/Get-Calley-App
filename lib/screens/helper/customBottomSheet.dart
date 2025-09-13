import 'package:flutter/material.dart';
import 'package:getcalleyapp/consts/font.dart';
import 'package:getcalleyapp/screens/test_result_screen.dart';

Future customBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 3, 44, 78),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                textAlign: TextAlign.center,
                'CALLING LISTS',
                style: customStyle(
                  size: 18,
                  color: Colors.white,
                  weight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                width: double.infinity, // ensures full width
                height: double.infinity, // ensures full height\
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 70,
                        width: 324,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Text
                            Text(
                              textAlign: TextAlign.center,
                              'Select Calling List',
                              style: customStyle(
                                size: 18,
                                color: Colors.black,
                                weight: FontWeight.w700,
                              ),
                            ),
                            // referesh button
                            Container(
                              height: 42,
                              width: 110,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Row(
                                  children: [
                                    Image.asset('assets/logos/refresh.png'),
                                    SizedBox(width: 5),
                                    Text(
                                      textAlign: TextAlign.start,
                                      'Refresh',
                                      style: customStyle(
                                        size: 17,
                                        color: Colors.white,
                                        weight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10),
                      Container(
                        height: 70,
                        width: 324,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Text
                              Text(
                                textAlign: TextAlign.center,
                                'Test List',
                                style: customStyle(
                                  size: 18,
                                  color: Colors.black,
                                  weight: FontWeight.w600,
                                ),
                              ),
                              // next button button
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TestResultScreen(),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  height: 42,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Image.asset(
                                      'assets/logos/testListNext.png',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
