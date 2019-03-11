USE informationTechnology
GO
	CREATE TABLE Departament(
		number INTEGER PRIMARY KEY IDENTITY(1, 1),
		name VARCHAR(50) NOT NULL,
		location VARCHAR(50) NOT NULL
	);

	CREATE TABLE Employee(
		number INTEGER PRIMARY KEY IDENTITY(1, 1),
		name VARCHAR(50) NOT NULL,
		departamentNumber INTEGER NOT NULL,
		CONSTRAINT [FK_Employee_departamentNumber_Departament_number]  FOREIGN KEY(departamentNumber) REFERENCES Departament(number),
		hiredate DATE NOT NULL
	);
GO