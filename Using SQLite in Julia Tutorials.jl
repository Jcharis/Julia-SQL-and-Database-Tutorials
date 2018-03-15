# Using SQLite in Julia
# Pkg.add("SQLite")

using SQLite

# Connecting /Creating a Database
SQLite.DB("EmploymentDB.db")


# Creating A Table inside the Database
SQLite.execute!(db,"CREATE TABLE IF NOT EXISTS workers( id REAL,name TEXT, age REAL,position TEXT)")

# Check for Avaliable tables
SQLite.tables(db)

# Inserting a Data
SQLite.execute!(db,"INSERT INTO workers(id,name,age,position) VALUES(1,'John',2,'Sales Manager')")


# Inserting Multiple Data
SQLite.execute!(db,"INSERT INTO workers(id,name,age,position) VALUES
    (2,'Jane',27,'Human Resource Manager'),
    (3,'Jesse',24,'IT Manager'),
    (4,'Paul',31,'Sales Manager'),
    (5,'Kofi',26,'IT Manager'),
    (6,'Peter',27,'Human Resource Manager'),
    (7,'Vlad',34,'Sales Manager'),
    (8,'Krishna',36,' Security'),
    (9,'Mary',23,'Secretary'),
    (10,'Ayo',30,'Sales Manager')
    ")

# Find the columns
SQLite.columns(db,"workers")


# Selecting /Reading from the DB
SQLite.query(db,"SELECT * FROM workers")


SQLite.query(db,"SELECT name FROM workers WHERE age = 24")


# Connecting to A Database File
db1 = SQLite.DB("chinook.db")

SQLite.tables(db1)

# Select All Data From Database
SQLite.query(db1,"SELECT * FROM artists")