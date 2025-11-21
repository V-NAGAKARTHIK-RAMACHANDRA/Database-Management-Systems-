-- Question 9: TCL - Transaction Control and Rollback
-- Demonstrate the use of Transaction Control Language (TCL) commands. Perform a 
-- transaction that transfers 1000 from Alice's account to Bob's account, and then 
-- issue a ROLLBACK command to undo the transaction. Finally, display the table to 
-- confirm that balances remain unchanged.

-- Table:
-- accounts(accid, name, balance)

-- Solution:
-- Step 1: Display initial account balances
SELECT * FROM accounts;

-- Step 2: Start a transaction
BEGIN TRANSACTION;
-- For MySQL use: START TRANSACTION;

-- Step 3: Deduct 1000 from Alice's account
UPDATE accounts
SET balance = balance - 1000
WHERE name = 'Alice';

-- Step 4: Add 1000 to Bob's account
UPDATE accounts
SET balance = balance + 1000
WHERE name = 'Bob';

-- Step 5: Check balances during transaction
SELECT * FROM accounts;

-- Step 6: Rollback the transaction (undo all changes)
ROLLBACK;

-- Step 7: Display final balances (should be unchanged)
SELECT * FROM accounts;

-- Note: If we wanted to keep the changes, we would use COMMIT instead of ROLLBACK
-- COMMIT;
