Custom reporting solution
=========================

This project is designed to pull in data from our Symphony Library Management system, as well as other open data sources, such as Ordnance Survey boundary lines, ONS deprivation statistics, and more.

Due to the nature of these additional sources, this solution is tailored to English public library reporting requirements. However, many aspects of it could be applicable to other library services as well.

What does it do?
----------------

SirsiDynix have plenty of options for reporting on library data held in the Symphony LMS.  However, with the need for greater control over reporting, and linking with other sources we have created a custom reporting database.

Supporting technologies
-----------------------

| Technology | Description |
| ---------- | ----------- |
| SirsiDynix Symphony | The Symphony Library Management system |
| Perl | Programming language used to write Symphony custom reports |
| PostgreSQL | An open source database technology  |
| PostGIS | Extensions to PostgreSQL to create databases with spatial capabilities |

Pre-requisites
--------------

- A Symphony library management system.
- A PosgreSQL database server with PostGIS extensions installed.

Build instructions
------------------

### Install the Symphony custom report

Symphony allows for custom report development as laid out in SirsiDynix API and Developer training materials.

This project includes a single file in the sym_scripts directory which will need to be installed as a custom report.  This can be run as often as is necessary for reporting requirements.  The suggestion is to run this once every day (overnight).

### Necessary files and folders

The database scripts rely on data being held in a set location on the C drive of the server being used to create the database.

The data should be set up as follows

| Directory\Files | Description |
| --------- | ----------- |
| c:\dbdata\symphony | Holds all the text files as created by the Symphony custom report. |
| c:\dbdata\os\postcodes.csv | Ordance Survey postcode data.  Can be found in the data directory of this repository |

### Creating the database

Copy this solution down to a directory onto the PostgreSQL server.  The following command, run within the db_sripts directory, will create the database for the first time, and import all the data.

```
"c:\program files\postgresql\9.6\bin\psql.exe" -U username -f db_create.sql
```

### Refreshing the database

The following command, run in the db_scripts directory will update the database with the latest Symphony data.  It does not completely recreate the database, just that which is necessary to do every night.

```
"c:\program files\postgresql\9.6\bin\psql.exe" -U username -f db_update.sql
```
