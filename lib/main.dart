import 'package:flutter/material.dart';
import 'package:material_components_showcase/screens/material_showcase.dart';
import 'globals.dart';

void main() {
  runApp(MaterialShowcaseApp());
}

class MaterialShowcaseApp extends StatefulWidget {
  @override
  _MaterialShowcaseAppState createState() => _MaterialShowcaseAppState();
}

class _MaterialShowcaseAppState extends State<MaterialShowcaseApp> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  toggleDrawer() async {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<WidgetWrapper> _widgetList =
        MaterialShowcaseScreen.getWidgetList(context);
    return MaterialApp(
      title: Globals.appName,
      theme: Globals.appTheme.getTheme(isDarkTheme: false),
      darkTheme: Globals.appTheme.getTheme(isDarkTheme: true),
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Title of the AppBar'),
          actions: <Widget>[
            TextButton(
              onPressed: () {},
              child: const Text('Action Btn'),
            ),
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {
                _messengerKey.currentState!.showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ],
        ),
        body: Center(
          child: _widgetList[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            for (int index = 0; index < _widgetList.length; index++)
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: _widgetList[index].name,
              ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
              ),
              for (int index = 0; index < _widgetList.length; index++)
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(_widgetList[index].name),
                  onTap: () {
                    _onItemTapped(index);
                    setState(() {
                      toggleDrawer();
                    });
                    // close the drawer
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
