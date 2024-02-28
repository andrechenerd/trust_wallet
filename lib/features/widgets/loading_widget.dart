import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final Widget child;
  const LoadingWidget({
    super.key,
    required this.child,
  });

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? animation;
  Animation<double>? animationBg;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeInOut,
      ),
    );

    animationBg = Tween<double>(begin: 5.0, end: 20.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeInOut,
      ),
    );
    _controller!.repeat(reverse: true);
  }

  @override
  dispose() {
    _controller?.dispose(); // you need this
    super.dispose();
  }

  void onImageClicked() {
    print('Картинка нажата!');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onImageClicked,
        child: AnimatedBuilder(
          animation: animation!,
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
              angle: animation!.value * 2 * 3.14159265359,
              child: Transform.scale(
                scale: animation!.value,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.4),
                        blurRadius: animationBg!.value,
                        spreadRadius: animationBg!.value,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 200 * animation!.value,
                    child: widget.child,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
