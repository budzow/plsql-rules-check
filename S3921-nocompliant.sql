CREATE OR REPLACE PROCEDURE test_procedure IS
  foo VARCHAR2(4);
BEGIN
  BEGIN
    foo := 'abcdeghij'; -- foo cannot be assigned such a big value
  EXCEPTION
    WHEN VALUE_ERROR THEN
      DBMS_OUTPUT.PUT_LINE('Error: Value too large for variable "foo".');
  END;
END;

CREATE TABLE Persons
(
  Id   NUMBER,
  Name VARCHAR2(4)
);

INSERT INTO Persons (Id, Name) VALUES (1, 'Alice'); -- Noncompliant, raises ORA-12899

CREATE OR REPLACE PROCEDURE sp1
IS
  foo VARCHAR2(2);
BEGIN
  SELECT Name INTO foo FROM Persons WHERE Id = 1; -- Noncompliant, may raise ORA-06502
END;