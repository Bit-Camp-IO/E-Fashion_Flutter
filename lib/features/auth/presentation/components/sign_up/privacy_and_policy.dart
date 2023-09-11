import 'package:flutter/material.dart';

class PrivacyAndPolicy extends StatefulWidget {
  const PrivacyAndPolicy({Key? key}) : super(key: key);

  @override
  State <PrivacyAndPolicy> createState() => _PrivacyAndPolicyState();
}

class _PrivacyAndPolicyState extends State<PrivacyAndPolicy> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (newBool) {
            setState(() {
              _isChecked = newBool!;
            });
          },
        ),
        Center(
          child: Text.rich(
            TextSpan(
              text: "I Agree with",
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: " Privacy",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                TextSpan(
                  text: " and",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextSpan(
                  text: " policy",
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
}
