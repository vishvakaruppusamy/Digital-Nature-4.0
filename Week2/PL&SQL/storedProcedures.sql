-- 1. Add 1% interest to all savings accounts
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
  UPDATE Accounts
  SET Balance = Balance + (Balance * 0.01)
  WHERE AccountType = 'SAVINGS';
  COMMIT;
END;
/

-- 2. Add bonus to employees in a department
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
  dept_id IN NUMBER,
  bonus_percent IN NUMBER
) IS
BEGIN
  UPDATE Employees
  SET Salary = Salary + (Salary * bonus_percent / 100)
  WHERE DepartmentID = dept_id;
  COMMIT;
END;
/

-- 3. Transfer money between two accounts
CREATE OR REPLACE PROCEDURE TransferFunds(
  from_acc IN NUMBER,
  to_acc IN NUMBER,
  amount IN NUMBER
) IS
  from_balance NUMBER;
BEGIN
  SELECT Balance INTO from_balance
  FROM Accounts
  WHERE AccountID = from_acc
  FOR UPDATE;

  IF from_balance < amount THEN
    RAISE_APPLICATION_ERROR(-20001, 'Not enough balance.');
  END IF;

  UPDATE Accounts SET Balance = Balance - amount WHERE AccountID = from_acc;
  UPDATE Accounts SET Balance = Balance + amount WHERE AccountID = to_acc;

  COMMIT;
END;
/
