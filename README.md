# 📝 todo app 

todo app  is a Flutter-based ToDo application built using **Clean Architecture** principles and **Hive** for offline data storage.  
The app allows users to create, update, and manage tasks efficiently with filtering, sorting, and theming features.

---

## 🧠 Approach

The project follows the **Clean Architecture** pattern to ensure scalability, maintainability, and testability.  
The architecture is divided into three main layers:

1. **Domain Layer** — Contains core business logic:
   - `Task` entity
   - Use cases (`AddTaskUseCase`, `UpdateTaskUseCase`)

2. **Data Layer** — Handles data persistence and local storage using Hive:
   - `HiveTaskRepository` implements the repository interface for saving and retrieving tasks locally.

3. **Presentation Layer** — Responsible for UI and state management:
   - Uses Bloc/Cubit to manage state changes across the app.
   - Implements filtering, sorting, and theming logic in the `HomeView`.

This separation of concerns allows easy testing of each layer independently and improves overall project structure.

---

## 🧰 Tools & Libraries Used

| Category | Tools/Libraries |
|-----------|----------------|
| **Framework** | Flutter |
| **Architecture** | Clean Architecture |
| **State Management** | Bloc  |
| **Local Storage** | Hive |
| **Testing** | flutter_test, mocktail |
| **Utilities** | uuid, intl,  |


---

## 🧪 Testing Approach

- **Unit Tests** were written for:
  - `Task` entity validation  
  - `HiveTaskRepository` logic  
  - Use cases (`AddTaskUseCase`, `UpdateTaskUseCase`)  
  - Bloc logic for task state transitions  

The goal was to ensure the reliability of core business logic and repository behavior.

---

## ⚙️ Summary

todo app  demonstrates how to structure a Flutter application using Clean Architecture with clear boundaries between UI, domain, and data layers.  
It emphasizes **maintainability**, **testability**, and **scalable design**, while staying lightweight and efficient with **Hive** for local storage.

---

