# -fsn--Framework
FiveM Reborn framework by JamesSc0tt.

## Requirements and setup
*If you are running a server, ensure your ports are either **NOT** forwarded or the queue system has been confiugured to only allow you to join the server.*

## Requirements
- x86-64 system running Linux or Windows (7/2008 R2+), decent upstream connection.
- FiveM Reborn Server
- Local/Remote MySQL database server
- At **LEAST** 4GB disk space (including room for future updates) 

### MySQL server
Install XAMMP to your computer and load up the control panel, once that has loaded click start on Apache & MySQL **ONLY**, for performance reasons, this is all that is required to run the :FSN: Framework.
Load up http://localhost/phpmyadmin and import the latest SQL backup, once that has done add the following to your fsn_server.cfg:
```
set mysql_connection_string "server=127.0.0.1;database={DATABASE_NAME};userid={USERNAME};password={PASSWORD}"
```
*Replace {DATABASE_NAME}, {USERNAME}, {PASSWORD} with the details of your local database.*

### Setting up your local server
This is simple, download the latest FiveM Reborn server from the FiveM documenation site, then **REPLACE** all the resources with the ones from this GitHub. Then edit your fsn_server.cfg to include the requirements in /cfg_config.
