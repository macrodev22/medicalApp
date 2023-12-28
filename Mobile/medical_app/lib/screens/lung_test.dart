import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LungTestScreen extends StatefulWidget {
  const LungTestScreen({super.key});

  @override
  State<LungTestScreen> createState() => _LungTestScreenState();
}

class _LungTestScreenState extends State<LungTestScreen>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _controller;
  final String video = "assets/lung_test_video.mp4";
  late VideoPlayerController videoController;
  double _sliderValue = 0;
  bool showTimer = false;

  @override
  void initState() {
    super.initState();

    //Create an animation controller with duration of 42s
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 42),
    );

    //Create a curved animation for smoother motion
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    //Add a listener to to rebuild on animation value change
    _animation.addListener(() {
      setState(() {});
    });

    // The video Controller
    videoController = VideoPlayerController.asset(video)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => videoController.pause());
  }

  Widget AssetVideoPlayer() {
    return AspectRatio(
        aspectRatio: videoController.value.aspectRatio,
        child: VideoPlayer(videoController));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.amber),
        foregroundColor: Colors.blueAccent.shade200,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Text(
            'CHECK YOUR LUNGS',
            style: TextStyle(fontSize: 35),
          )),
          Center(
              child: Text(
            "HOLD YOUR BREATH",
            style: TextStyle(fontSize: 38, color: Colors.blue.shade200),
          )),
          showTimer
              ? const BreathInTimer(seconds: 4)
              : const Text("Get ready to breath in"),
          Slider(
            value: _animation.value,
            onChanged: (val) {
              _sliderValue = val;
            },
            label: "$_sliderValue",
          ),
          SizedBox(height: 300, child: AssetVideoPlayer()),
        ],
      ),
      floatingActionButton: LongPressFloatingActionButton(
        onPressed: () {
          setState(() {
            showTimer = false;
          });
          _controller.reset();
          videoController.seekTo(Duration.zero);
        },
        content: const Icon(Icons.punch_clock_rounded),
        onLongPress: () {
          setState(() {
            showTimer = true;
          });
          _controller.forward();
          videoController.seekTo(Duration.zero);
          videoController.play();
        },
        onLongPressEnd: (details) {
          _sliderValue = _controller.value;
          _controller.stop();
          videoController.pause();
          // print("Slider value: $_sliderValue");
          if (_sliderValue < .77) {
            // print("Test not passed");
            // Fluttertoast.showToast(msg: "Test not passed");
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Test not passed")));
          } else {
            // print("Test passed");
            // Fluttertoast.showToast(msg: "Test Passed!!! 🏆😎");
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Test Passed!!! 🏆😎")));
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    videoController.dispose();
    super.dispose();
  }
}

class LongPressFloatingActionButton extends StatelessWidget {
  const LongPressFloatingActionButton(
      {super.key,
      required this.onPressed,
      required this.onLongPress,
      required this.onLongPressEnd,
      required this.content});

  final void Function() onPressed;
  final void Function() onLongPress;
  final void Function(LongPressEndDetails details) onLongPressEnd;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onLongPressEnd: onLongPressEnd,
      child: FloatingActionButton(
        onPressed: onPressed,
        child: content,
      ),
    );
  }
}

class BreathInTimer extends StatefulWidget {
  const BreathInTimer({super.key, required this.seconds});
  final int seconds;

  @override
  State<BreathInTimer> createState() => _BreathInTimerState();
}

class _BreathInTimerState extends State<BreathInTimer> {
  late Timer _timer;
  int _secondsLeft = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
        _secondsLeft == 0 ? "Hold your breath" : "$_secondsLeft seconds");
  }

  void startTimer() {
    _secondsLeft = widget.seconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (this.mounted) {
        setState(() {
          if (_secondsLeft > 0) {
            _secondsLeft--; // Reduce time left
          } else {
            _timer.cancel(); // Cancel timer at 0
          }
        });
      }
    });
  }
}
