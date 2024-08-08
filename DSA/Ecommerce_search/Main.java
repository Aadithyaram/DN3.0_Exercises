package Ecommerce_search;

public class Main {
    public static void main(String[] args) {
        Product[] products = {
            new Product("PD003", "Apple iPhone 13", "Smartphones"),
            new Product("PD001", "Samsung Galaxy S21", "Smartphones"),
            new Product("PD002", "OnePlus 9 Pro", "Smartphones"),
            new Product("PD004", "Google Pixel 6", "Smartphones")
        };

        Search search = new Search(products);

        // Linear Search
        Product foundProduct = search.linearSearch("PD002");
        System.out.println("Linear Search Result: " + foundProduct);

        // Binary Search
        search.sortProducts();  // Sort products for binary search
        foundProduct = search.binarySearch("PD002");
        System.out.println("Binary Search Result: " + foundProduct);
    }
}
