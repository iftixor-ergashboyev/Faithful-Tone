import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  const MyBox({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 15,
            offset: const Offset(4, 4)
          ),
          BoxShadow(
              color: Colors.white,
              blurRadius: 15,
              offset: const Offset(-4, -4)
          ),
        ],
      ),
      padding: EdgeInsets.all(12),
      child: child,
    );
  }
}
