package Library_management;

public class Book {
    String bookId;
    String title;
    String author;

    public Book(String bookId, String title, String author) {
        this.bookId = bookId;
        this.title = title;
        this.author = author;
    }

    @Override
    public String toString() {
        return "[bookId = " + bookId + ", title = " + title + ", author = " + author + "]";
    }
}
