import 'package:flutter/material.dart';
import 'package:getcalleyapp/consts/drawerList.dart';
import 'package:getcalleyapp/consts/font.dart';
import 'package:getcalleyapp/utils/widgets/customDrawerItems.dart';

Widget customDrawer() {
  return SafeArea(
    child: SizedBox(
      width: 300, //
      child: Drawer(
        backgroundColor: Colors.blue.shade50,
        child: Column(
          children: [
            Container(
              height: 100,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    // Icon
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/logos/profile.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 15),
                    // Column Greeting Name
                    Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // center vertically
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Swati",
                              style: customStyle(
                                size: 18,
                                color: Colors.white,
                                weight: FontWeight.w600,
                              ),
                            ),

                            Text(
                              " . Personal",
                              style: customStyle(
                                size: 17,
                                color: Colors.amber,
                                weight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5), // spacing between texts
                        Text(
                          "swati@csTech.in",
                          style: customStyle(
                            size: 16,
                            color: Colors.white54,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.zero,
                itemCount: drawerList.length,
                itemBuilder: (context, index) {
                  var item = drawerList[index];

                  if (index == 7) {
                    // Section title
                    return Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Text(
                            "App Info",
                            style: customStyle(
                              color: Colors.blue,
                              size: 18,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ),
                        customDrawerItem(
                          item['path'] ?? '',
                          item['name'] ?? '',
                        ),
                      ],
                    );
                  }

                  return customDrawerItem(
                    item['path'] ?? '',
                    item['name'] ?? '',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
