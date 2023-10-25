import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/account/bloc/chat_support_cubit/chat_support_cubit.dart';
import 'package:efashion_flutter/presentation/shared/animations/custom_fade_animation.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_appbar.dart';
import 'package:efashion_flutter/presentation/account/components/chat_support/support_message.dart';
import 'package:efashion_flutter/presentation/account/components/chat_support/user_message.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_text_form_field.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
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
      create: (context) =>
          getIt<ChatSupportCubit>()..createOrJoinChatEvent(),
      child: this,
    );
  }

  @override
  State<ChatSupportScreen> createState() => _ChatSupportScreenState();
}

class _ChatSupportScreenState extends State<ChatSupportScreen> {
  String message = '';
  late GlobalKey<FormState> _formKey;
  late TextEditingController _messageController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _messageController = TextEditingController();
    super.initState();
  }

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
                    "Message and calls are secured, \n no one outside of this chat can read them",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<ChatSupportCubit, ChatSupportState>(
                buildWhen: (previous, current) =>
                    previous.chatMessages != current.chatMessages,
                builder: (context, state) {
                  if (state.chatMessages.isEmpty) {
                    return Center(
                      child: Image.asset(AssetsManager.emptyChatImage),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: state.chatMessages.length,
                        reverse: true,
                        itemBuilder: (context, index) {
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
                        });
                  }
                },
              ),
            ),
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0).r,
                        color: Theme.of(context).colorScheme.surfaceVariant,
                      ),
                      child: CustomTextFormField(
                        controller: _messageController,
                        textFieldHeight: 45.h,
                        hintText: 'Message',
                        keyboardType: TextInputType.text,
                        borderRadius: 12.0,
                        enableBorderColor: Colors.transparent,
                        onSaved: (value) {
                          if (value != null) {
                            message = value;
                          }
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Message Can't be empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<ChatSupportCubit>().sendMessage(message: message);
                        _messageController.clear();
                      }
                    },
                    icon: Icon(
                      Iconsax.send_2,
                      color: Theme.of(context).colorScheme.primary,
                      size: 32.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
