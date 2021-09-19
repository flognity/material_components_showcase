import 'package:flutter/material.dart';

class DataTableShowcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text('Name'),
        ),
        DataColumn(
          label: Text('Age'),
        ),
        DataColumn(
          label: Text('Role'),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Alfred')),
            DataCell(Text('33')),
            DataCell(Text('Office Worker')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Jimmy')),
            DataCell(Text('22')),
            DataCell(Text('Student')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Marcus')),
            DataCell(Text('55')),
            DataCell(Text('Head of Department')),
          ],
        ),
      ],
    );
  }
}
