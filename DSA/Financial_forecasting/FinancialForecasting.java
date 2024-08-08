package Financial_forecasting;

public class FinancialForecasting {
    // Recursive method to calculate future value
    public double calculateFutureValue(double presentValue, double growthRate, int periods) {
        // Base case: if periods is 0, return the present value
        if (periods == 0) {
            return presentValue;
        }
        // Recursive case: apply growth rate and reduce periods
        return calculateFutureValue(presentValue * (1 + growthRate), growthRate, periods - 1);
    }
}
