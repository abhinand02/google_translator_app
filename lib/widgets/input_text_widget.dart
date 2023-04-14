import 'package:flutter/material.dart';
import 'package:google_translator/widgets/text_widget.dart';

import '../constants/constants.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextWidget(text: 'Translate From '),
            TextWidget(text: '(Germany)')
          ],
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 7,
                cursorHeight: 25,
                decoration: InputDecoration(border: InputBorder.none),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: Divider(color: whiteClr),
              ),
              Text('0/2300')
            ],
          ),
        ),
      ],
    );
  }
}