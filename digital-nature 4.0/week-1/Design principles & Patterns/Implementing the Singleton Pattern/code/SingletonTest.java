public class SingletonTest {
    public static void main(String[] args) {
        Logger logger1 = Logger.getInstance();
        logger1.log("First Log  Message");

        Logger logger2 = Logger.getInstance();
        logger2.log("Second Log Message");

        if(logger1 == logger2){
            System.out.println("Singleton Pattern Verified");
        }else{
            System.out.println("Not Verified");
        }
    }
}
