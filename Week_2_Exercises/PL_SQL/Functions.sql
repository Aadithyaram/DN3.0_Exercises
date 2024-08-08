-- Scenario 1: Calculate age

CREATE OR REPLACE FUNCTION CalculateAge(p_dob IN DATE) RETURN NUMBER IS
BEGIN
    RETURN FLOOR(MONTHS_BETWEEN(SYSDATE, p_dob) / 12);
END;
/
-- Scenario 2: Calculate monthly installment


CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment(p_loan_amount IN NUMBER, p_interest_rate IN NUMBER, p_loan_duration IN NUMBER) RETURN NUMBER IS
    v_monthly_rate NUMBER;
    v_number_of_months NUMBER;
BEGIN
    v_monthly_rate := p_interest_rate / 12 / 100;
    v_number_of_months := p_loan_duration * 12;
    
    RETURN (p_loan_amount * v_monthly_rate) / (1 - POWER(1 + v_monthly_rate, -v_number_of_months));
END;
/
-- Scenario 3: Check if balance is sufficient

CREATE OR REPLACE FUNCTION HasSufficientBalance(p_account_id IN NUMBER, p_amount IN NUMBER) RETURN BOOLEAN IS
    v_balance NUMBER;
BEGIN
    SELECT Balance INTO v_balance FROM Accounts WHERE AccountID = p_account_id;
    
    RETURN v_balance >= p_amount;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END;
/