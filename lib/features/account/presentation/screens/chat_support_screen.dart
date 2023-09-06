import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/shared/presentation/widgets/custom_appbar.dart';
import 'package:efashion_flutter/features/account/presentation/components/chat_support/build_message_item.dart';
import 'package:efashion_flutter/features/account/presentation/components/chat_support/build_my_message_item.dart';
import 'package:efashion_flutter/shared/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class ChatSupportScreen extends StatelessWidget {
  const ChatSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50).r,
        child: Column(
          children: [
            const CustomAppBar(
              appBarTitle: 'Order Status',
              appBarType: AppBarType.normal,
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Iconsax.lock,
                  size: 16.0,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  "Message and calls are end-to end encrypted, \n no one outside of this chat can read them",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            const BuildMyMessageItem(),
            SizedBox(
              height: 16.h,
            ),
            const BuildMessageItem(),
            SizedBox(
              height: 16.h,
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0).r,
                      color: Theme.of(context).colorScheme.surfaceVariant,
                    ),
                    child: CustomTextFormField(
                      hintText: 'Message',
                      type: TextInputType.text,
                      borderRadius: 12.0,
                      suffixIcon: Iconsax.attach_square5,
                      enableBorderColor: Colors.transparent,
                      onSuffixPress: () {
                        debugPrint('Test');
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Icon(
                    Iconsax.send_2,
                    color: Theme.of(context).colorScheme.primary,
                    size: 32.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
