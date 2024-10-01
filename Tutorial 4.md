Here’s a sample `README.md` based on the answers provided for Tutorial 04:

```md
# Advanced Database Management Systems - Tutorial 04

This document provides answers to the questions from **Tutorial 04** of the IS5110 - Advanced Database Management Systems course.

---

## Question 1: Database Architecture and System Catalog

1. **What is the ANSI-SPARC three-level architecture in database systems?**
   - The ANSI-SPARC architecture separates the database into three levels: 
     - **Internal Level**: Physical storage of data.
     - **Conceptual Level**: Structure of the entire database.
     - **External Level**: User or application-specific views.

2. **What is the difference between Logical and Physical Data Independence?**
   - **Logical Data Independence**: Changes in the conceptual schema do not affect external schemas or applications.
   - **Physical Data Independence**: Changes in physical storage do not affect the conceptual schema.

3. **What information is stored in the system catalog of a database?**
   - Metadata about database objects such as tables, columns, indexes, views, users, and permissions.

4. **How can you access the system catalog in MySQL?**
   - By querying the **`information_schema`** database in MySQL.

---

## Question 2: Database Security

1. **What is Database Security and why is it important?**
   - Database security protects the database from unauthorized access, corruption, or theft. It ensures data integrity and privacy.

2. **What are the two main types of database integrity?**
   - **Entity Integrity**: Ensures every table has a primary key.
   - **Referential Integrity**: Ensures foreign keys reference primary keys in other tables.

3. **What is the purpose of Access Control in database security?**
   - It limits who can view or modify data, preventing unauthorized actions.

4. **What are Discretionary Access Control (DAC) and Mandatory Access Control (MAC)?**
   - **DAC**: Data owners grant access to others.
   - **MAC**: Strict system-defined access policies enforced by the administrator.

5. **How do you grant and revoke privileges in SQL?**
   - **Grant privileges**:
     ```sql
     GRANT privilege_name ON object_name TO user_name;
     ```
   - **Revoke privileges**:
     ```sql
     REVOKE privilege_name ON object_name FROM user_name;
     ```

6. **What are some common threats to database security?**
   - SQL injection, unauthorized access, data breaches, malicious insiders, and malware.

7. **What measures can be taken to enhance database security?**
   - Strong authentication, encryption, regular audits, access controls, data masking, and software updates.

8. **What is the purpose of a database audit?**
   - To monitor and track database activities for security and compliance purposes.

9. **What is the role of a Database Administrator (DBA) in database security?**
   - The DBA manages database security, sets access permissions, monitors threats, and conducts audits.

---

## Question 3: Relational Algebra and Query Processing

1. **What is relational algebra, and what are the basic operations?**
   - Relational algebra is a procedural query language with basic operations such as:
     - **Selection (σ)**, **Projection (π)**, **Union (∪)**, **Set Difference (-)**, **Cartesian Product (×)**, and **Rename (ρ)**.

2. **What is a natural join, and how does it differ from a theta join?**
   - A **natural join** joins tables by automatically matching columns with the same names and data types.
   - A **theta join** uses a specific condition (not just equality) for joining tables.

3. **What is query optimization, and what are its main goals?**
   - Query optimization finds the most efficient way to execute a query, aiming to minimize response time and resource usage.

4. **What are the three main steps in query processing?**
   - **Parsing**, **Optimization**, and **Execution**.

5. **Explain cost-based query optimization with an example.**
   - Cost-based optimization chooses the execution plan with the lowest estimated cost. For example, using an index scan over a sequential scan if it’s more efficient for large datasets.

6. **What are some common join algorithms used in query processing?**
   - **Nested Loop Join**, **Hash Join**, and **Sort-Merge Join**.

7. **What is the role of the query optimizer in a DBMS?**
   - The query optimizer selects the most efficient execution plan by analyzing various alternatives and choosing the one with the lowest cost.

---

## License

This tutorial document is part of the **IS5110 - Advanced Database Management Systems** course at the **Faculty of Computing, Sabaragamuwa University of Sri Lanka**.
```

This `README.md` file provides clear and organized answers, suitable for documenting the tutorial content.