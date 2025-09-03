import 'package:flutter/material.dart';
import 'connectivity_config.dart';

class ConnectivityScreen extends StatelessWidget {
  final ConnectivityConfig config;

  const ConnectivityScreen({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // 👈 App ka current theme
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor, // 👈 Theme-based background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off,
              size: 100,
              color: config.disconnectedColor, // 👈 user-defined ya theme color
            ),
            const SizedBox(height: 16),
            Text(
              config.disconnectedText,
              style: textTheme.titleMedium?.copyWith( // 👈 theme ke hisaab se text
                fontWeight: FontWeight.bold,
                color: colorScheme.error, // 👈 error color from theme
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            if (config.showRetryButton)
              ElevatedButton(
                onPressed: config.onRetry ?? () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary, // 👈 theme primary color
                  foregroundColor: colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Retry"),
              ),
          ],
        ),
      ),
    );
  }
}
