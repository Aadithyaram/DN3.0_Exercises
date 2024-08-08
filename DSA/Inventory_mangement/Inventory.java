package Inventory_mangement;

import java.util.HashMap;

public class Inventory {
    HashMap<String, Product> products;

    public Inventory() {
        this.products = new HashMap<>();
    }

    

    public void add(Product product) {
        if (products.containsKey(product.productId))
            System.out.println("Item already added, try updating it");
        else
            products.put(product.productId, product);

    }
    public void update(Product product) {
        if (products.containsKey(product.productId)) {
            products.put(product.productId, product);
        } else {
            System.out.println("Product not found");
        }
    }

    public void delete(String productId) {
        if (products.containsKey(productId)) {
            products.remove(productId);
        } else {
            System.out.println("Product not found");
        }
    }

    public Product getProduct(String productId) {
        return products.get(productId);
    }

    @Override
    public String toString() {
        return "Inventory [ " + products +" ]";


}
}
