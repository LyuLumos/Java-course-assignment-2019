package work_20191212;

public class Save extends Thread{
    WareHouse wareHouse;
    public Save(WareHouse w) {
        this.wareHouse = w;
    }
    public void run() {
        wareHouse.saveGood();
    }
}