package work_20191212;

import java.util.*;

public class work_20191212 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("pls input the warehouse's capacity");
        int i = in.nextInt();
        WareHouse wareHouse = new WareHouse(i);
        Thread saveGood = new Save(wareHouse);
        Thread takeGood = new Take(wareHouse);

        saveGood.start();
        takeGood.start();
    }
}