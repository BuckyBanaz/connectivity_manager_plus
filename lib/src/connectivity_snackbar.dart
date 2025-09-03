import 'package:flutter/material.dart';
import 'connectivity_config.dart';
import 'connectivity_event.dart';

class ConnectivitySnackbar {
  static void show(
      BuildContext context,
      ConnectivityEvent event,
      ConnectivityConfig config,
      ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              event.isConnected ? Icons.wifi : Icons.wifi_off,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                event.isConnected
                    ? config.connectedText
                    : config.disconnectedText,
              ),
            ),
            if (!event.isConnected && config.showRetryButton)
              TextButton(
                onPressed: config.onRetry ?? () {},
                child: const Text("Retry", style: TextStyle(color: Colors.white)),
              )
          ],
        ),
        backgroundColor:
        event.isConnected ? config.connectedColor : config.disconnectedColor,
        duration: config.duration,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
