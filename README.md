# Project Setup

This guide will help you set up and run the project on your local machine.

## Prerequisites

- Ruby: 3.3.5
- PostgreSQL

## Steps to Setup and Run the Rails Project

1. **Clone the Repository**
   ```bash
   git clone https://github.com/georgeMaharjan/contact_manager.git
   cd contact_manager
   ```
2. **Update database.yml**
   ```yaml
   username: your-user-name
   password: your-password
   ```
3. **Run Migration and Seed**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```
4. **Run rails server**
   ```bash
   rails s
   ```
