import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:getcalleyapp/consts/font.dart';
import 'package:getcalleyapp/provider/list_provider.dart';
import 'package:getcalleyapp/screens/helper/customDrawer.dart';
import 'package:getcalleyapp/utils/widgets/customButton.dart';

import 'package:getcalleyapp/utils/widgets/testListResultContainer.dart';
import 'package:provider/provider.dart';

class TestResultScreen extends StatelessWidget {
  const TestResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      drawer: customDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Consumer<ListProvider>(
            builder: (context, listProvider, child) {
              listProvider.fetchCallSummary(
                'https://mock-api.calleyacd.com/api/list/68626fb697757cb741f449b9',
              );

              return listProvider.isDataLoaded == false
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                    children: [
                      // App Bar
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: [
                            InkWell(
                              child: Image.asset('assets/logos/menu.png'),
                              onTap: () {
                                // _scaffoldKey.currentState?.openDrawer();
                              },
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Dashboard",
                              style: customStyle(
                                size: 24,
                                weight: FontWeight.w600,
                              ),
                            ),
                            Spacer(), // pushes the next icons to the right
                            InkWell(child: Image.asset('assets/logos/mic.png')),
                            SizedBox(width: 15),
                            InkWell(
                              child: Image.asset(
                                'assets/logos/notification.png',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      // load you numebr
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 110,
                        padding: const EdgeInsets.all(18.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    'Test List',
                                    style: customStyle(
                                      size: 16,
                                      color: Colors.black,
                                      weight: FontWeight.w600,
                                    ),
                                  ),

                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: listProvider.pending.toString(),
                                          style: customStyle(
                                            size: 24,
                                            color: Colors.blue,
                                            weight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " CALLS",
                                          style: customStyle(
                                            size: 14,
                                            color: Colors.black,
                                            weight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Name Box
                            Container(
                              height: 65,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.blue,
                              ),
                              child: Center(
                                child: Text(
                                  'S',
                                  style: customStyle(
                                    size: 24,
                                    color: Colors.white,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        height: 230,
                        width: 221,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Pie Chart
                            PieChart(
                              PieChartData(
                                sectionsSpace: 5, // space between sections
                                centerSpaceRadius: 60, // inner circle
                                startDegreeOffset: -90,
                                sections: [
                                  PieChartSectionData(
                                    value: 29,
                                    color: Colors.orange,
                                    radius: 40,
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 4,
                                    ),
                                    showTitle: false,
                                  ),
                                  PieChartSectionData(
                                    value: 9,
                                    color: Colors.deepPurple.shade400,
                                    radius: 50,
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 4,
                                    ),
                                    showTitle: false,
                                  ),
                                  PieChartSectionData(
                                    value: 22,
                                    color: Colors.blue,
                                    radius: 40,
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 4,
                                    ),
                                    showTitle: false,
                                  ),
                                ],
                              ),
                            ),

                            // Center Content
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(900),
                                color: Colors.grey.shade200,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      // Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(1.0),

                      //     child: Row(
                      //       children: [
                      //         testListContainer(
                      //           width: MediaQuery.of(context).size.width * 0.3,
                      //           boxColor: Colors.amber.shade100,
                      //           number: listProvider.pending.toString(),
                      //           result: 'Pending',
                      //           stickColor: Colors.amber,
                      //         ),
                      //         SizedBox(width: 8),
                      //         testListContainer(
                      //           width: MediaQuery.of(context).size.width / 3.5,
                      //           boxColor: Colors.blue.shade100,
                      //           number: listProvider.called.toString(),
                      //           result: 'Done',
                      //           stickColor: Colors.green,
                      //         ),
                      //         SizedBox(width: 8),
                      //         testListContainer(
                      //           width: MediaQuery.of(context).size.width / 3,
                      //           boxColor: Colors.deepPurple.shade100,
                      //           number: listProvider.rescheduled.toString(),
                      //           result: 'Scheduled',
                      //           stickColor: Colors.purple,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Row(
                          children: [
                            // Each child takes equal space
                            Expanded(
                              child: testListContainer(
                                boxColor: Colors.amber.shade100,
                                number: listProvider.pending.toString(),
                                result: 'Pending',
                                stickColor: Colors.amber,
                              ),
                            ),
                            // SizedBox(width: 8), // spacing between containers
                            Expanded(
                              child: testListContainer(
                                boxColor: Colors.blue.shade100,
                                number: listProvider.called.toString(),
                                result: 'Done',
                                stickColor: Colors.green,
                              ),
                            ),

                            Expanded(
                              child: testListContainer(
                                boxColor: Colors.deepPurple.shade100,
                                number: listProvider.rescheduled.toString(),
                                result: 'Scheduled',
                                stickColor: Colors.purple,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(context, 'Sart Calling Now', () {}),
      ),
    );
  }
}
