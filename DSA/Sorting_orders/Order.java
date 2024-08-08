package Sorting_orders;

public class Order {
    String orderId;
    String customerName;
    double totalPrice;

    public Order(String orderId, String customerName, double totalPrice) {
        this.orderId = orderId;
        this.customerName = customerName;
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "[orderId = " + orderId + ", customerName = " + customerName + ", totalPrice = " + totalPrice + "]";
    }
}