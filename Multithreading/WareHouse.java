package work_20191212;

import java.util.*;

public class WareHouse {
    Good g;
    Scanner in = new Scanner(System.in);
    List list = new ArrayList<Good>();
    int cnt;
    boolean flag = true;

    public WareHouse() {
    }
    public WareHouse(int cnt) {
        this.cnt = cnt;
    }
    
    public synchronized void saveGood() {
        if(flag == false) {
            try {
                wait();
            } catch (InterruptedException e){
                e.printStackTrace();
            }
        }
        for (int i = 0; i < cnt; i++) {
            String n;
            int p;
            System.out.println("pls input no." + (i+1) + " good's name:");
            n = in.next();
            System.out.println("pls input its price:");
            p = in.nextInt();
            g = new Good(n, p);
            list.add(g);

        }
        // System.out.println("----");
        // System.out.println(list.size());
        // System.out.println("----");
        flag = false;
        notify();
    }
    public synchronized void takeGood() {
        // System.out.println("SIZE = " + list.size());
        if(flag == true) {
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        for (int i = 0; i < list.size(); i++) {
            // System.out.println("Running");
            g = (Good) list.get(i);
            System.out.println("Good " + g.name + "'s price is " + g.price);
        }
        flag = true;
        notify();
    }
}