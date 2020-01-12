package work_20191212;

public class Good {
    String name;
    int price;
    public Good() {
    }
    public Good(String name, int price) {
        this.name = name;
        this.price = price;
    }
    public Good(Good t) {
        this.name = t.name;
        this.price = t.price;
    }
}