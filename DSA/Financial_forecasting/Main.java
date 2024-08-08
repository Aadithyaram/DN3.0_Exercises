package Financial_forecasting;

public class Main {
    public static void main(String[] args) {
        FinancialForecasting forecasting = new FinancialForecasting();

        double presentValue = 1000.0;
        double growthRate = 0.05; // 5% growth rate
        int periods = 10;

        double futureValue = forecasting.calculateFutureValue(presentValue, growthRate, periods);

        System.out.println("Future Value after " + periods + " periods: " + futureValue);
    }
}
