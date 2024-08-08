
-- Scenario 1: Apply discount to loan interest rates


BEGIN
    FOR rec IN (SELECT LoanID, InterestRate FROM Loans l
                JOIN Customers c ON l.CustomerID = c.CustomerID
                WHERE EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM c.DOB) > 60) LOOP
        UPDATE Loans
        SET InterestRate = InterestRate - 1
        WHERE LoanID = rec.LoanID;
    END LOOP;
    
    COMMIT;
END;
/
-- Scenario 2: Promote customers to VIP status


BEGIN
    FOR rec IN (SELECT CustomerID FROM Customers
                WHERE Balance > 10000) LOOP
        UPDATE Customers
        SET IsVIP = TRUE
        WHERE CustomerID = rec.CustomerID;
    END LOOP;
    
    COMMIT;
END;
/
-- Scenario 3: Send reminders for loans due in 30 days


BEGIN
    FOR rec IN (SELECT c.Name, l.LoanID, l.EndDate
                FROM Loans l
                JOIN Customers c ON l.CustomerID = c.CustomerID
                WHERE l.EndDate BETWEEN SYSDATE AND SYSDATE + 30) LOOP
        DBMS_OUTPUT.PUT_LINE('Reminder: Loan ' || rec.LoanID || ' for customer ' || rec.Name || ' is due on ' || rec.EndDate);
    END LOOP;
END;
/