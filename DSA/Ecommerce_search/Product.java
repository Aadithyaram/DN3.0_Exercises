package Ecommerce_search;

public class Product {
    String productId;
    String productName;
    String category;

    public Product(String productId, String productName, String category) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
    }

    @Override
    public String toString() {
        return "[productId = " + productId + " , productName = " + productName + " , category = " + category + "]";
    }
}
