import 'package:flutter/material.dart';
import 'connectivity_config.dart';
import 'connectivity_event.dart';

class ConnectivityAlert {
  static void show(
      BuildContext context,
      ConnectivityEvent event,
      ConnectivityConfig config,
      ) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(event.isConnected ? "Connected" : "No Internet"),
        content: Text(
          event.isConnected
              ? config.connectedText
              : config.disconnectedText,
        ),
        actions: [
          if (!event.isConnected && config.showRetryButton)
            TextButton(
              onPressed: config.onRetry ?? () => Navigator.pop(context),
              child: const Text("Retry"),
            ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
