import 'package:efashion_flutter/core/util/colors_manager.dart';
import 'package:flutter/material.dart';

class TitledAvatar extends StatefulWidget {
  const TitledAvatar({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  final String imagePath;
  final String title;
  final void Function() onTap;

  @override
  State<TitledAvatar> createState() => _TitledAvatarState();
}

class _TitledAvatarState extends State<TitledAvatar> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onTap();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildAvatarImage(),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }

  _buildAvatarImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedOpacity(
          opacity: isSelected ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: CircleAvatar(
            backgroundImage: NetworkImage(widget.imagePath),
          ),
        ),
        AnimatedOpacity(
          opacity: isSelected ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: CircleAvatar(
            backgroundColor: ColorsManager.lightPrimaryColor,
            radius: 23,
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.imagePath),
            ),
          ),
        ),
      ],
    );
  }
}