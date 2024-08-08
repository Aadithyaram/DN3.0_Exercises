-- Scenario 1: Generate monthly statements

DECLARE
    CURSOR c_transactions IS
        SELECT * FROM Transactions
        WHERE EXTRACT(MONTH FROM TransactionDate) = EXTRACT(MONTH FROM SYSDATE)
        AND EXTRACT(YEAR FROM TransactionDate) = EXTRACT(YEAR FROM SYSDATE);
BEGIN
    FOR rec IN c_transactions LOOP
        DBMS_OUTPUT.PUT_LINE('Statement for Account ' || rec.AccountID || ': ' || rec.TransactionType || ' of ' || rec.Amount);
    END LOOP;
END;
/

-- Scenario 2: Apply annual fee
DECLARE
    CURSOR c_accounts IS
        SELECT * FROM Accounts;
BEGIN
    FOR rec IN c_accounts LOOP
        UPDATE Accounts
        SET Balance = Balance - 25  -- Assuming a fee of $25
        WHERE AccountID = rec.AccountID;
    END LOOP;
    
    COMMIT;
END;
/

-- Scenario 3: Update loan interest rates
DECLARE
    CURSOR c_loans IS
        SELECT * FROM Loans;
BEGIN
    FOR rec IN c_loans LOOP
        UPDATE Loans
        SET InterestRate = InterestRate + 0.5  -- Assuming an increase of 0.5%
        WHERE LoanID = rec.LoanID;
    END LOOP;
    
    COMMIT;
END;
/