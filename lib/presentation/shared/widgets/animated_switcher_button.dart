import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedSwitcherButton extends StatefulWidget {
  final void Function(int buttonIndex) onSwitchIndexChanged;
  const AnimatedSwitcherButton({
    super.key,
    required this.onSwitchIndexChanged,
  });

  @override
  State<AnimatedSwitcherButton> createState() => _AnimatedSwitcherButtonState();
}

class _AnimatedSwitcherButtonState extends State<AnimatedSwitcherButton> {
  ValueNotifier<int> switchIndex = ValueNotifier(0);

  void _handleSwitchTap(int index) {
    switchIndex.value = index;
    widget.onSwitchIndexChanged(switchIndex.value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: switchIndex,
          builder: (context, value, child) => _buildSquareIconButton(
            onTap: () {
              _handleSwitchTap(0);
            },
            isSquareSelected: value == 0,
          ),
        ),
        SizedBox(width: 12.w),
        ValueListenableBuilder(
          valueListenable: switchIndex,
          builder: (context, value, child) => _buildRectangleIconButton(
            onTap: () {
              _handleSwitchTap(1);
            },
            isRectangleSelected: value == 1,
          ),
        ),
      ],
    );
  }

  Widget _buildSquareIconButton(
      {required void Function() onTap, required isSquareSelected}) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              child: Container(
                key: ValueKey<bool>(isSquareSelected),
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: isSquareSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.outline,
                      width: 2.0),
                  borderRadius: BorderRadius.circular(5.0).r,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRectangleIconButton(
      {required void Function() onTap, required isRectangleSelected}) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              child: Row(
                key: ValueKey<bool>(isRectangleSelected),
                children: List.generate(
                  2,
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: 1.0).r,
                    child: Container(
                      width: 10,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                            color: isRectangleSelected
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.outline,
                            width: 2.0.w
                        ),
                        borderRadius: BorderRadius.circular(3.0).r,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    switchIndex.dispose();
    super.dispose();
  }
}
