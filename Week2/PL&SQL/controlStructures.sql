BEGIN
  -- Scenario 1: Apply 1% discount for customers above 60
  FOR rec1 IN (
    SELECT c.CustomerID, l.LoanID, l.InterestRate
    FROM Customers c
    JOIN Loans l ON c.CustomerID = l.CustomerID
    WHERE c.Age > 60
  ) LOOP
    UPDATE Loans
    SET InterestRate = InterestRate - 1
    WHERE LoanID = rec1.LoanID;
  END LOOP;

  -- Scenario 2: Promote customers with balance > $10,000 to VIP
  FOR rec2 IN (
    SELECT CustomerID
    FROM Customers
    WHERE Balance > 10000
  ) LOOP
    UPDATE Customers
    SET IsVIP = 'TRUE'
    WHERE CustomerID = rec2.CustomerID;
  END LOOP;

  -- Scenario 3: Print reminders for loans due within 30 days
  FOR rec3 IN (
    SELECT l.LoanID, l.DueDate, c.Name
    FROM Loans l
    JOIN Customers c ON c.CustomerID = l.CustomerID
    WHERE l.DueDate <= SYSDATE + 30
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: Loan ID ' || rec3.LoanID || ' for customer ' || rec3.Name ||
                         ' is due on ' || TO_CHAR(rec3.DueDate, 'DD-MON-YYYY'));
  END LOOP;

  -- Commit all changes
  COMMIT;
END;
/
