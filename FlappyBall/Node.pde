String playername = "TestPlayer";
class Node {
  Map<String, Integer> map = new HashMap<String, Integer>();
  List<Map.Entry<String, Integer>> mapList = new ArrayList<Map.Entry<String, Integer>>();
  int k;
  int i;
  Node(int n) {
    k = n; 
  }
  void show() {
    String wel = "Rank";
    text(wel, width-100, 80);
    i = 1;
    for (Map.Entry<String, Integer> entry : mapList) {
      i++;
      //System.out.println(entry.getKey() + " : " + entry.getValue());
      text(entry.getKey() + ": " + entry.getValue(), width-100, i*15+100);
    }
  }
  void inserttoMap(int score) {
      sa.save(score);
      map.put(playername, score);
      mapList.clear();
      mapList.addAll(map.entrySet());
      ValueComparator valueComparator = new ValueComparator();
      Collections.sort(mapList, valueComparator);
      o.init();
      for(int i = 1; i <= 5; i++) {
        o.cout(String.valueOf(sa.grade[i]));
      }
      for (Map.Entry<String, Integer> entry : mapList) {
          o.cout(entry.getKey());
          o.cout(String.valueOf(entry.getValue()));
      }
  }
}

private static class ValueComparator implements Comparator<Map.Entry<String, Integer>> {
  @Override
  public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
      return o2.getValue() - o1.getValue();
  }
}

  //void insert(int score) { //We need to print the ranklist each round, the time complexity of quick sort is O(nlogn), 
                             //but the complexity of ranking with brute force is O(n)
  //  if(k == 1) {
  //    data[k] = score;
  //    name[k] = "Player" + String.valueOf(k);
  //    return;
  //  }
  //  int pos = k;
  //  for(int i = 1; i < k; i++) {
  //    if(score > data[i]) {
  //      pos = i;
  //      break;
  //    }
  //  }
  //  for(int i = k-1; i >= pos; i--) {
  //    data[i+1] = data[i];
  //    name[i+1] = name[i];
  //  }
  //  data[pos] = score;
  //  name[pos] = "Player" + String.valueOf(k);
  //}
