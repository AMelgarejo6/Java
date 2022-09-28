import java.util.ArrayList;
public class Order{
    public String name;
    public double total;
    public boolean ready;
    public ArrayList<Item> items = new ArrayList<Item>();

    public void addItem(Item item){
        this.items.add(item);
        total += item.price;
    }

    public void orderReady(){
        ready = true;
    }
}