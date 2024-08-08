package Ecommerce_search;

import java.util.Arrays;

public class Search {
    Product[] products;

    public Search(Product[] products) {
        this.products = products;
    }

    // Linear search implementation
    public Product linearSearch(String productId) {
        for (Product product : products) {
            if (product.productId.equals(productId)) {
                return product;
            }
        }
        return null;
    }

    // Binary search implementation
    public Product binarySearch(String productId) {
        int left = 0;
        int right = products.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;
            int comparison = products[mid].productId.compareTo(productId);

            if (comparison == 0) {
                return products[mid];
            } else if (comparison < 0) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return null;
    }

    // Sorting products by productId for binary search
    public void sortProducts() {
        Arrays.sort(products, (p1, p2) -> p1.productId.compareTo(p2.productId));
    }
}
