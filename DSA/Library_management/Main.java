package Library_management;

public class Main {
    public static void main(String[] args) {
        LibraryManagementSystem library = new LibraryManagementSystem(5);

        Book book1 = new Book("B001", "The Great Gatsby", "F. Scott Fitzgerald");
        Book book2 = new Book("B002", "To Kill a Mockingbird", "Harper Lee");
        Book book3 = new Book("B003", "1984", "George Orwell");

        library.add(book1);
        library.add(book2);
        library.add(book3);

        System.out.println("All Books:");
        library.traverse();

        System.out.println("Search Book by Title (Linear Search): '1984'");
        System.out.println(library.linearSearchByTitle("1984"));

        library.sortBooksByTitle();

        System.out.println("Search Book by Title (Binary Search): '1984'");
        System.out.println(library.binarySearchByTitle("1984"));
    }
}
