# 📱 Personal Finance Tracker - Flutter Frontend

![Flutter](https://img.shields.io/badge/Flutter-v3.24.1-blue?style=flat-square&logo=flutter) ![Dart](https://img.shields.io/badge/Dart-v3.5.1-blue?style=flat-square&logo=dart) ![Bloc](https://img.shields.io/badge/State_Management-BLoC-yellow?style=flat-square&logo=bloc)

## 📋 Table of Contents
- [Overview](#overview)
- [Key Features](#key-features)
- [Project Structure](#project-structure)
- [Tech Stack](#tech-stack)
- [Installation & Setup](#installation--setup)
- [Environment Configuration](#environment-configuration)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [API Integration](#api-integration)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## 🖥️ Overview
**Personal Finance Tracker** is a mobile application designed to help users efficiently manage their finances by tracking their income, expenses, and budgeting. It uses a **feature-based clean architecture** with Flutter and BLoC for state management. This app also integrates with a **Spring Boot backend** to handle user authentication, data storage, and personalized AI-driven recommendations(planned).

## ✨ Key Features
- 📲 **User Authentication**: Phone number-based OTP verification and JWT authentication.
- 💸 **Expense Tracking**: Add, update, or delete income/expense records.
- 📊 **Budget Management**: Set budgets and get insights on spending habits.(coming soon)
- 📑 **Personalized AI Insights**: Analyze user data to provide actionable recommendations (coming soon).
- 📊 **Local Data Storage**: Uses **SQLite** for offline data storage.(coming soon)
- 🌐 **REST API Integration**: Connects seamlessly with the backend to sync data.

---

## 📁 Project Structure
The project follows a **feature-based clean architecture**:


## 🛠️ Tech Stack
- **Flutter** for frontend development
- **BLoC** for state management
- **Shared Preferences** for local storage
- **GoRouter** for navigation
- **Dio** for HTTP requests
- **GetIt** for dependency injection
- **JSON serialization** for data handling
- **Spring Boot** for backend services (linked [here](https://github.com/abdel3107/SpringBoot-Personal-Finance-API))

---

## ⚙️ Installation & Setup

### Prerequisites
Ensure you have the following installed:
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio) or [Xcode](https://developer.apple.com/xcode/)

### Step 1: Clone the Repository
```bash
git clone https://github.com/abdel3107/Flutter-Personal-Finance-App.git
cd flutter-finance-tracker
```
### Step 2: Install dependencies
```bash
flutter pub get
```
### Step 3: Configure the environment
Make sure to configure the backend and keep it running. Refer to [Backend API](https://github.com/abdel3107/SpringBoot-Personal-Finance-API) .
Also, configure the base url in `lib/core/constants/api_urls.dart`

### Step 4: Run the App
```bash
flutter run
```

---

## 🚀 Usage
- **Onboarding**: New users are guided through an onboarding process.
- **Sign Up / Login**: Register using your phone number and verify via OTP.
- **Home**: View your income and expenses at a glance.
- **Add Transaction**: Quickly add new transactions.
- **Settings**: Manage profile and app settings.

## 📸 Screenshots
...


## 🔗 API Integration

This application communicates with a backend server built using Spring Boot. The backend handles user authentication, data management, and other critical operations.

### 📡 API Endpoints
Refer to [Backend API](https://github.com/abdel3107/SpringBoot-Personal-Finance-API) repo 


### ⚙️ API Configuration
Make sure to update the **base URL** in `lib/core/constants/api_urls.dart` to match your local or deployed backend server:

## 🤝 **Contributing**
We welcome contributions to improve this project! If you'd like to contribute, please follow these guidelines:

### How to Contribute
1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Make your changes and commit:
   ```bash
   git commit -m "Add your message"
   ```
4. Push to you branch:
   ```bash
   git push origin feature/your-feature-name
   ```
5. Create a pull request, and we'll review it as soon as possible.


---

## 📄 **License**
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.


## 📬 Contact

For any questions or feedback, feel free to reach out:

- **Pouotouo Abdel Zidane**
  - Email: [abdelzidane3107@gmail.com](mailto:abdelzidane3107@gmail.com)
  - LinkedIn: [LinkedIn](https://www.linkedin.com/in/pouotouo/)
  - GitHub: [GitHub](https://github.com/abdel3107)

We appreciate your interest in this project and look forward to hearing from you!





