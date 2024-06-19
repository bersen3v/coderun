import 'dart:io';

List<List<dynamic>> read() {
  File myFile = File("input.txt");
  List<String> content = myFile.readAsLinesSync();
  return content
      .map((e) => e.split(' ').map((num) => int.tryParse(num) ?? num).toList())
      .toList();
}

Map<int, List<int>> greenRoads = {};
Map<int, List<int>> yellowRoads = {};
Map<int, List<int>> redRoads = {};

void main() {
  final input = read();
  final int n = input[0][0]; //goroda
  final int m = input[0][1]; //dorogi

  for (int i = 1; i <= m; i++) {
    final element = input[i];
    switch (element[2]) {
      case 'g':
        if (!greenRoads.containsKey(element[0])) {
          greenRoads[element[0]] = [];
        }
        greenRoads[element[0]]!.add(element[1]);
      case 'y':
        if (!yellowRoads.containsKey(element[0])) {
          yellowRoads[element[0]] = [];
        }
        yellowRoads[element[0]]!.add(element[1]);
      case 'r':
        if (!redRoads.containsKey(element[0])) {
          redRoads[element[0]] = [];
        }
        redRoads[element[0]]!.add(element[1]);
    }
  }

  for (final question in input.sublist(m + 2)) {
    print(searchRoad(question[0], question[1], 0) == true ? 1 : 0);
  }

  print(greenRoads);
  print(redRoads);
  print(yellowRoads);
}

bool searchRoad(int start, int end, int color) {
  Map map = {};

  switch (color) {
    case 0:
      map = greenRoads;
    case 1:
      map = yellowRoads;
    case 2:
      map = redRoads;
  }

  if (map.containsKey(start)) {
    for (int road in map[start]) {
      if (color != 2) {
        final res = searchRoad(road, end, color + 1);
        if (res) {
          return true;
        }
      } else {
        if (road == end) {
          return true;
        }
      }
    }
  }

  return false;
}
