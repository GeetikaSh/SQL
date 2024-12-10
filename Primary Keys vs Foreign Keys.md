# Primary Key vs Foreign Key

## **Primary Key**
1. **Definition**: A primary key is a column (or a combination of columns) in a table that uniquely identifies each row in that table.
2. **Properties**:
   - **Unique**: Ensures that no two rows have the same value for the primary key column(s).
   - **Not Null**: Cannot contain `NULL` values.
   - **Single Instance**: A table can have only one primary key.
3. **Purpose**: To uniquely identify a record in the table and serve as the main reference point for relationships.
4. **Example**:
   ```sql
   CREATE TABLE Students (
       StudentID INT PRIMARY KEY,
       Name VARCHAR(100),
       Age INT
   );
```

## **Foreign Key**
1. **Definition**: A foreign key is a column (or a set of columns) in one table that establishes a relationship with the primary key of another table.
2. **Properties**:
  - **Referential Integrity**: The foreign key value in the child table must match a value in the primary key of the referenced table, or it can be NULL.
  - **Multiple Instances**: A table can have multiple foreign keys.
  - **On Actions**: Supports ON DELETE and ON UPDATE actions (e.g., cascade or restrict).
3. **Purpose**: To enforce and maintain relationships between tables.
4. **Example**:
   ```sql
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseCode VARCHAR(10),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseCode) REFERENCES Courses(CourseCode)
);
```

## Key Differences

| **Aspect**         | **Primary Key**                            | **Foreign Key**                            |
|---------------------|--------------------------------------------|--------------------------------------------|
| **Purpose**         | Uniquely identifies records in a table.    | Creates a link between two tables.         |
| **Uniqueness**      | Must be unique and not null.               | Can have duplicates and null values.       |
| **Number per Table**| Only one per table.                        | Can have multiple foreign keys.            |
| **Location**        | Defined in the same table.                 | Refers to a primary key in another table.  |
| **Enforcement**     | Enforces entity integrity.                 | Enforces referential integrity.            |
| **Null Values**     | Cannot contain `NULL`.                     | Can allow `NULL` if not mandatory.         |

## **Practical Example**

- **Tables**: Students and Enrollments  
- **Primary Key**: `StudentID` in the `Students` table uniquely identifies a student.  
- **Foreign Key**: `StudentID` in the `Enrollments` table references `Students`, creating a relationship.

```sql
-- Primary Key Example
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100)
);

-- Foreign Key Example
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
```

## **Summary**
**Primary Key**: Ensures the uniqueness of rows within a table.

**Foreign Key**: Establishes relationships between tables and enforces referential integrity.
