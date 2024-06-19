import 'dart:io';
import 'dart:math';

List<List<int>> read() {
  File myFile = File("input.txt");
  List<String> content = myFile.readAsLinesSync();
  return content
      .map((e) => e.split(' ').map((num) => int.parse(num)).toList())
      .toList();
}

Map<int, List<int>> graph = {};
void main() {
  Map<int, int> clusterIndex = {};

  List<List<int>> clusters = [];
  List<List<int>> input = read();
  int n = input[0][0];
  if (n != 0) {
    for (int i = 1; i <= n; i++) {
      if (!graph.containsKey(input[i][0])) graph[input[i][0]] = [];
      graph[input[i][0]]!.add(input[i][1]);

      if (!graph.containsKey(input[i][1])) graph[input[i][1]] = [];
      graph[input[i][1]]!.add(input[i][0]);
    }
  }
  List<int> inCluster = [];
  for (int road in graph.keys) {
    if (!inCluster.contains(road)) {
      List<int> cluster = bfs(graph, road, []);
      clusters.add(cluster);
      for (int road in cluster) {
        clusterIndex[road] = clusters.length - 1;
      }
      inCluster += cluster;
    }
  }

  final outputFile = File('./output.txt').openWrite();
  for (int i = n + 2; i < input.length; i += 2) {
    Set<int> intersection = input[i + 1]
        .toSet()
        .intersection(clusters[clusterIndex[input[i][0]]!].toSet());
    String answer = intersection.join(' ');
    outputFile.writeln('${intersection.length} $answer');
  }
}

List<int> inClusterGlobal = [];

List<int> bfs(Map<int, List<int>> graph, int start, List<int> cluster) {
  if (inClusterGlobal.contains(start)) {
    return cluster;
  }
  cluster.add(start);
  inClusterGlobal.add(start);
  for (int road in graph[start]!) {
    if (!inClusterGlobal.contains(road)) {
      bfs(graph, road, cluster);
    }
  }
  return cluster;
}



// import 'dart:io';
// import 'dart:math';

// List<List<int>> read() {
//   File myFile = File("input.txt");
//   List<String> content = myFile.readAsLinesSync();
//   return content
//       .map((e) => e.split(' ').map((num) => int.parse(num)).toList())
//       .toList();
// }

// void main() {
//   Map<int, List<int>> clusterMap = {};
//   Map<int, List<int>> graph = {};
//   List<List<int>> input = read();
//   int n = input[0][0];
//   if (n != 0) {
//     for (int i = 1; i <= n; i++) {
//       if (!graph.containsKey(input[i][0])) graph[input[i][0]] = [];
//       graph[input[i][0]]!.add(input[i][1]);

//       if (!graph.containsKey(input[i][1])) graph[input[i][1]] = [];
//       graph[input[i][1]]!.add(input[i][0]);
//     }
//   }
//   List<int> inCluster = [];
//   for (int road in graph.keys) {
//     if (!inCluster.contains(road)) {
//       List<int> cluster = bfs(graph, road, []);
//       for (int road in cluster) {
//         if (!clusterMap.containsKey(road)) clusterMap[road] = [];
//         List<int> toadd = List<int>.from(cluster);
//         toadd.remove(road);
//         clusterMap[road] = clusterMap[road]! + cluster;
//       }
//       inCluster += cluster;
//     }
//   }

//   for (int i = n + 2; i < input.length; i += 2) {
//     Set<int> intersection =
//         input[i + 1].toSet().intersection(clusterMap[input[i][0]]!.toSet());
//     String answer = intersection.join(' ');
//     print('${intersection.length} $answer');
//   }
// }

// List<int> bfs(Map<int, List<int>> graph, int start, List<int> cluster) {
//   cluster.add(start);
//   for (int road in graph[start]!) {
//     if (!cluster.contains(road)) {
//       bfs(graph, road, cluster);
//     }
//   }
//   return cluster;
// }
