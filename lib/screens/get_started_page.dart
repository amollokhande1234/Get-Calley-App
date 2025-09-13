import 'package:flutter/material.dart';
import 'package:getcalleyapp/consts/font.dart';
import 'package:getcalleyapp/provider/video_provider.dart';
import 'package:getcalleyapp/screens/home_screen.dart';
import 'package:getcalleyapp/utils/widgets/customButton.dart';
import 'package:getcalleyapp/utils/widgets/nav_bar_profile_container.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class GetStartedScreen extends StatelessWidget {
  GetStartedScreen({super.key});
  final String videoUrl = 'https://www.example.com/video.mp4';

  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context);

    // Initialize video once
    if (!videoProvider.isInitialized) {
      videoProvider.initialize(videoUrl);
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // Nav Bar container
              profileContainer(context),
              SizedBox(height: 10),
              // Video
              Container(
                width: MediaQuery.of(context).size.width,
                height: 337,
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
                        'If you are here for the first time then ensure that you have uploaded the list to call from calley Web Panel hosted on https://app.getcalley.com',
                        style: customStyle(
                          size: 16,
                          color: Colors.white,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Consumer<VideoProvider>(
                      builder: (context, videoProvider, _) {
                        // Initialize only once
                        if (!videoProvider.isInitialized) {
                          videoProvider.initialize(
                            'https://media.istockphoto.com/id/1046965704/video/programming-source-code-abstract-background.mp4?s=mp4-640x640-is&k=20&c=E7PGx6e2DxpcNqp2SaN6Q9JaJ4A5OdBTp7ldtgLX_RE=',
                          );
                        }

                        return Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child:
                                videoProvider.isInitialized
                                    ? Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          child: AspectRatio(
                                            aspectRatio:
                                                videoProvider
                                                    .controller
                                                    .value
                                                    .aspectRatio,
                                            child: VideoPlayer(
                                              videoProvider.controller,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            videoProvider.isPlaying
                                                ? Icons.pause_circle_filled
                                                : Icons.play_arrow_rounded,
                                            color: Colors.white,
                                            size: 60,
                                          ),
                                          onPressed: () {
                                            videoProvider.togglePlayPause();
                                          },
                                        ),
                                      ],
                                    )
                                    : Center(
                                      child: CircularProgressIndicator(),
                                    ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Start Calling Button
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // adjust as needed
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green, width: 1),
              ),
              child: Image.asset('assets/logos/whatsApp.png'),
            ),
            SizedBox(width: 10),
            Expanded(
              child: CustomButton(context, "Start Calling Now", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
