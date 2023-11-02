import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';

class PrivacyAndPolicy extends StatefulWidget {
  final bool isError;
  final void Function(bool isChecked) isChecked;
  const PrivacyAndPolicy({super.key, this.isError = false, required this.isChecked});

  @override
  State <PrivacyAndPolicy> createState() => _PrivacyAndPolicyState();
}

class _PrivacyAndPolicyState extends State<PrivacyAndPolicy> {
 ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ValueListenableBuilder(
          valueListenable: isChecked,
          builder: (context, value, child) => Checkbox(
            value: value,
            isError: widget.isError,
            onChanged: (newBool) {
                isChecked.value = newBool!;
                widget.isChecked(newBool);
            },
          ),
        ),
        Center(
          child: Text.rich(
            TextSpan(
              text: StringsManager.privacyAndPolicyText1,
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: StringsManager.privacyAndPolicyText2,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                TextSpan(
                  text: StringsManager.privacyAndPolicyText3,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextSpan(
                  text: StringsManager.privacyAndPolicyText4,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  @override
  void dispose() {
    isChecked.dispose();
    super.dispose();
  }
}
