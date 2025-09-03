import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'connectivity_config.dart';
import 'connectivity_event.dart';
import 'connectivity_snackbar.dart';
import 'connectivity_alert.dart';
import 'connectivity_screen.dart';

class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();
  factory ConnectivityService() => _instance;

  ConnectivityService._internal();

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  late ConnectivityConfig _config;

  void initialize(BuildContext context, {ConnectivityConfig? config}) {
    _config = config ?? const ConnectivityConfig();

    _subscription = _connectivity.onConnectivityChanged.listen((results) {
      // results ab ek List<ConnectivityResult> hai
      bool isConnected = results.any((r) => r != ConnectivityResult.none);

      final event = ConnectivityEvent(isConnected: isConnected);

      // Priority: Custom widget → Snackbar → Alert → Screen
      if (_config.customWidget != null) {
        _showCustomWidget(context, isConnected);
      } else {
        _showDefaultUI(context, event);
      }
    });
  }

  void _showCustomWidget(BuildContext context, bool isConnected) {
    showDialog(
      context: context,
      builder: (_) => Dialog(child: _config.customWidget!),
    );
  }

  void _showDefaultUI(BuildContext context, ConnectivityEvent event) {
    if (!event.isConnected) {
      // 🔴 Disconnected
      if (_config.customScreenBuilder != null) {
        _pushScreen(context, _config.customScreenBuilder!(context));
      } else if (_config.customWidget != null) {
        _showCustomWidget(context, event.isConnected);
      } else if (_config.showAs == ConnectivityUI.alert) {
        ConnectivityAlert.show(context, event, _config);
      } else if (_config.showAs == ConnectivityUI.snackbar) {
        ConnectivitySnackbar.show(context, event, _config);
      } else {
        _pushScreen(context, ConnectivityScreen(config: _config));
      }
    } else {
      // 🟢 Connected
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }

      if (_config.onConnectedBuilder != null) {
        _config.onConnectedBuilder!(context);
      } else if (_config.showAs == ConnectivityUI.alert) {
        ConnectivityAlert.show(context, event, _config);
      } else if (_config.showAs == ConnectivityUI.snackbar) {
        ConnectivitySnackbar.show(context, event, _config);
      }
    }
  }

  void _pushScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => screen),
    );
  }




  void dispose() {
    _subscription?.cancel();
  }
}
