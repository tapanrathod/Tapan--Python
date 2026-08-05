# 🐍 Master Python, Data Analysis & MySQL

Welcome to the **Master Python, Data Analysis & MySQL** repository! This repository serves as a comprehensive, end-to-end learning path and practical reference for Python programming, Data Analysis (NumPy & Pandas), and Database Engineering using MySQL.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Repository Architecture](#repository-architecture)
- [Modules & Course Outline](#modules--course-outline)
  - [1. Core & Advanced Python](#1-core--advanced-python)
  - [2. Data Analysis with Pandas & NumPy](#2-data-analysis-with-pandas--numpy)
  - [3. MySQL Database Engineering](#3-mysql-database-engineering)
- [Datasets Included](#datasets-included)
- [Prerequisites & Setup](#prerequisites--setup)
- [How to Use This Repository](#how-to-use-this-repository)
- [License & Terms of Use](#license--terms-of-use)

---

## 🔍 Overview

This workspace contains structured lecture scripts, practice exercises, notebooks, query files, and real-world datasets designed to build strong foundations and advanced proficiency in software development, data manipulation, and relational database management.

---

## 📁 Repository Architecture

```text
Tapan---Python/
├── python_lectures/       # Core Python tutorials (Basics to OOPS & Database integration)
├── python_practice/       # Practice sets, exercises, and solution files
├── pandas_lecture/        # Pandas lectures, Jupyter Notebooks, and datasets
├── pandas_practice/       # Topic-wise Pandas practice questions & datasets
├── numpy/                 # NumPy array creation, manipulation, and practice
├── mysql/                 # MySQL lectures, join/subquery notes, and SQL practice sets
│   ├── MySQL Lectures/    # SQL scripts covering basics to subqueries & joins
│   ├── MySQL Practice/    # SQL practice sets with detailed Q&A
│   └── notes/             # Markdown documentation on SQL topics
├── .gitignore             # Git ignore rules for environments and IDE files
└── LICENCE.md             # Proprietary Software License & Terms of Use
```

---

## 🛠️ Modules & Course Outline

### 1. Core & Advanced Python (`python_lectures/` & `python_practice/`)

- **Basics & Syntax:** Introduction, Variables, Data Types, Operators, User Input, Conditionals (`if-else`), and Loops (`for`, `while`).
- **Data Structures:** Lists, Dictionaries, Tuples, and Sets.
- **Functional Programming:** Functions, Lambda Expressions, Recursion, and Generators.
- **Object-Oriented Programming (OOP):**
  - Classes, Objects, and Instance Methods
  - Constructors (`__init__`)
  - Inheritance (Single, Multiple, Multilevel)
  - Abstraction & Abstract Base Classes
  - Method Overriding & Polymorphism
- **Advanced Utilities:**
  - File Handling (`.txt`, `.csv`)
  - Exception & Error Handling
  - Modules & Imports
  - Datetime operations
  - MySQL Database Connectivity (`mysql-connector-python`)

---

### 2. Data Analysis with Pandas & NumPy (`pandas_lecture/`, `pandas_practice/`, `numpy/`)

- **NumPy:**
  - Array creation methods (`array`, `arange`, `zeros`, `ones`, etc.)
  - Vectorized operations, indexing, and slicing
- **Pandas Core:**
  - Reading data (`.csv`, `.xlsx`, `.json`)
  - Series & DataFrame creation
  - Column creation, transformation, and deletion
- **Data Manipulation & Aggregation:**
  - GroupBy operations & custom aggregations
  - Pivot tables & Cross-tabulations
  - Merging, joining, and appending DataFrames
  - Data cleaning & handling missing values

---

### 3. MySQL Database Engineering (`mysql/`)

- **DDL & DML Commands:** Table creation, Alter queries, and constraints (`PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`).
- **Built-in Functions:**
  - String Functions (`CONCAT`, `SUBSTRING`, `LENGTH`, etc.)
  - Numeric & Datetime Functions
  - Aggregate Functions (`SUM`, `AVG`, `COUNT`, `MIN`, `MAX`)
- **Query Optimization & Data Analysis:**
  - `GROUP BY`, `HAVING`, and `ORDER BY` clauses
  - Table Joins (Inner, Left, Right, Full, Cross)
  - Subqueries (Scalar, Multi-row, Correlated)
  - Indexing and Database Metadata

---

## 📊 Datasets Included

The repository contains diverse datasets for practical analysis:
- **`employee_dataset`** (CSV, JSON, Excel): Employee metrics, salaries, and performance.
- **`orders`, `orders2`, `all_orders`, `customers`, `payments`**: E-commerce transactional analysis.
- **`indian movies.csv`**: Movie analytics dataset for filtering and group-by exercises.
- **`sales_data.csv`**: Business intelligence sales performance metrics.

---

## ⚡ Prerequisites & Setup

### Requirements
- **Python 3.10+** (Tested with Python 3.14)
- **MySQL Server 8.0+**
- **Jupyter Notebook** or **VS Code**

### Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/Tapan---Python.git
   cd Tapan---Python
   ```

2. **Create and Activate a Virtual Environment:**
   ```bash
   python -m venv .venv
   
   # On Windows (PowerShell)
   .\.venv\Scripts\Activate.ps1
   
   # On Linux / macOS
   source .venv/bin/activate
   ```

3. **Install Required Packages:**
   ```bash
   pip install pandas numpy openpyxl mysql-connector-python jupyter
   ```

---

## 🚀 How to Use This Repository

1. **For Learning Python:** Start in `python_lectures/` sequentially from `01_introduction.py` to OOPs and database connectivity.
2. **For Practicing Python:** Solve exercises located in `python_practice/`.
3. **For Data Analysis:** Open the Jupyter Notebooks in `pandas_lecture/` and practice manipulating datasets in `pandas_practice/`.
4. **For MySQL:** Import SQL files from `mysql/MySQL Lectures/` into MySQL Workbench or phpMyAdmin to run queries and solve question sets in `mysql/MySQL Practice/`.

---

## 📄 License & Terms of Use

**Copyright (c) 2026 Tapan Rathod ("Owner"). All Rights Reserved.**

### Intellectual Property Rights
All source code, software architecture, user interfaces, documentation, trade secrets, designs, algorithms, graphics, and associated files contained within this repository (collectively, the "Software") are the exclusive, confidential, and proprietary intellectual property of **Tapan Rathod**.

### Restrictions on Use
No rights or licenses of any kind—express, implied, or statutory—are granted to any party viewing or accessing this Software. 

Without explicit, prior written consent signed by Tapan Rathod, strictly prohibited actions include:
1. **Copying & Reproduction:** Duplicating or cloning the Software or any portion thereof.
2. **Modification:** Altering, adapting, or creating derivative works based on the Software.
3. **Distribution & Sale:** Sublicensing, leasing, renting, selling, or transferring access.
4. **Reverse Engineering:** Decompiling, disassembling, or attempting to derive the source code.
5. **Deployment:** Hosting or deploying the Software on external servers or networks.

---

*For inquiries regarding commercial licensing or permissions, please contact Tapan Rathod directly.*
