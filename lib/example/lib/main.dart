import 'package:flutter/material.dart';

import '../../connectivity_manager_plus.dart';


void main() {
  runApp(const MyApp());
}

/// Root of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Connectivity Manager Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey.shade100,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      home: Builder(
        builder: (context) {
          /// Initialize connectivity monitoring
          ///
          /// ConnectivityService().initialize(
          // ConnectivityService().initialize(
          //   context,
          //   config: ConnectivityConfig(
          //     disconnectedText: "Oops! No Internet 😢",
          //     connectedText: "Back Online 🎉",
          //     // 👇 Custom handler jab net wapas aaye
          //   ),
          // );

          ConnectivityService().initialize(
            context,
            config: ConnectivityConfig(
              connectedText: "✅ Back Online 🎉",
              disconnectedText: "🚨 Oops! No Internet 😢",
              showRetryButton: true,
              duration: const Duration(seconds: 3),
              onRetry: () {
                debugPrint("Retry Pressed (Custom Action)");
              },
              onConnectedBuilder: (ctx) {
                // Example: toast library use kar lo
                ScaffoldMessenger.of(ctx).showSnackBar(
                  const SnackBar(content: Text("✅ Internet Restored with Toast style")),
                );
              },

              /// Custom full-screen page for no internet
              customScreenBuilder: (ctx) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: SafeArea(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.wifi_off_rounded,
                              size: 100,
                              color: Colors.red,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "No Internet Connection",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              "Please check your Wi-Fi or Mobile Data settings.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton.icon(
                              onPressed: () {
                                debugPrint("Retry from custom screen");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                              ),
                              icon: const Icon(Icons.refresh, color: Colors.white),
                              label: const Text(
                                "Retry",
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );

          return const HomePage();
        },
      ),
    );
  }
}

/// Example homepage

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Connectivity Demo"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: theme.colorScheme.primary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi,
                size: 100,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 24),
              Text(
                "Internet Check Demo",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onBackground,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                "This screen demonstrates how the app responds when internet connectivity is lost or restored. "
                    "Disconnect your Wi-Fi or Mobile Data to test the package in action.",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Connectivity check running..."),
                    ),
                  );
                },
                icon: const Icon(Icons.wifi_tethering),
                label: const Text("Test Connectivity"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                "Made with ❤️ using connectivity_manager_plus",
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.5),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
