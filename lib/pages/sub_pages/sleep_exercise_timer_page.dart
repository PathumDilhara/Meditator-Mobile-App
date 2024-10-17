import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meditator_mobile_app/models/sleep_exercise_model.dart';
import 'package:meditator_mobile_app/utils/colors.dart';

class SleepExerciseTimerPage extends StatefulWidget {
  final SleepExerciseModel sleepExerciseModel;
  const SleepExerciseTimerPage({
    super.key,
    required this.sleepExerciseModel,
  });

  @override
  State<SleepExerciseTimerPage> createState() => _SleepExerciseTimerPageState();
}

class _SleepExerciseTimerPageState extends State<SleepExerciseTimerPage> {
  Timer? _timer;
  int _remainingTime = 0;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.sleepExerciseModel.duration * 60;
  }

  // Method to start the timer
  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _isRunning = true;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(
          () {
            if (_remainingTime > 0) {
              _remainingTime--;
            } else {
              _timer!.cancel();
            }
          },
        );
      },
    );
  }

  // Method to pause the timer
  void _pauseTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _isRunning = false;
    }
  }

  // Method to stop the timer
  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    setState(() {
      _remainingTime = widget.sleepExerciseModel.duration * 60;
    });
  }

  // Method to time formatter as xx : xx
  String _timeFormatter(int seconds) {
    final int minutes =
        seconds ~/ 60; // truncated division operator to return int
    final int remainingSeconds = seconds % 60;

    return "$minutes:${remainingSeconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sleep Story Timer",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.sleepExerciseModel.category,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryPurple,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.sleepExerciseModel.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Duration : ${widget.sleepExerciseModel.category} minutes",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.sleepExerciseModel.description,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  _timeFormatter(
                    _remainingTime,
                  ),
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isRunning ? _pauseTimer() : _startTimer();
                      });
                    },
                    child: Text(_isRunning
                        ? "Pause"
                        : _remainingTime <
                                widget.sleepExerciseModel.duration * 60
                            ? "Resume"
                            : "Start"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        _stopTimer();
                        _isRunning = false;
                      });
                    },
                    child: const Text("Stop"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
