import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitledAvatar extends StatefulWidget {
  const TitledAvatar({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
    this.titledImageType = TitledImageType.remote,
  });

  final String imagePath;
  final String title;
  final void Function() onTap;
  final TitledImageType titledImageType;

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
    return SizedBox(
      width: 46.w,
      height: 46.h,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        child: isSelected ? ClipOval(
          child: Container(
            key: ValueKey<bool>(isSelected),
            width: 46.w,
            height: 46.h,
            color: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(2.0).r,
              child: ClipOval(
                child: widget.titledImageType == TitledImageType.remote
                    ? CachedNetworkImage(
                  key: ValueKey<bool>(isSelected),
                  width: 40.w,
                  height: 40.h,
                  imageUrl: '${widget.imagePath}?ixid=M3wxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjk0NjE3MzUxfA&ixlib=rb-4.0.3&dpr=1&auto=format&fit=crop&w=120&h=200&q=60',
                  fit: BoxFit.cover,
                )
                    : Image.asset(
                  key: ValueKey<bool>(isSelected),
                  widget.imagePath,
                  fit: BoxFit.cover,
                  width: 40.w,
                  height: 40.h,
                ),
              ),
            ),
          ),
        ) : ClipOval(
          child: widget.titledImageType == TitledImageType.remote
              ? CachedNetworkImage(
            width: 40.w,
            height: 40.h,
            imageUrl:  '${widget.imagePath}?ixid=M3wxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjk0NjE3MzUxfA&ixlib=rb-4.0.3&dpr=1&auto=format&fit=crop&w=120&h=200&q=60',
            fit: BoxFit.cover,
          ): Image.asset(
            widget.imagePath,
            fit: BoxFit.cover,
            width: 40.w,
            height: 40.h,
          ),
        ),
      ),
    );
  }
}

enum TitledImageType {
  local,
  remote,
}
