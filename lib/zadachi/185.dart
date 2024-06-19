import 'dart:io';
import 'dart:math';

List<List<int>> read() {
  File myFile = File("input.txt");
  List<String> content = myFile.readAsLinesSync();
  return content
      .map((e) => e.split(' ').map((num) => int.parse(num)).toList())
      .toList();
}

void main() {
  Map<int, List<int>> answerMap = {};
  List<List<int>> input = read();
  int n = input[0][0];

  List<int> dogSize = input[1];
  List<int> wearSize = input[2];

  for (int i = 0; i < dogSize.length; i++) {
    List<int> newDogSize = replaceList(dogSize, i);
    int answer = count(newDogSize, wearSize);
    if (!answerMap.containsKey(answer)) answerMap[answer] = [];
    answerMap[answer]!.add(i);
  }
  int minimal = answerMap.keys.reduce(min);
  int start = answerMap[minimal]!.reduce(min);
  print('${start + 1} $minimal');
}

int count(List<int> dogSize, List<int> wearSize) {
  int answer = 0;
  for (int i = 0; i < dogSize.length; i++) {
    // print('dogsize ${dogSize[i]}, wearsize ${wearSize[i]}');
    if (dogSize[i] > wearSize[i]) {
      answer += 0;
    } else if (wearSize[i] - dogSize[i] <= 100) {
      answer += ((wearSize[i] - dogSize[i]) ~/ 2);
    } else {
      answer += 30;
    }
  }
  return answer;
}

List<int> replaceList(List<int> dogSize, int index) {
  return dogSize.sublist(index, dogSize.length) + dogSize.sublist(0, index);
}
