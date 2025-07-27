# 🎵 iTunes RSS Flutter App

This is a Flutter application that displays top albums from the iTunes RSS feed. It demonstrates clean architecture, state management using Provider, and dynamic UI rendering with network images and shimmer loading effects.

## 📦 Requirements

- Flutter SDK >= 3.7.0
- Dart SDK >= 3.0.0
- Any IDE that supports Flutter (e.g., VS Code, Android Studio)

## 🚀 Getting Started

Follow these steps to run the app locally:

### 1. Clone the Repository

```bash
git clone https://github.com/moghoneim-code/itunes_rss.git
cd itunes_rss
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the App

```bash
flutter run
```

The app should now launch on your connected device or emulator.

## 🧪 Running Tests

To run widget and unit tests:

```bash
flutter test
```

## 📁 Project Structure Highlights

- `lib/` – Main app code
- `features/` – Feature modules (e.g. Top Albums)
- `core/` – Shared utilities, themes, enums, widgets
- `assets/` – Contains mock data like `mock_album_feed.json`

## 🛠 Dependencies

This project uses:

- [Provider](https://pub.dev/packages/provider)
- [Dio](https://pub.dev/packages/dio)
- [Cached Network Image](https://pub.dev/packages/cached_network_image)
- [Shimmer](https://pub.dev/packages/shimmer)

## 📄 License

MIT

---

