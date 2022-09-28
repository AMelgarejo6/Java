public class TestOrders{
    public static void main(String[] args){
        Item item1 = new Item("Java Coffee", 2.55);
        Item item2 = new Item("Covfefe", 4);
        Order order1 = new Order();
        Order order2 = new Order("John");
        order2.addItem(item1);
        order2.addItem(item2);
        System.out.println(order2.getOrderTotal(order2.getItems()));
        order2.display();
    }
}