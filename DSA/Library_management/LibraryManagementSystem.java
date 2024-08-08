package Library_management;

import java.util.Arrays;

public class LibraryManagementSystem {
    private Book[] books;
    private int size;

    public LibraryManagementSystem(int capacity) {
        books = new Book[capacity];
        size = 0;
    }

    // Add a book to the library
    public void add(Book book) {
        if (size < books.length) {
            books[size++] = book;
        } else {
            System.out.println("Library is full, cannot add more books.");
        }
    }

    // Implement linear search to find books by title
    public Book linearSearchByTitle(String title) {
        for (int i = 0; i < size; i++) {
            if (books[i].title.equals(title)) {
                return books[i];
            }
        }
        return null;
    }

    // Implement binary search to find books by title (assuming the list is sorted)
    public Book binarySearchByTitle(String title) {
        int left = 0;
        int right = size - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;
            int comparison = books[mid].title.compareTo(title);

            if (comparison == 0) {
                return books[mid];
            } else if (comparison < 0) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        return null;
    }

    // Sort books by title for binary search
    public void sortBooksByTitle() {
        Arrays.sort(books, 0, size, (b1, b2) -> b1.title.compareTo(b2.title));
    }

    // Traverse and print all books
    public void traverse() {
        for (int i = 0; i < size; i++) {
            System.out.println(books[i]);
        }
    }
}
