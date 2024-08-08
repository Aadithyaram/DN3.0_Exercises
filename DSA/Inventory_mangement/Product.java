package Inventory_mangement;


public class Product 
{   
    
    String productId;String productName;int quantity;double price;

Product(String productId,String productName,int quantity,double price)
{
    this.productId = productId;
    this.productName = productName;
    this.quantity = quantity;
    this.price = price;
}


@Override
public String toString() {
    return "[productId = " + productId + " , productName = " + productName + " , quantity = " + quantity
            + " , price = " + price + "]";
}
}