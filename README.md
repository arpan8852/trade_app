# trade_app

## Overview

This project is developed as part of the Flutter Developer assignment for 021Trade.
The objective is to implement a stock watchlist with drag-and-drop reordering using the BLoC architecture.

---

## Features

* Display a list of stocks
* Reorder stocks using drag and drop
* Delete stock from the list
* State management using BLoC
* Responsive UI (mobile and web)

---

## Architecture & Approach

The project follows a modular structure with a clear separation between UI, business logic, and data.

BLoC is used for state management:

* Events trigger actions such as reorder and delete
* State holds the watchlist data and updates the UI reactively
* Business logic is fully separated from UI components

Reusable widgets are created for better scalability and maintainability.

---

## Reordering Logic

* Implemented using ReorderableListView
* Each item uses a unique key to ensure stable UI updates
* All changes are managed through BLoC events

---

## UI and Responsiveness

* Clean and minimal layout
* Proper handling of text overflow
* Works consistently on mobile and Flutter Web

---

## Code Quality

* Modular and reusable components
* Clear separation of concerns
* Strong typing and predictable state management

---

## How to Run

```
flutter pub get
flutter run
```

---

## Notes

* Uses static sample data
* Focus is on UI, state management, and architecture
