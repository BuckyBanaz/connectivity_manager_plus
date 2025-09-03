import 'package:flutter/material.dart';

enum ConnectivityUI { snackbar, alert, screen }

class ConnectivityConfig {
  final ConnectivityUI showAs; // new
  final String connectedText;
  final String disconnectedText;
  final Color connectedColor;
  final Color disconnectedColor;
  final Duration duration;
  final bool showRetryButton;
  final VoidCallback? onRetry;
  final Widget? customWidget;
  final WidgetBuilder? customScreenBuilder;
  final void Function(BuildContext)? onConnectedBuilder;

  const ConnectivityConfig({
    this.showAs = ConnectivityUI.snackbar, // default = Snackbar
    this.connectedText = "Internet Connected",
    this.disconnectedText = "No Internet Connection",
    this.connectedColor = Colors.green,
    this.disconnectedColor = Colors.red,
    this.duration = const Duration(seconds: 3),
    this.showRetryButton = true,
    this.onRetry,
    this.customWidget,
    this.customScreenBuilder,
    this.onConnectedBuilder,
  });

  ConnectivityConfig copyWith({
    String? connectedText,
    String? disconnectedText,
    Color? connectedColor,
    Color? disconnectedColor,
    Duration? duration,
    bool? showRetryButton,
    VoidCallback? onRetry,
    Widget? customWidget,
    Widget Function(BuildContext context)? customScreenBuilder,
    void Function(BuildContext context)? onConnectedBuilder,
  }) {
    return ConnectivityConfig(
      connectedText: connectedText ?? this.connectedText,
      disconnectedText: disconnectedText ?? this.disconnectedText,
      connectedColor: connectedColor ?? this.connectedColor,
      disconnectedColor: disconnectedColor ?? this.disconnectedColor,
      duration: duration ?? this.duration,
      showRetryButton: showRetryButton ?? this.showRetryButton,
      onRetry: onRetry ?? this.onRetry,
      customWidget: customWidget ?? this.customWidget,
      customScreenBuilder: customScreenBuilder ?? this.customScreenBuilder,
      onConnectedBuilder: onConnectedBuilder ?? this.onConnectedBuilder,
    );
  }
}

