import 'package:flutter/material.dart';

// stores ExpansionPanel state information
class ExpansionPanelItem {
  ExpansionPanelItem({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

class TabBarShowcase extends StatefulWidget {
  @override
  _TabBarShowcaseState createState() => _TabBarShowcaseState();
}

class _TabBarShowcaseState extends State<TabBarShowcase>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final List<ExpansionPanelItem> _data =
      List<ExpansionPanelItem>.generate(3, (int index) {
    return ExpansionPanelItem(
      headerValue: 'Expansion Panel $index',
      expandedValue: 'This is the content of Panel $index',
    );
  });

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TabBar(
        controller: _tabController,
        tabs: <Widget>[
          Tab(
            text: 'Text Tab',
            icon: Icon(Icons.text_fields),
          ),
          Tab(
            text: 'Card Tab',
            icon: Icon(Icons.credit_card),
          ),
          Tab(
            text: 'Calendar Tab',
            icon: Icon(Icons.perm_contact_calendar),
          ),
        ],
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Headline 1',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  'Headline 2',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  'Headline 3',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  'Headline 4',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  'Headline 5',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'Headline 6',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  'Subtitle 1',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  'Subtitle 2',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  'Caption',
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  'Body Text 1',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  'Body Text 2',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
            Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Container(
                    height: 100,
                    child: const Center(
                      child: Text('Material Card'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      _data[index].isExpanded = !isExpanded;
                    });
                  },
                  children:
                      _data.map<ExpansionPanel>((ExpansionPanelItem item) {
                    return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(item.headerValue),
                        );
                      },
                      body: ListTile(
                          title: Text(item.expandedValue),
                          subtitle: const Text(
                              'To delete this panel, tap the trash can icon'),
                          trailing: const Icon(Icons.delete),
                          onTap: () {
                            setState(() {
                              _data.removeWhere(
                                  (ExpansionPanelItem currentItem) =>
                                      item == currentItem);
                            });
                          }),
                      isExpanded: item.isExpanded,
                    );
                  }).toList(),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CalendarDatePicker(
                firstDate: DateTime(2019),
                initialDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 5)),
                onDateChanged: (date) {},
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
