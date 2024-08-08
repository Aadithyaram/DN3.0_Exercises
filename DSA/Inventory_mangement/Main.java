package Inventory_mangement;


public class Main {
    public static void main(String[] args) {
        Inventory inventory = new Inventory();

        Product product1 = new Product("PD001", "Samsung Galaxy S24", 30, 59000);
        Product product2 = new Product("PD002", "Oneplus 12R", 10, 43000);

        inventory.add(product1);
        inventory.add(product2);
        System.out.println(inventory);
        
        Product updatedProduct = new Product("PD001","Samsung Galaxy S24",25, 54999);
        inventory.update(updatedProduct);

        inventory.delete("PD002");

        System.out.println(inventory.getProduct("PD001"));
    }
}
