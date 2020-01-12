package work_20191212;

public class Take extends Thread {
    WareHouse wareHouse;
    public Take(WareHouse w) {
        this.wareHouse = w;
    }
    public void run() {
        wareHouse.takeGood();
    }
}