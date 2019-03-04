# SQL

## Setup

### Create a new instance

In command prompt type the following command

```bash
sqllocaldb create "<instanceName>"
sqllocaldb start "<instanceName>"
```

### Open the instance into Microsoft SQL Server Management Studio 2017

Once you open `Microsft SQL Server Management Studio 2017` the following window will appear

![open_a_instance](img/open_a_instance.JPG)

The important fields are:

- Server name: `LocalDb`\\<instanceName>
- Windows Authentication

### Create a new database

In the `Object Explorer` (right side), right click to see the `New Database` option

## ![create_new_database](img/create_new_database.JPG)

## Definition

SQL stands for `Structured Query Language` is a special-purpose programming language

## Purpose

- To manipulate sets of data
- Typically from a relational database
- ANSI and ISO standards

## Tables

### Create a new table

Click on the `New Query` button and then insert the following

```sql
create table Users(
	email varchar(50)
);
```

> Where
>
> - create table => means literally to create a new table
> - Users = > the table's name
>   - email => the column name
>     - varchar => that the content of the row will be of type character
>       - 50 = the row's length

Once you type the code, click on execute button, then right click over `Tables` folder to refresh the tables due to `SQL Server Management Studio` does not refresh automatically

To see the table created go to next path

`Databases` => *<*dataBaseName*>* => Tables 

![database_create_columns](img/database_create_columns.JPG)

### Delete a table

# Database

## Definition

- A database is
  - A container to help organize data
  - A way to efficiently store and retrieve data

## Relational model

A way to describe data and the relationships between data entities

> Database design is important, it controls the questions you can ask later
>
> `SQL` is the language you use to ask the questions



# Basic SQL Syntax

A `SQL` statement is an expression that tells a database what you want it to do

![basic_sql_syntax](img/basic_sql_syntax.JPG)

# SQL commands

## SELECT

> *SELECT* statement retrieves one or more rows from one or more tables

e.g

```sql
SELECT first_name, last_name FROM contacts;
```

Output:

| id   | first_name | last_name |
| ---- | ---------- | --------- |
| 1    | Jon        | Flanders  |

## INSERT

> Adds one or more rows into a table

e.g:

```sql
INSERT INTO contacts(first_name, last_name) VALUES("Fritz", "Onion");
```

Where `contacts` is the table to consult

Output:

| id   | first_name | last_name |
| ---- | ---------- | --------- |
| 1    | Jon        | Flanders  |
| 2    | Fritz      | Onion     |

## UPDATE

> Modifies one or more rows in a table

```sql
UPDATE contants SET last_name="Ahern" WHERE id=1;
```

Where `contacts` is the table to consult

## DELETE

> Removes one or more rows from one table

```sql
DELETE FROM contacts WHERE id = 2;
```

Where `contacts` is the table to consult