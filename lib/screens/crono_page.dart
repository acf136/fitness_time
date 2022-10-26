import 'dart:async';
import 'package:flutter/material.dart';

class CronoPage extends StatefulWidget {
  @override
  _CronoPageState createState() => _CronoPageState();
}

class _CronoPageState extends State<CronoPage> {
  StreamSubscription<int>? timerSubscription;
  String hoursStr = '00';
  String minutesStr = '00';
  String secondsStr = '00';

  // Function that returns Stream<int> to build a  StreamSubscription<int>
  //
  Stream<int> cronoStream() {
    var streamController = StreamController();
    Timer? timer;
    Duration timerInterval = Duration(seconds: 1);
    int counterTick = 0;

    void stopTimer() {
      if (timer != null) {
        timer?.cancel();
        timer = null;
        counterTick = 0;
        streamController.close();
      }
    }

    void pauseTimer() {
      if (timer != null) {
        timer?.cancel();
        timer = null;
      }
    }

    void tick(_) {
      streamController.add(++counterTick);
    }

    void startTimer() {
      timer = Timer.periodic(timerInterval, tick);
    }

    streamController = StreamController<int>(
      onListen: startTimer,
      onCancel: stopTimer,
      onResume: startTimer,
      onPause: pauseTimer,
    );

    return streamController.stream as Stream<int>;
  }

  @override
  Widget build(BuildContext context) {
    Stream<int> timerStream;
    return Scaffold(
      appBar: AppBar(title: Text("CronoMeter"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$hoursStr:$minutesStr:$secondsStr",
              style: TextStyle(
                fontSize: 75.0,
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      if (timerSubscription != null) {
                        if (timerSubscription!.isPaused)
                          timerSubscription!.resume();
                      }
                      if (timerSubscription == null) {
                        timerStream = cronoStream();
                        timerSubscription = timerStream.listen((int countTick) {
                          setState(() {
                            hoursStr = ((countTick / (60 * 60)) % 60)
                                .floor()
                                .toString()
                                .padLeft(2, '0');
                            minutesStr = ((countTick / 60) % 60)
                                .floor()
                                .toString()
                                .padLeft(2, '0');
                            secondsStr = (countTick % 60)
                                .floor()
                                .toString()
                                .padLeft(2, '0');
                          });
                        });
                      }
                    },
                    icon: Icon(Icons.play_arrow)),
                SizedBox(width: 40.0),
                IconButton(
                    onPressed: () {
                      if (timerSubscription != null) timerSubscription!.pause();
                      setState(() {});
                    },
                    icon: Icon(Icons.pause)),
                SizedBox(width: 40.0),
                IconButton(
                    onPressed: () {
                      if (timerSubscription != null) {
                        timerSubscription!.cancel();
                        timerSubscription = null;
                      }
                      setState(() {
                        hoursStr = '00';
                        minutesStr = '00';
                        secondsStr = '00';
                      });
                    },
                    icon: Icon(Icons.stop)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
