-- Scenario 1: Customer Management Package

CREATE OR REPLACE PACKAGE CustomerManagement AS
    PROCEDURE AddNewCustomer(p_customer_id IN NUMBER, p_name IN VARCHAR2, p_dob IN DATE, p_balance IN NUMBER);
    PROCEDURE UpdateCustomerDetails(p_customer_id IN NUMBER, p_name IN VARCHAR2, p_dob IN DATE);
    FUNCTION GetCustomerBalance(p_customer_id IN NUMBER) RETURN NUMBER;
END CustomerManagement;
/

CREATE OR REPLACE PACKAGE BODY CustomerManagement AS
    PROCEDURE AddNewCustomer(p_customer_id IN NUMBER, p_name IN VARCHAR2, p_dob IN DATE, p_balance IN NUMBER) IS
    BEGIN
        BEGIN
            INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
            VALUES (p_customer_id, p_name, p_dob, p_balance, SYSDATE);
            COMMIT;
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                DBMS_OUTPUT.PUT_LINE('Error: Customer ID already exists');
                ROLLBACK;
        END;
    END AddNewCustomer;
    
    PROCEDURE UpdateCustomerDetails(p_customer_id IN NUMBER, p_name IN VARCHAR2, p_dob IN DATE) IS
    BEGIN
        UPDATE Customers
        SET Name = p_name, DOB = p_dob, LastModified = SYSDATE
        WHERE CustomerID = p_customer_id;
        
        IF SQL%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Error: Customer ID not found');
            ROLLBACK;
        ELSE
            COMMIT;
        END IF;
    END UpdateCustomerDetails;
    
    FUNCTION GetCustomerBalance(p_customer_id IN NUMBER) RETURN NUMBER IS
        v_balance NUMBER;
    BEGIN
        SELECT Balance INTO v_balance FROM Customers WHERE CustomerID = p_customer_id;
        RETURN v_balance;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
    END GetCustomerBalance;
END CustomerManagement;
/
-- Scenario 2: Employee Management Package

CREATE OR REPLACE PACKAGE EmployeeManagement AS
    PROCEDURE HireEmployee(p_employee_id IN NUMBER, p_name IN VARCHAR2, p_position IN VARCHAR2, p_salary IN NUMBER, p_department IN VARCHAR2, p_hire_date IN DATE);
    PROCEDURE UpdateEmployeeDetails(p_employee_id IN NUMBER, p_name IN VARCHAR2, p_position IN VARCHAR2, p_salary IN NUMBER, p_department IN VARCHAR2);
    FUNCTION CalculateAnnualSalary(p_employee_id IN NUMBER) RETURN NUMBER;
END EmployeeManagement;
/

CREATE OR REPLACE PACKAGE BODY EmployeeManagement AS
    PROCEDURE HireEmployee(p_employee_id IN NUMBER, p_name IN VARCHAR2, p_position IN VARCHAR2, p_salary IN NUMBER, p_department IN VARCHAR2, p_hire_date IN DATE) IS
    BEGIN
        BEGIN
            INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
            VALUES (p_employee_id, p_name, p_position, p_salary, p_department, p_hire_date);
            COMMIT;
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                DBMS_OUTPUT.PUT_LINE('Error: Employee ID already exists');
                ROLLBACK;
        END;
    END HireEmployee;
    
    PROCEDURE UpdateEmployeeDetails(p_employee_id IN NUMBER, p_name IN VARCHAR2, p_position IN VARCHAR2, p_salary IN NUMBER, p_department IN VARCHAR2) IS
    BEGIN
        UPDATE Employees
        SET Name = p_name, Position = p_position, Salary = p_salary, Department = p_department
        WHERE EmployeeID = p_employee_id;
        
        IF SQL%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Error: Employee ID not found');
            ROLLBACK;
        ELSE
            COMMIT;
        END IF;
    END UpdateEmployeeDetails;
    
    FUNCTION CalculateAnnualSalary(p_employee_id IN NUMBER) RETURN NUMBER IS
        v_salary NUMBER;
    BEGIN
        SELECT Salary INTO v_salary FROM Employees WHERE EmployeeID = p_employee_id;
        RETURN v_salary * 12;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
    END CalculateAnnualSalary;
END EmployeeManagement;
/
-- Scenario 3: Account Operations Package

CREATE OR REPLACE PACKAGE AccountOperations AS
    PROCEDURE OpenNewAccount(p_account_id IN NUMBER, p_customer_id IN NUMBER, p_account_type IN VARCHAR2, p_balance IN NUMBER);
    PROCEDURE CloseAccount(p_account_id IN NUMBER);
    FUNCTION GetTotalBalance(p_customer_id IN NUMBER) RETURN NUMBER;
END AccountOperations;
/

CREATE OR REPLACE PACKAGE BODY AccountOperations AS
    PROCEDURE OpenNewAccount(p_account_id IN NUMBER, p_customer_id IN NUMBER, p_account_type IN VARCHAR2, p_balance IN NUMBER) IS
    BEGIN
        BEGIN
            INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
            VALUES (p_account_id, p_customer_id, p_account_type, p_balance, SYSDATE);
            COMMIT;
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                DBMS_OUTPUT.PUT_LINE('Error: Account ID already exists');
                ROLLBACK;
        END;
    END OpenNewAccount;
    
    PROCEDURE CloseAccount(p_account_id IN NUMBER) IS
    BEGIN
        DELETE FROM Accounts WHERE AccountID = p_account_id;
        
        IF SQL%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Error: Account ID not found');
            ROLLBACK;
        ELSE
            COMMIT;
        END IF;
    END CloseAccount;
    
    FUNCTION GetTotalBalance(p_customer_id IN NUMBER) RETURN NUMBER IS
        v_total_balance NUMBER;
    BEGIN
        SELECT SUM(Balance) INTO v_total_balance FROM Accounts WHERE CustomerID = p_customer_id;
        RETURN v_total_balance;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
    END GetTotalBalance;
END AccountOperations;
/