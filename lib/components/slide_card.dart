import 'package:flutter/material.dart';
import 'package:his_hers_their/events/event_bus.dart';

class SlideCard extends StatefulWidget {
  double top;
  double scale;
  double duration;
  int index;
  Color color;
  SlideCard(
      {this.top = 50.0,
      this.scale = 0.6,
      this.duration,
      this.index = 1,
      this.color});
  @override
  _SlideCardState createState() => _SlideCardState();
}

class _SlideCardState extends State<SlideCard> {
  double _top = 0.0;
  double _scale = 0.0;
  @override
  void initState() {
    _top = widget.top;
    _scale = widget.scale;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (dragDownDetails) {},
      onPanUpdate: (dragDownDetails) {},
      child: Positioned(
        top: _top,
        child: Transform.scale(
          scale: _scale,
          alignment: Alignment.topCenter,
          child: Container(
            width: 240.0,
            height: 300.0,
            decoration: BoxDecoration(
              border: Border.all(),
              color: widget.color,
            ),
          ),
        ),
      ),
    );
  }
}
