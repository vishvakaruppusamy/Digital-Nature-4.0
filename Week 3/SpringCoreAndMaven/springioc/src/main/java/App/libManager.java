public class libManager {
    private libraryDataSource libraryDataSource;

    // Setter for Spring to inject the dependency
    public void setLibraryDataSource(libraryDataSource libraryDataSource) {
        this.libraryDataSource = libraryDataSource;
    }

    public void displayBook() {
        System.out.println("Book: " + libraryDataSource.getBookTitle());
    }
}
