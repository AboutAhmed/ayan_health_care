
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final String? title;
  final bool? value;
  final ValueChanged<bool?>? onChange;

  const CustomCheckBox({super.key, this.title, this.value, this.onChange});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChange!(!value!),
      child: SizedBox(
        width: 90,
        child: Row(
          children: [
            Text(title!, style: const TextStyle(fontSize: 13, color: Colors.black)),
            Checkbox(
              value: value,
              onChanged: (bool? value) => onChange!(value),
            )
          ],
        ),
      ),
    );
  }
}
