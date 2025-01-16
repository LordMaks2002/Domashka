import 'dart:io';
import 'package:csv/csv.dart';

void main() async {
  const fileName = 'data.csv';

  const data = [
    ['Name', 'Age'],
    ['Flatout 2', 2006],
    ['Command & Conquer™ 3: Kane’s Wrath', 2009],
    ['Call of Duty: Modern Warfare 3', 2011],
    ['ULTRAKILL', 2020],
    ['Mindustry', 2019],
  ];

  final file = File(fileName);

  if (await file.exists()) {
    String csvContent = await file.readAsString();
    final rows = const CsvToListConverter().convert(csvContent);
    for (var i = 1; i < rows.length; i++) {
      print(rows[i]);
    }
  } else {
    await file.writeAsString(const ListToCsvConverter().convert(data));
    print('$fileName created');
  }
}
