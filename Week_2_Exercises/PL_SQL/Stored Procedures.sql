-- Scenario 1: 


CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
    FOR rec IN (SELECT AccountID, Balance FROM Accounts) LOOP
        UPDATE Accounts
        SET Balance = Balance * 1.01
        WHERE AccountID = rec.AccountID;
    END LOOP;
    
    COMMIT;
END;
/
-- Scenario 2:


CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(p_department IN VARCHAR2, p_bonus_percentage IN NUMBER) IS
BEGIN
    UPDATE Employees
    SET Salary = Salary * (1 + p_bonus_percentage / 100)
    WHERE Department = p_department;
    
    COMMIT;
END;
/
-- Scenario 3:

CREATE OR REPLACE PROCEDURE TransferFunds(p_from_account IN NUMBER, p_to_account IN NUMBER, p_amount IN NUMBER) IS
BEGIN
    IF (SELECT Balance FROM Accounts WHERE AccountID = p_from_account) < p_amount THEN
        RAISE_APPLICATION_ERROR(-20003, 'Insufficient balance');
    END IF;
    
    UPDATE Accounts SET Balance = Balance - p_amount WHERE AccountID = p_from_account;
    UPDATE Accounts SET Balance = Balance + p_amount WHERE AccountID = p_to_account;
    
    COMMIT;
END;
/