import 'package:flutter/material.dart';
import 'package:material_components_showcase/widgets/buttons.dart';
import 'package:material_components_showcase/widgets/chips.dart';
import 'package:material_components_showcase/widgets/data_tables.dart';
import 'package:material_components_showcase/widgets/dialogs.dart';
import 'package:material_components_showcase/widgets/progress_indicators.dart';
import 'package:material_components_showcase/widgets/tabbar.dart';
import 'package:material_components_showcase/widgets/toggles.dart';

class WidgetWrapper extends StatelessWidget {
  final String name;
  final Widget child;
  WidgetWrapper({required this.name, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class MaterialShowcaseScreen {
  static List<WidgetWrapper> getWidgetList(BuildContext context) {
    return <WidgetWrapper>[
      WidgetWrapper(
        name: 'Chips, Checkboxes and Radios',
        child: ListView(
          children: [
            ChipShowcase(),
            SizedBox(
              height: 20.0,
            ),
            TogglesShowcase(),
          ],
        ),
      ),
      WidgetWrapper(
        name: 'Buttons and Dialogs',
        child: ListView(
          children: [
            Text(
              'Buttons and Dialogs',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            ButtonShowcase(),
            Divider(
              thickness: 8,
            ),
            DialogShowcase(),
            Divider(
              thickness: 8,
            ),
            ProgressIndicatorsShowcase(),
          ],
        ),
      ),
      WidgetWrapper(
        name: 'Tab Bar',
        child: ListView(
          children: [
            Text(
              'Tab Bar',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            TabBarShowcase(),
          ],
        ),
      ),
      WidgetWrapper(
        name: 'Data Table',
        child: ListView(
          children: [
            Text(
              'Data Table',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            DataTableShowcase(),
          ],
        ),
      ),
    ];
  }
}
