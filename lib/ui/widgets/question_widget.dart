import 'package:donate_clothes/ui/widgets/ThemeImage.widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AnimatedContainerWidget extends StatefulWidget {
  final String question,answer;

  AnimatedContainerWidget({super.key,required this.question, required this.answer});

  @override
  State<AnimatedContainerWidget> createState() => _AnimatedContainerWidget();
}

class _AnimatedContainerWidget extends State<AnimatedContainerWidget> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpanded,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: _isExpanded ? 22.h : 5.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: controller.app, // You can change the color as needed
            // width: 2.0, // You can change the width as needed
          ),
          borderRadius: BorderRadius.circular(10), // Optional: To have rounded corners
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.question,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: _isExpanded
                          ? Icon(Icons.arrow_drop_up)
                          : Icon(Icons.arrow_drop_down_sharp),
                      onTap: _toggleExpanded,
                    ),
                  ],
                ),
                if (_isExpanded)
                  Text(
                    '\n${widget.answer}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
