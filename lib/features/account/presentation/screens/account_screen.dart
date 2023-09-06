import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:efashion_flutter/features/account/presentation/components/account/account_body.dart';
import 'package:efashion_flutter/shared/presentation/widgets/blurred_background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BlurredBackgroundImage(
            isLocalImage: false,
            imagePath: AssetsManager.userTestImage,
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 62.0,
            child: Column(
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:AssetsManager.userTestImage,
                    width: 120.w,
                    height: 120.h,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Tara Slander",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
          const AccountContainerComponent(),
        ],
      ),
    );
  }
}
