import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      // margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50, // background of bar
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border.all(color: Colors.blue.shade200, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('assets/logos/bottomNav/home.png', width: 26),
          Image.asset('assets/logos/bottomNav/bag.png', width: 26),

          // middle highlighted button
          Container(
            width: 70,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Image.asset(
                'assets/logos/bottomNav/video.png',
                width: 28,
                color: Colors.white,
              ),
            ),
          ),

          Image.asset('assets/logos/bottomNav/call.png', width: 26),
          Image.asset('assets/logos/bottomNav/schedule.png', width: 26),
        ],
      ),
    );
  }
}
