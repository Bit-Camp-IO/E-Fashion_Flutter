import 'package:efashion_flutter/presentation/account/bloc/chat_support_cubit/chat_support_cubit.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class MessagingComponent extends StatefulWidget {
  const MessagingComponent({super.key});

  @override
  State<MessagingComponent> createState() => _MessagingComponentState();
}

class _MessagingComponentState extends State<MessagingComponent> {
  String message = '';
  late GlobalKey<FormState> _formKey;
  late TextEditingController _messageController;
  final ValueNotifier<bool> _isTyping = ValueNotifier(false);

  void _messageFieldListener() {
    if (_messageController.text.isNotEmpty) {
      _isTyping.value = true;
    } else {
      _isTyping.value = false;
    }
  }

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _messageController = TextEditingController()
      ..addListener(_messageFieldListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0).r,
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
              child: TextFormField(
                controller: _messageController,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                decoration: InputDecoration(
                  hintText: StringsManager.messageFieldHintText,
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12).r,
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12).r,
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  if (value != null) {
                    message = value;
                  }
                },
                validator: (value) {
                  if(value != null && value.isEmpty){
                    return StringsManager.messageValidationResponse;
                  }else{
                    return null;
                  }
                },
              ),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          ValueListenableBuilder(
            valueListenable: _isTyping,
            builder: (context, isTypingValue, child) => SizedBox(
              width: 40.w,
              height: 40.h,
              child: AnimatedSwitcher(
                switchInCurve: Curves.bounceIn,
                switchOutCurve: Curves.bounceOut,
                duration: const Duration(milliseconds: 500),
                key: ValueKey<bool>(isTypingValue),
                child: isTypingValue == true
                    ? IconButton(
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
                          size: 32.sp,
                        ),
                      )
                    : Icon(
                        Iconsax.send_2,
                        size: 32.sp,
                        color: Theme.of(context).colorScheme.surfaceVariant,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController
      ..removeListener(_messageFieldListener)
      ..dispose();
    _formKey.currentState?.dispose();
    _isTyping.dispose();
    super.dispose();
  }
}
