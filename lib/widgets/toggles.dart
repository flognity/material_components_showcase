import 'package:flutter/material.dart';

class TogglesShowcase extends StatefulWidget {
  @override
  _TogglesShowcaseState createState() => _TogglesShowcaseState();
}

class _TogglesShowcaseState extends State<TogglesShowcase> {
  bool _selectedCheckbox = true;
  bool _selectedRadio = true;
  bool _switch = true;
  double _currentSliderValue = 20;

  void toggleSelectedCheckbox() {
    setState(() {
      _selectedCheckbox = !_selectedCheckbox;
    });
  }

  void toggleSelectedRadio() {
    setState(() {
      _selectedRadio = !_selectedRadio;
    });
  }

  void toggleSwitch() {
    setState(() {
      _switch = !_switch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ToggleWrapper(
          label: 'Checkbox',
          children: [
            Checkbox(
              value: _selectedCheckbox,
              onChanged: (value) {
                toggleSelectedCheckbox();
              },
            ),
            Checkbox(
              value: !_selectedCheckbox,
              onChanged: (value) {
                toggleSelectedCheckbox();
              },
            ),
          ],
        ),
        ToggleWrapper(
          label: 'Radio',
          children: [
            Radio(
              value: _selectedRadio,
              groupValue: true,
              onChanged: (value) {
                toggleSelectedRadio();
              },
            ),
            Radio(
              value: !_selectedRadio,
              groupValue: true,
              onChanged: (value) {
                toggleSelectedRadio();
              },
            ),
          ],
        ),
        ToggleWrapper(children: [
          Switch(
            value: _switch,
            onChanged: (newValue) {
              toggleSwitch();
            },
          ),
          Switch(
            value: !_switch,
            onChanged: (newValue) {
              toggleSwitch();
            },
          )
        ], label: 'Switch'),
        ToggleWrapper(children: [
          Slider(
            value: _currentSliderValue,
            min: 0,
            max: 100,
            divisions: 5,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          )
        ], label: 'Slider', width: 200.0)
      ],
    );
  }
}

class ToggleWrapper extends StatelessWidget {
  final List<Widget> children;
  final String label;
  final double width;

  ToggleWrapper(
      {required this.children, required this.label, this.width = 150.0});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        children: [
          Text(label),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ],
      ),
    );
  }
}
