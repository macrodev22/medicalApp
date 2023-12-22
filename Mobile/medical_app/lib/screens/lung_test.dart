import 'dart:async';

import 'package:flutter/material.dart';

class LungTestScreen extends StatefulWidget {
  const LungTestScreen({super.key});

  @override
  State<LungTestScreen> createState() => _LungTestScreenState();
}

class _LungTestScreenState extends State<LungTestScreen>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _controller;
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
                child: Text(
              'CHECK YOUR LUNGS',
              style: TextStyle(fontSize: 35),
            )),
            Center(
                child: Text(
              "SAFE ZONE",
              style: TextStyle(fontSize: 50, color: Colors.blue.shade200),
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
            )
          ],
        ),
      ),
      floatingActionButton: LongPressFloatingActionButton(
        onPressed: () {
          setState(() {
            showTimer = false;
          });
          _controller.reset();
        },
        content: const Icon(Icons.punch_clock_rounded),
        onLongPress: () {
          setState(() {
            showTimer = true;
          });
          _controller.forward();
        },
        onLongPressEnd: (details) {
          _sliderValue = _controller.value;
          _controller.stop();
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
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

//Video
class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  final String video = "assets/lung_test_video.mp4";
  // VideoPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
