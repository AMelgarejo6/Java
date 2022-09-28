import java.util.ArrayList;

public class Order{
    private String name;
    private boolean ready;
    private ArrayList<Item> items = new ArrayList<Item>(); //Initialize empty list

    // CONSTRUCTOR
    // No arguments, sets name to "Guest", initializes items as an empty list.
    public Order(){
        this.name = "Guest";
    }
    
    // OVERLOADED CONSTRUCTOR
    // Takes a name as an argument, sets name to this custom name.
    // Initializes items as an empty list.
    public Order(String name){
        this.name = name;
    }

    // ORDER METHODS
    public void addItem(Item item){
        this.items.add(item);
        // System.out.println(item.getPrice()); how to show the price of each instance
    }

    public String getStatusMessage(){
        if(this.getReady()){
            return "Your order is ready.";
        }
        else{
            return "Thank you for waiting. Your order will be ready soon.";
        }
    }

    public double getOrderTotal(ArrayList<Item> items){
        double total = 0;
        for (int i = 0; i < items.size(); i++){
            total += items.get(i).getPrice(); // HOW TO ACCESS OBJECT LIST PRIVATE DATA V IMPORTANT!!!!!
        }
        return total;
    }

    public void display(){
        System.out.println(this.name);
        for (int i = 0; i < this.items.size(); i++){
            System.out.println(items.get(i).getName() + " - " + items.get(i).getPrice());
        }
        System.out.println(getOrderTotal(this.items));
    }

    // GETTERS & SETTERS
    public String getName(){
        return this.name;
    }

    public void setName(String name){
        this.name = name;
    }

    public ArrayList<Item> getItems(){
        return this.items;
    }

    public boolean getReady(){
        return this.ready;
    }

    public void changeReady(){
        if(this.ready){
            ready = false;
        }
        else{
            ready = true;
        }
    }
}