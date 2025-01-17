# crm_app

A new Flutter project.

## Getting Started
# CRM App using Clean Architecture in Flutter

This project is a simple CRM (Customer Relationship Management) application built using Flutter and Clean Architecture principles. It allows users to manage customer data, perform CRUD operations, and sync the changes between the app and a public API (Random User API). It includes a local storage solution using Hive for offline functionality.

## Features:
- Fetch customer data from a public API (Random User API).
- Perform CRUD operations: Create, Read, Update, Delete customer records.
- Use of local storage (Hive) for offline data.
- Responsive UI built with Flutter.
- Proper state management using `Provider`.

## How to Use:
- **View Customers**: After the app fetches customer data, it will display a list of customers.
- **Add a New Customer**: Click the "Add" button to add a new customer.
- **Update a Customer**: Click on any customer and edit their details.
- **Delete a Customer**: Swipe or click on the delete button to remove a customer.


## Folder Structure:
- **data/**: Contains the implementation for fetching and storing data (API, local storage).
- **domain/**: Contains entities, use cases, and abstract repositories. This is where the business logic resides.
- **presentation/**: Contains all the UI code including pages, widgets, and state management (Provider).


This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
