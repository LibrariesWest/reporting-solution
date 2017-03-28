# Symphony scripts

The database load process for this reporting solution consists of a series of database scripts to pull data out of the Symphony database and store in it text files (1 text file per database table).  These text files are then used in the creation of the custom reporting database.

The report will create a series of files to be stored in the Xfer directory of the Symphony server.

## Prerequisites

- A Symphony library management system.

## Files

| File | Description |
| ---- | ----------- |
| lwcustomreportsdb.pl | The custom report file.  This should be installed on the Symphony server |

## Install instructions

Installing the custom report are as per Sirsi Dynix instructions for creating new reports within Symphony.

## Frequency

It is up to the library service implementing this functionality as to how often they wish to run the report.  The report can be scheduled using the normal Sirsi Dynix WorkFlows report scheduler.