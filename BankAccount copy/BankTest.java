public class BankTest{
    public static void main(String[] args){
        BankAccount bankaccount1 = new BankAccount(100, 100);
        System.out.println(bankaccount1.getSavingsBalance());
        bankaccount1.withdraw("savings", 105);
        System.out.println(bankaccount1.getSavingsBalance());
        System.out.println(bankaccount1.getallMoneyInBank());
    }
}