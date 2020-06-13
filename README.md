# CodeClan 1. project, Spending tracker

## About

A Ruby web application allows users to track their spendings by managing categories, merchants and transactions. 

## Required installations
- PostgreSql
- Ruby
- Sinatra
- PG gem


## Run Application

In order to run it the following actions in terminal are necessary (from the root folder):

1. createdb spending_tracker
2. psql -d spending_tracker -f db/spending_tracker.sql
3. ruby db/seeds.rb
4. ruby app.rb

The app should then be accessible in the browser through http://localhost:4567/
