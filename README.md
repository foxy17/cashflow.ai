# 💰 Cashflow AI

Welcome to **Cashflow AI**! This open-source application helps you track your spending by analyzing your messages using AI to understand and categorize your expenses. 

## 📦 Features

- **AI-Powered Expense Tracking**: Automatically categorize your spending based on your messages.
- **User-Friendly Interface**: Easy navigation and intuitive design for a seamless experience.
- **Two Versions Available**:
  - **Play Store Version**: Coming soon! Stay tuned for updates.
  - **Self-Build Version**: Use your own API key to build the project locally.

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- An IDE (e.g., Visual Studio Code, Android Studio)

### 🛠️ Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/cashflow_ai.git
   cd cashflow_ai
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Set up your API key**:
   - Create a `.env` file in the root directory and add your API key:
     ```
     API_KEY=your_api_key_here
     ```

## 🧪 Running Tests

There are several ways to run the tests with your OpenAI API key:

### 1. Using Environment File

1. Create a `.env.test` file in the root directory:
   ```bash
   cp .env.test.example .env.test
   ```

2. Add your OpenAI API key to `.env.test`:
   ```
   OPENAI_API_KEY=your_api_key_here
   ```

3. Run the tests:
   ```bash
   flutter test
   ```

### 2. Using Command Line

Run tests directly with your API key:

```bash
flutter test test/core/services/openai_service_test.dart --dart-define=OPENAI_API_KEY=your_api_key_here
```

### 4. Using GitHub Actions (Manual Trigger)

You can run tests manually via GitHub Actions:

1. First, add your OpenAI API key to GitHub Secrets:
   - Go to your repository Settings
   - Navigate to Secrets and Variables > Actions
   - Click "New repository secret"
   - Name: `OPENAI_API_KEY`
   - Value: Your OpenAI API key

2. Run the tests:
   - Go to the "Actions" tab
   - Select "Test Structured Output" from the workflows list
   - Click "Run workflow"
   - Optionally modify the Flutter version (defaults to 3.24.4)
   - Click "Run workflow" to start the tests

> **Note**: Your API key is securely stored in GitHub Secrets and is never exposed in logs or to unauthorized users.

---

Feel free to reach out if you have any questions or suggestions. Happy coding! 🎉