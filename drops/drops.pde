import java.util.*;
int maxn = 20;
int flag = 0;
ArrayList<Wave> w = new ArrayList<Wave>();
Control c = new Control();
Stone s = new Stone();

void setup() {
	size(800, 600);
}

void draw() {
	background(0);
  for(int i = 0; i < maxn; i++) {
    w.add(new Wave((int)random(width), (int)random(height), (int)random(4)+4, (int)random(300)+80, (int)random(2)+1,  (int)random(50)+i*10));
    w.get(i).update();
    w.get(i).show();
    if (w.get(i).isEnd && i < c.n)  
      w.get(i).setValue((int)random(width), (int)random(height), (int)random(4)+4, (int)random(300)+80, (int)random(2)+1,  (int)random(50)+i*10);
  }
  c.getKeyboard();
  if(flag == 0 && s.init() == 1)
      flag = 1;
  if(flag == 1) {
    s.run();
    s.spread();
  }
}
