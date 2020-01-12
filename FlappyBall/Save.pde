class Save {
  //int [] grade= new int [10];
  int grade[] = {5,5,5,5,5,5}; // init
  int startFromSave() {
    if(playername.equals("1") || playername.equals("2") || playername.equals("3") || playername.equals("4") || playername.equals("5")) {
      return 1;
    }
    return 0;
  }
  void save(int score) {
    if(startFromSave() == 1) {
      println(Integer.valueOf(playername));
      grade[Integer.valueOf(playername)] = score;
    }
  }
}
