import 'package:flutter/material.dart';


// アニメーショントランプ
class AnimationCard extends StatefulWidget {
  final Image frontImage;

  AnimationCard(this.frontImage) : super();

  _AnimationCardState createState() => _AnimationCardState();
}

// アニメーショントランプ ステート
class _AnimationCardState extends State<AnimationCard>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _frontAnimation;
  late Animation<double> _backAnimation;

  Image _backImage = Image.asset("images/apple.jpeg");

  @override
  void initState() {
    super.initState();

    
    // アニメーションコントローラ
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
    );

    
    // トランプの表アニメーション
    _frontAnimation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.easeIn,
        ),
      ),
    );

    // トランプの裏アニメーション
    _backAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      child: GestureDetector(
        // トランプタップジェスチャー
        onTap: () {
          setState(() {
            if (_controller.isCompleted || _controller.velocity > 0) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          });
        },
        child: Stack(
          children: <Widget>[
            // トランプ表
            AnimatedBuilder(
              child: widget.frontImage,
              animation: _backAnimation,
              builder: (BuildContext context, Widget? child) {
                return _getCardTransform(
                  child!,
                  _backAnimation.value,
                );
              },
            ),

            // トランプ裏
            AnimatedBuilder(
              child: _backImage,
              animation: _frontAnimation,
              builder: (BuildContext context, Widget? child) {
                return _getCardTransform(
                  child!,
                  _frontAnimation.value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Transform _getCardTransform(Widget child, dynamic value) {
    final Matrix4 transform = Matrix4.identity()..scale(value, 1.0, 1.0);

    return Transform(
      transform: transform,
      alignment: FractionalOffset.center,
      child: child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
