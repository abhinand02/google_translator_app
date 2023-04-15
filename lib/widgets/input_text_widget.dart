import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_translator/Application/Home/home_bloc.dart';
import 'package:google_translator/services/api_service.dart';
import 'package:google_translator/widgets/text_widget.dart';

import '../constants/constants.dart';
import '../services/debounce/debounce.dart';

class InputTextWidget extends StatelessWidget {
  InputTextWidget({
    super.key,
    required this.controller,
    required this.target,
    required this.source,
    required this.stText,
    required this.length,
  });

  final TextEditingController controller;
  final String target, source, stText;
  final int length;
  final debouncer = Debouncer(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(text: 'Translate $stText '),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(133, 63, 63, 63),
              borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: controller,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(2300),
                ],
                keyboardType: TextInputType.multiline,
                maxLines: 7,
                cursorHeight: 25,
                onChanged: (value) {
                  print(value.length);
                  // print(target);
                  debouncer.run(() {
                    BlocProvider.of<HomeBloc>(context)
                        .add(GetLeng(newLen: value.length));
                    // APIService.translations(text: controller.text, target:target, source: source);
                    if ((target.isNotEmpty && source.isNotEmpty) &&
                        value.trim().isNotEmpty) {
                      BlocProvider.of<HomeBloc>(context).add(GetTranslatedText(
                          source: source,
                          target: target,
                          text: controller.text));
                    } else {
                      const snackBar = SnackBar(
                          content: Text("Please select target or source language"), backgroundColor: Colors.red);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: Divider(color: whiteClr),
              ),
              Text('$length/2300'),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ],
    );
  }
}
