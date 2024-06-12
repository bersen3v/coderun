import 'dart:io';

List<List<int>> read() {
  File myFile = File("input.txt");
  List<String> content = myFile.readAsLinesSync();
  return content
      .map((e) => e.split(' ').map((num) => int.parse(num)).toList())
      .toList();
}

void main() {
  List<List<int>> content = read();
  List<int> nm = content[0];
  int n = nm[0];

  Map<int, Set<int>> map = {};
  List<int> notRome = [];
  bool answer = false;
  for (List<int> road in content.skip(1)) {
    notRome.add(road[0]);
    if (!map.containsKey(road[1])) map[road[1]] = {};
    map[road[1]]!.add(road[0]);
    if (map[road[1]]!.length == n - 1 && !notRome.contains(road[1])) {
      print(road[1]);
      answer = true;
      break;
    }
  }
  if (!answer) print(-1);
}
