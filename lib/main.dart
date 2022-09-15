import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  debugPrintGestureArenaDiagnostics = true;
  runApp(const GesturePlayground());
}

class GesturePlayground extends StatelessWidget {
  const GesturePlayground({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gesture Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SliderPage(),
    );
  }
}

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderVal = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sliders')),
      body: PageView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Material Slider'),
                Slider(
                  value: _sliderVal,
                  onChanged: (value) {
                    _sliderVal = value;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 20),
                const Text('Progress Bar'),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ProgressBar(
                    progress: Duration(seconds: 30),
                    total: Duration(minutes: 1),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
