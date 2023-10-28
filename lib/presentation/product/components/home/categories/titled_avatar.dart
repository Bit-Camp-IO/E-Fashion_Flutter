import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/presentation/shared/animations/custom_fade_animation.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
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
  ValueNotifier<bool> isSelected = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isSelected.value = !isSelected.value;
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
      child: ValueListenableBuilder(
        valueListenable: isSelected,
        builder: (context, value, child) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          child: value
              ? ClipOval(
                  child: Container(
                    key: ValueKey<bool>(value),
                    width: 46.w,
                    height: 46.h,
                    color: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0).r,
                      child: ClipOval(
                        child: widget.titledImageType == TitledImageType.remote
                            ? CachedNetworkImage(
                                key: ValueKey<bool>(value),
                                width: 40.w,
                                height: 40.h,
                                imageUrl: widget.imagePath,
                                fit: BoxFit.cover,
                                cacheManager: CacheManager(
                                  Config(
                                    AppConstants.cacheFolder,
                                    stalePeriod: const Duration(
                                      days: AppConstants.cacheDuration,
                                    ),
                                  ),
                                ),
                              )
                            : CustomFadeAnimation(
                                duration: const Duration(milliseconds: 500),
                                child: Image.asset(
                                  key: ValueKey<bool>(value),
                                  widget.imagePath,
                                  fit: BoxFit.cover,
                                  width: 40.w,
                                  height: 40.h,
                                ),
                              ),
                      ),
                    ),
                  ),
                )
              : ClipOval(
                  child: widget.titledImageType == TitledImageType.remote
                      ? CachedNetworkImage(
                          width: 40.w,
                          height: 40.h,
                          imageUrl: widget.imagePath,
                          fit: BoxFit.cover,
                          cacheManager: CacheManager(
                            Config(
                              AppConstants.cacheFolder,
                              stalePeriod: const Duration(
                                days: AppConstants.cacheDuration,
                              ),
                            ),
                          ),
                        )
                      : Image.asset(
                          widget.imagePath,
                          fit: BoxFit.cover,
                          width: 40.w,
                          height: 40.h,
                        ),
                ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    isSelected.dispose();
    super.dispose();
  }
}

enum TitledImageType {
  local,
  remote,
}
