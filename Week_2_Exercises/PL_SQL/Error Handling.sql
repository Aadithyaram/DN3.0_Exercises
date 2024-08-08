
-- Scenario 1: Handle exceptions during fund transfers

CREATE OR REPLACE PROCEDURE SafeTransferFunds(p_from_account IN NUMBER, p_to_account IN NUMBER, p_amount IN NUMBER) IS
BEGIN
    BEGIN
        IF (SELECT Balance FROM Accounts WHERE AccountID = p_from_account) < p_amount THEN
            RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds');
        END IF;
        
        UPDATE Accounts SET Balance = Balance - p_amount WHERE AccountID = p_from_account;
        UPDATE Accounts SET Balance = Balance + p_amount WHERE AccountID = p_to_account;
        
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
            ROLLBACK;
    END;
END;
/
-- Scenario 2: Update employee salaries


CREATE OR REPLACE PROCEDURE UpdateSalary(p_employee_id IN NUMBER, p_percentage IN NUMBER) IS
BEGIN
    UPDATE Employees
    SET Salary = Salary * (1 + p_percentage / 100)
    WHERE EmployeeID = p_employee_id;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Employee ID not found');
    END IF;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END;
/
-- Scenario 3: Add new customer


CREATE OR REPLACE PROCEDURE AddNewCustomer(p_customer_id IN NUMBER, p_name IN VARCHAR2, p_dob IN DATE, p_balance IN NUMBER) IS
BEGIN
    BEGIN
        INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
        VALUES (p_customer_id, p_name, p_dob, p_balance, SYSDATE);
        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            -- Log error
            DBMS_OUTPUT.PUT_LINE('Error: Customer ID already exists');
            ROLLBACK;
    END;
END;
/