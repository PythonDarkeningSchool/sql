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

## Working with Tables

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

To drop a table type the following content into a `New Query`

```sql
drop table Users;
```

> Where
>
> - Users => is the table's name

Same as above, refresh in order to update the content

## Primary Keys

### Integer Primary Key

`Primary key` gives an unique id in the table, e.g:

```sql
create table Users(
	Id Integer primary key
);
```

> Where
>
> - Id => is the name of the column
>   - Integer => is the type of data that will be in each row
>   - primary key => specifies explicitly that it would be a `primary key`

output:

![primary_key](img/primary_key.JPG)

### GUID Primary Keys

```sql
create table Users(
	Id uniqueidentifier primary key
);
```

output

![uniqueidentifier](img/uniqueidentifier.JPG)

### Incrementing primary key

The use of this is to increase the `Id` column into 1 when a new data would be inserted in the table

```sql
create table Users(
	Id integer primary key identity(1,1),
    email varchar(50)
);
```

> where:
>
> - identity -> the first `1` means that it will start from that number, the second `1` it means that the increment would be of `1`

### Incrementing GUID Primary Keys

```sql
create table Users(
	Id uniqueidentifier primary key default newid(),
    email varchar(50)
);
```



>  where:
>
> - default newid() => it's a built-in function that will return a new GUID like `75sdsad1-245dsadsa ...`

### Tangent: Choosing a key

- GUID cons
  - it's quite large
  - will take a space
- Integer cons
  - is limited to 2147483647 integers



The better options for big database is the GUID

### Composite Primary Keys

The following structure is know as `many to many relationships`

```sql
create table Users(
	Id integer primary key identity(1,1),
    email varchar(50) not null
);
create table Users_Roles(
	UserId integer,
    RoleId integer,
    primary key(UserId, RoleId)
);
create table Roles(
	Id integer primary key identity(1,1),
    Name varchar(50)
);
```

> Where:
>
> primary key(UserId, RoleId) => is to avoid duplicates in the table `Users_Roles`

## Defining columns

```sql
create table Users(
	Id integer primary key identity(1,1) not null,
    Email varchar(25) not null unique,
    MoneySpent decimal(10,2),
    CreateAt datetime not null,
    First varchar(25),
    Last varchar(25),
    Bio varchar(max)
);
```

> Where:
>
> not null => means that this fields is required and cannot be empty
>
> unique => means that this value cannot be repeated in the table
>
> decimal(10,2) => means that it will accept a maximum of 10 as length with 2 decimals (this will rounded any decimal)
>
> CreateAt datetime => You must specified a timestamp `00:00:00 00:00:00.000`
>
> Bio varchar(max)=> it will accept the maximum allowed length for characters in this cell

## Columns defaults

```sql
create table Users(
	Id integer primary key identity(1,1) not null,
    Email varchar(25) not null unique,
    MoneySpent decimal(10,2) default 0,
    CreateAt datetime not null default getdate(),
    First varchar(25),
    Last varchar(25),
    Bio varchar(max)
);
```

> Where:
>
> default 0 => means that if the user does not specify any value for this cell the default value will be 0
>
> default getdate() => means that if the user does not specify any date the default value will be the current date

 # Working with Data

## Inserting Data

```sql
insert into Users(Email, CreateAt, First, Last, Bio)
values("test@test.com", getdate(), "Test", "User", "Some person");
```

> Where:
>
> Insert into <tableName>(<columnName1>,<columnName1>)
>
> values => must be follow the order from above

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