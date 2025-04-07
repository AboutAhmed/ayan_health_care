import 'package:flutter/material.dart';

class OnlineBlinking extends StatefulWidget {
  const OnlineBlinking({super.key});

  @override
  State<OnlineBlinking> createState() => _OnlineBlinkingState();
}

class _OnlineBlinkingState extends State<OnlineBlinking>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 700),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Icon(Icons.circle,color: Colors.green.shade700,size: 14,),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
