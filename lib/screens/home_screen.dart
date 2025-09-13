import 'package:flutter/material.dart';

import 'package:getcalleyapp/consts/font.dart';
import 'package:getcalleyapp/provider/whatsUp_provider.dart';
import 'package:getcalleyapp/screens/helper/customBottomSheet.dart';
import 'package:getcalleyapp/screens/helper/customDrawer.dart';

import 'package:getcalleyapp/utils/widgets/customBottomNav.dart';

import 'package:getcalleyapp/utils/widgets/customButton.dart';

import 'package:getcalleyapp/utils/widgets/load_numberCall_HomePage.dart';

import 'package:getcalleyapp/utils/widgets/nav_bar_profile_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      key: _scaffoldKey,
      drawer: customDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              // App Bar
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    InkWell(
                      child: Image.asset('assets/logos/menu.png'),
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Dashboard",
                      style: customStyle(size: 24, weight: FontWeight.w600),
                    ),
                    Spacer(), // pushes the next icons to the right
                    InkWell(child: Image.asset('assets/logos/mic.png')),
                    SizedBox(width: 15),
                    InkWell(
                      child: Image.asset('assets/logos/notification.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              // Nav Bar container
              profileContainer(context),
              SizedBox(height: 15),

              // LoadNumber
              loadNumberCallHomePage(),
              // load you numebr
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start, // adjust as needed
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green, width: 1),
                    ),
                    child: InkWell(
                      onTap: () {
                        WhatsAppProvider().openWhatsAppChat(
                          '917028900431',
                          "Hello Amol",
                        );
                        // Provider.of<WhatsupProvider>(
                        //   context,
                        //   listen: false,
                        // ).openWhatsApp("917028900431", "Hello!");
                      },
                      child: Image.asset('assets/logos/whatsApp.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(context, "Start Calling Now", () async {
                      // Custom Bottom Sheet
                      await customBottomSheet(context);
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // Bottom Nava Bar
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}


      /*
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          // handle tab change
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/logos/bottomNav/home.png',
              width: 28,
              height: 28,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/logos/bottomNav/bag.png',
              width: 28,
              height: 28,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 70,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.asset(
                'assets/logos/bottomNav/video.png',
                width: 28,
                height: 28,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/logos/bottomNav/call.png',
              width: 28,
              height: 28,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/logos/bottomNav/schedule.png',
              width: 28,
              height: 28,
            ),
            label: '',
          ),
        ],
      ),
    */