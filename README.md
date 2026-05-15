# Flutter Quiz App

A simple multiple-choice quiz app built with Flutter for **Mobile Application Development (MAD)** coursework. Users enter their name, answer five questions about Flutter and MAD, and see a score with feedback at the end.

## Features

- **Home screen** — Enter your name and start the quiz (name is required).
- **Quiz screen** — Five multiple-choice questions with:
  - Progress bar and question counter
  - Live score tracking
  - Immediate feedback (correct answer highlighted in green, wrong choice in red)
  - “Next Question” / “See Results” navigation
- **Result screen** — Final score, percentage-based remark, and **Play Again** to return home.

## Screenshots

_Add screenshots of the home, quiz, and result screens here after running the app._

## Tech Stack

| Item | Details |
|------|---------|
| Framework | [Flutter](https://flutter.dev) |
| Language | Dart (SDK `>=3.0.0 <4.0.0`) |
| UI | Material Design 3 |
| State | `StatefulWidget` (local state, no external packages) |

## Project Structure

```
quiz_app/
├── lib/
│   ├── main.dart                 # App entry & theme
│   ├── models/
│   │   └── question.dart         # Question model & quiz data
│   └── screens/
│       ├── home_screen.dart      # Name input & start
│       ├── quiz_screen.dart      # Questions & scoring
│       └── result_screen.dart    # Score & play again
├── test/
│   └── widget_test.dart
├── web/                          # Web platform files
└── pubspec.yaml
```

## Prerequisites

Before running the app, install and verify:

1. **Flutter SDK** — [Install Flutter](https://docs.flutter.dev/get-started/install)
2. **Android development** (optional, for phone/emulator):
   - [Android Studio](https://developer.android.com/studio) with Android SDK
   - Accept licenses: `flutter doctor --android-licenses`
3. **Web** — Chrome (enabled via `flutter create . --platforms web` if needed)
4. **Windows desktop** (optional) — Visual Studio with **Desktop development with C++**

Check your setup:

```bash
flutter doctor
```

## Getting Started

### 1. Clone or open the project

```bash
cd quiz_app
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

List available devices:

```bash
flutter devices
```

Run on a specific target:

```bash
# Chrome (web)
flutter run -d chrome

# Windows desktop (requires Visual Studio C++ workload)
flutter run -d windows

# Android emulator or connected phone
flutter run -d <device-id>
```

Or run on the default device:

```bash
flutter run
```

### Build for release

```bash
flutter build web
flutter build apk
flutter build windows
```

## How to Play

1. Open the app and enter your name on the home screen.
2. Tap **Start Quiz**.
3. Select an answer for each question. The correct option is shown after you choose.
4. Tap **Next Question** until the last question, then **See Results**.
5. View your score and remark; tap **Play Again** to start over.

## Quiz Questions

The app includes five built-in questions (see `lib/models/question.dart`) covering:

- MAD (Mobile Application Development)
- Dart and Flutter basics
- Common widgets (`ListView`, `MaterialApp`, etc.)
- App entry point (`main()`)

To add or edit questions, update the `questions` list in `question.dart`.

## Development

Run tests:

```bash
flutter test
```

Analyze code:

```bash
flutter analyze
```
