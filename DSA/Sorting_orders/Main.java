package Sorting_orders;


import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        Order[] orders = {
            new Order("OR001", "Aadi", 250.75),
            new Order("OR002", "Jude", 150.50),
            new Order("OR003", "Venkat", 300.20),
            new Order("OR004", "Dem", 100.90)
        };

        SortOrders sortOrders = new SortOrders();

        
        sortOrders.bubbleSort(orders);
        System.out.println("Bubble Sort Result: " + Arrays.toString(orders));

        
        Order[] ordersForQuickSort = {
            new Order("OR001", "Aadi", 250.75),
            new Order("OR002", "Jude", 150.50),
            new Order("OR003", "Venkat", 300.20),
            new Order("OR004", "Dem", 100.90)
        };
        sortOrders.quickSort(ordersForQuickSort, 0, ordersForQuickSort.length - 1);
        System.out.println("Quick Sort Result: " + Arrays.toString(ordersForQuickSort));
    }
}
