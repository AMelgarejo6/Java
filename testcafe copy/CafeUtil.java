import java.util.ArrayList;
public class CafeUtil {
    public int getStreakGoal(){
        int result = 0;
        for (int i = 0; i <= 10; i++){
            result = result + i;
        }
        System.out.println(result);
        return result;
    }

    public double getOrderTotal(double[] prices){
        double total = 0;
        for (int i = 0; i < prices.length; i++){
            total = total + prices[i];
        }
        return total;
    }

    public void displayMenu(ArrayList<String> menuItems){
        for(int i = 0; i < menuItems.size(); i++){
            System.out.println(i + " " + menuItems.get(i));
        }
    }

    public void addCustomer(ArrayList<String> customers){
        System.out.println("Please enter your name:");
        String userName = System.console().readLine();
        System.out.printf("Hello, %s!%n", userName);
        if(customers.size() == 1){
            System.out.printf("There is %d person in front of you %n", customers.size());
        }
        else{
            System.out.printf("There are %d people in front of you %n", customers.size());
        }
        customers.add(userName);
        System.out.println(customers);
    }
}