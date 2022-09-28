import java.util.ArrayList;

public class BankAccount{
    private double checkingBalance = 0;
    private double savingsBalance = 0;
    public static int numberOfAccounts = 0;

    public static double allMoneyInBank = 0;

    //CONSTRUCTOR
    public BankAccount(double checkingBalance, double savingsBalance){
        this.checkingBalance = checkingBalance;
        this.savingsBalance = savingsBalance;
        numberOfAccounts++;
    }

    //GETTERS AND SETTERS
    public double getCheckingBalance(){
        return this.checkingBalance;
    }
    public double getSavingsBalance(){
        return this.savingsBalance;
    }

    public double getallMoneyInBank(){
        return this.savingsBalance + this.checkingBalance;
    }

    public void addBalance(String account, double balance){
        if(account == "checking"){
            this.checkingBalance += balance;
        }
        else if(account == "savings"){
            this.savingsBalance += balance;
        }
    }

    public void withdraw(String account, double balance){
        if(account == "checking"){
            if (!(this.checkingBalance < balance)){
                System.out.println("Insufficient funds.");
            }
            else{
                this.checkingBalance -= balance;
            }
        }
        else if(account == "savings"){
            if (!(this.savingsBalance < balance)){
                this.savingsBalance -= balance;
            }
        }
    }
}