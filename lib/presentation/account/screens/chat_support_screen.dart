import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/account/bloc/chat_support_cubit/chat_support_cubit.dart';
import 'package:efashion_flutter/presentation/account/components/chat_support/messaging_component.dart';
import 'package:efashion_flutter/presentation/account/components/chat_support/shimmer_loading_message.dart';
import 'package:efashion_flutter/presentation/shared/animations/custom_fade_animation.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_appbar.dart';
import 'package:efashion_flutter/presentation/account/components/chat_support/support_message.dart';
import 'package:efashion_flutter/presentation/account/components/chat_support/user_message.dart';
import 'package:efashion_flutter/presentation/shared/widgets/no_internet_connection_widget.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class ChatSupportScreen extends StatefulWidget implements AutoRouteWrapper {
  const ChatSupportScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatSupportCubit>()..createOrJoinChatEvent(),
      child: this,
    );
  }

  @override
  State<ChatSupportScreen> createState() => _ChatSupportScreenState();
}

class _ChatSupportScreenState extends State<ChatSupportScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50).r,
        child: Column(
          children: [
            const CustomAppBar(
              appBarTitle: 'Chat Support',
              appBarType: AppBarType.normal,
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
              child: BlocConsumer<ChatSupportCubit, ChatSupportState>(
                listener: (context, state) {
                  if (state.chatState == CubitState.loading) {
                    isLoading = true;
                  } else {
                    isLoading = false;
                  }
                },
                buildWhen: (previous, current) => previous.chatState != current.chatState ||
                    previous.chatMessages != current.chatMessages,
                builder: (context, state) {
                  if (state.chatState == CubitState.failure) {
                    return NoInternetConnectionWidget(
                      onButtonTap: () {
                        context.read<ChatSupportCubit>().createOrJoinChatEvent();
                      },
                      isButtonLoading: isLoading,
                    );
                  } else {
                    if (state.chatMessages.isEmpty &&
                        state.chatMessagesState == CubitState.success) {
                      return CustomFadeAnimation(
                        duration: const Duration(milliseconds: 500),
                        child: Center(
                          child: Image.asset(AssetsManager.emptyChatImage),
                        ),
                      );
                    } else {
                      return ListView(
                        reverse: true,
                        padding: EdgeInsets.zero,
                        children: [
                          ListView.builder(
                            itemCount: state.chatState == CubitState.loading
                                ? 8
                                : state.chatMessages.length,
                            shrinkWrap: true,
                            reverse: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              if (state.chatMessagesState == CubitState.initial || state.chatMessagesState == CubitState.loading) {
                                if (index % 2 == 0) {
                                  return const ShimmerLoadingMessage(isReversed: false);
                                } else {
                                  return const ShimmerLoadingMessage(isReversed: true);
                                }
                              } else {
                                final date = DateTime.parse(
                                  state.chatMessages[index].date,
                                ).toLocal();
                                if (state.chatMessages[index].isMe == true) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 16.0).r,
                                    child: CustomFadeAnimation(
                                      duration: const Duration(milliseconds: 250),
                                      child: UserMessage(
                                        message: state.chatMessages[index].message,
                                        date: date,
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 16.0).r,
                                    child: CustomFadeAnimation(
                                      duration: const Duration(milliseconds: 250),
                                      child: SupportMessage(
                                        message: state.chatMessages[index].message,
                                        date: date,
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0).r,
                            child: Row(
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
                                  StringsManager.secureMessage,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  }
                },
              ),
            ),
            const MessagingComponent()
          ],
        ),
      ),
    );
  }
}
