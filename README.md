
# 📶 Connectivity Manager Plus

[![pub package](https://img.shields.io/pub/v/connectivity_manager_plus.svg)](https://pub.dev/packages/connectivity_manager_plus)
[![GitHub stars](https://img.shields.io/github/stars/BuckyBanaz/connectivity_manager_plus?style=social)](https://github.com/BuckyBanaz/connectivity_manager_plus)

A **Flutter utility package** to monitor **internet connectivity in real-time** and show feedback with **Snackbar, Alert Dialog, Full-Screen, or your own custom UI**.  
Built on top of [`connectivity_manager_plus`](https://pub.dev/packages/connectivity_manager_plus).

> 🎯 Easy to use. Fully customizable. Open-source.

---

## ✨ Features
- Detect connectivity changes instantly.
- Multiple built-in UI modes:
  - ✅ Snackbar
  - ⚠️ Alert Dialog
  - 📺 Full Screen
- Customizable:
  - Text, colors, duration
  - Retry button + custom retry handler
  - Provide your own widget or screen
- Auto-handling on app startup & runtime.
- Lightweight, scalable, and developer-friendly.



## 📸 Demo

| Default UI | Customized UI |
|------------|---------------|
| ![Demo](https://raw.githubusercontent.com/BuckyBanaz/connectivity_manager_plus/main/demo/default.gif) | ![Custom Demo](https://raw.githubusercontent.com/BuckyBanaz/connectivity_manager_plus/main/demo/custom.gif) |

---

## 🚀 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  connectivity_manager_plus: ^0.0.1
````

Then run:

```bash
flutter pub get
```

---

## 🛠️ Usage

### 1. Initialize after `MaterialApp`

```dart
ConnectivityService().initialize(
  context,
  config: ConnectivityConfig(
    showAs: ConnectivityUI.snackbar, // snackbar | alert | screen
    disconnectedText: "🚨 Oops! No Internet 😢",
    connectedText: "✅ Back Online 🎉",
    showRetryButton: true,
    duration: const Duration(seconds: 3),
    onRetry: () => debugPrint("Retry Pressed"),
  ),
);
```

### 2. Use Custom Screen

```dart
ConnectivityConfig(
  customScreenBuilder: (ctx) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wifi_off, size: 100, color: Colors.red),
            const Text("No Internet Connection"),
            ElevatedButton(
              onPressed: () => debugPrint("Retry from custom screen"),
              child: const Text("Retry"),
            ),
          ],
        ),
      ),
    );
  },
);
```

---

## ⚡ API Reference

### ConnectivityService

* **initialize(context, config)** → Start monitoring internet
* **dispose()** → Stop monitoring

### ConnectivityConfig

| Property            | Type                         | Default                  | Description                 |
| ------------------- | ---------------------------- | ------------------------ | --------------------------- |
| showAs              | ConnectivityUI               | ConnectivityUI.snackbar  | Select built-in UI          |
| connectedText       | String                       | "Internet Connected"     | Online message              |
| disconnectedText    | String                       | "No Internet Connection" | Offline message             |
| connectedColor      | Color                        | Colors.green             | Success color               |
| disconnectedColor   | Color                        | Colors.red               | Error color                 |
| duration            | Duration                     | 3s                       | Snackbar time               |
| showRetryButton     | bool                         | true                     | Show retry button           |
| onRetry             | VoidCallback?                | null                     | Retry handler               |
| customWidget        | Widget?                      | null                     | Replace UI with widget      |
| customScreenBuilder | WidgetBuilder?               | null                     | Replace screen UI           |
| onConnectedBuilder  | void Function(BuildContext)? | null                     | Custom handler on reconnect |

---

## 🌍 Open Source

This package is **100% open-source** and free to use.
Repo: [github.com/BuckyBanaz/connectivity\_manager\_plus](https://github.com/BuckyBanaz/connectivity_manager_plus)

💡 You can contribute, manage, and extend this package.
Fork it, improve it, and make it even more powerful!

---

## 🧑‍💻 Motivation for Developers

*"As developers, we spend hours crafting apps, but small details like a smooth no-internet experience make our apps feel truly professional.
This package is built to save your time and let you focus on what matters: building amazing apps.
The project is open-source so you can learn, contribute, and grow with the community."*

---

## 🤝 Contributing

* Found a bug? Open an issue.
* Want to improve? Send a PR.
  Add new features, improve docs, or just fix typos — every contribution counts.

---

## 📜 License

This project is licensed under the **MIT License**.

---

Made with ❤️ by [Parikshit Verma](https://parikshit.techycodex.com) — [TechCodex](https://techycodex.com)

