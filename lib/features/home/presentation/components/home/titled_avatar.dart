import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          child: ClipOval(
            child: CachedNetworkImage(
              width: 40.w,
              height: 40.h,
              imageUrl: widget.imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: isSelected ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 46.w,
                height: 46.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle
                ),
              ),
              ClipOval(
                child: CachedNetworkImage(
                  width: 40.w,
                  height: 40.h,
                  imageUrl: widget.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
