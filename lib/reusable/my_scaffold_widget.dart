import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'no_internet_page.dart';

class MyScaffold extends StatefulWidget {
  final Widget child;

  const MyScaffold({super.key, required this.child});

  @override
  State<MyScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<MyScaffold> with WidgetsBindingObserver {
  late final StreamSubscription<List<ConnectivityResult>> connectivitySubscription;
  final ValueNotifier<bool> isNetworkDisabled = ValueNotifier(false);

  /// Check the current network state
  void _checkCurrentNetworkState() async {
    List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();
    isNetworkDisabled.value = connectivityResult.every((result) => result == ConnectivityResult.none);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkCurrentNetworkState();

    connectivitySubscription = Connectivity().onConnectivityChanged.listen(
          (List<ConnectivityResult> result) {
        isNetworkDisabled.value = result.every((r) => r == ConnectivityResult.none);
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _checkCurrentNetworkState();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: isNetworkDisabled,
          builder: (_, networkDisabled, __) => Visibility(
            visible: !networkDisabled,
            child: KeyboardDismissOnTap(child: widget.child),
          ),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: isNetworkDisabled,
          builder: (_, networkDisabled, __) => Visibility(
            visible: networkDisabled,
            child: const NoInternetPage(),
          ),
        ),
      ],
    );
  }
}
