import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vimatone/Config/Extras.dart';

class AppButton extends StatefulWidget {
  final Future<void> Function() onTap;
  final Color? backgroundColor;
  final List<Widget> items;
  const AppButton({
    super.key,
    required this.onTap,
    this.backgroundColor,
    required this.items,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isLoading = false;

  void _handlePress() async {
    setState(() {
      _isLoading = true;
    });
    await widget.onTap();
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _isLoading ? null : _handlePress,
      style: ButtonStyle(
          // ignore: prefer_if_null_operators
          backgroundColor: WidgetStatePropertyAll(widget.backgroundColor == null
              ? color_secondary
              : widget.backgroundColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius_md),
            ),
          )),
      child: _isLoading
          ? SpinKitWave(
              color: color_primary,
              size: 20,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: widget.items,
            ),
    );
  }
}
