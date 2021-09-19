import 'package:flutter/material.dart';

class ButtonShowcase extends StatefulWidget {
  @override
  _ButtonShowcaseState createState() => _ButtonShowcaseState();
}

class _ButtonShowcaseState extends State<ButtonShowcase> {
  static const List<String> _options = <String>['One', 'Two', 'Free', 'Four'];

  String _dropdownValue = _options.first;
  String _popUpValue = _options.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            ButtonBuilder(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Elevated Button',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ButtonBuilder(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'Outlined Button',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ButtonBuilder(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Text Button',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            RoundButtonBuilder(
              label: 'Floating Action Button',
              child: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
                tooltip: 'Floating Action Button',
              ),
            ),
            RoundButtonBuilder(
              label: 'Icon Button',
              child: IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {},
                tooltip: 'Icon Button',
              ),
            ),
            RoundButtonBuilder(
              label: 'Circle Avatar',
              child: CircleAvatar(
                child: const Icon(Icons.add_a_photo),
              ),
            )
          ],
        ),
        Row(
          children: [
            ButtonBuilder(
              label: 'Drop Down Button',
              child: DropdownButton<String>(
                value: _dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                onChanged: (String? newValue) {
                  setState(() {
                    _dropdownValue = newValue!;
                  });
                },
                items: _options.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            ButtonBuilder(
              label: 'Popup Menu Button',
              child: PopupMenuButton<String>(
                initialValue: _popUpValue,
                onSelected: (String selected) {
                  setState(() {
                    _popUpValue = selected;
                  });
                },
                itemBuilder: (BuildContext context) =>
                    _options.map<PopupMenuEntry<String>>((String value) {
                  return PopupMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ButtonBuilder extends StatelessWidget {
  final Widget child;
  final String label;
  ButtonBuilder({required this.child, this.label = ''});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: label != ''
            ? Column(
                children: [
                  Text(
                    label,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  child,
                ],
              )
            : child,
      ),
    );
  }
}

class RoundButtonBuilder extends StatelessWidget {
  final Widget child;
  final String label;
  RoundButtonBuilder({required this.child, this.label = ''});

  @override
  Widget build(BuildContext context) {
    return ButtonBuilder(
      label: label,
      child: Container(
        height: 60.0,
        width: 60.0,
        child: FittedBox(child: child),
      ),
    );
  }
}
