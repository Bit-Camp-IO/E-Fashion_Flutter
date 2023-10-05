import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/shared/widgets/no_profile_picture.dart';
import 'package:efashion_flutter/shared/router/app_router.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/presentation/account/components/account/account_body.dart';
import 'package:efashion_flutter/presentation/shared/bloc/tokens_cubit/tokens_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/blurred_background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TokensCubit, TokensState>(
      listener: (context, state) {
        if (state is TokensUnAuthenticatedState) {
          context.replaceRoute(const AuthRoute());
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            const BlurredBackgroundImage(
              isLocalImage: true,
              imagePath: AssetsManager.welcomeImage,
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              top: 90.h,
              child: Column(
                children: [
                  NoProfilePicture(
                    name: 'Tara',
                    width: 120.w,
                    height: 120.h,
                    isLarge: true,
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
      ),
    );
  }
}
