import 'package:flutter/material.dart';

class ProgressIndicatorsShowcase extends StatefulWidget {
  @override
  State<ProgressIndicatorsShowcase> createState() =>
      _ProgressIndicatorsShowcaseState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _ProgressIndicatorsShowcaseState extends State<ProgressIndicatorsShowcase>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              Text('Circular Progress Indicator'),
              SizedBox(height: 10.0),
              CircularProgressIndicator(
                value: controller.value,
                semanticsLabel: 'Linear progress indicator',
              ),
            ],
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Column(
              children: [
                Text('Linear Progress Indicator'),
                SizedBox(height: 10.0),
                LinearProgressIndicator(
                  value: controller.value,
                  semanticsLabel: 'Linear progress indicator',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
