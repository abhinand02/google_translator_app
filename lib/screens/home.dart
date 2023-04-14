import 'package:flutter/material.dart';
import 'package:google_translator/services/api_service.dart';
import 'package:google_translator/widgets/text_widget.dart';
import 'package:iconsax/iconsax.dart';
import '../constants/constants.dart';
import '../widgets/input_text_widget.dart';
import '../widgets/language_selection_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(
                  text: 'Text Translation', 
                  fontSize: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                  child: Divider(color: whiteClr),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LanguageSelectionButton(
                      language: 'Germany',
                    ),
                    IconButton(
                        onPressed: () {
                          APIService.getLanguages();
                        },
                        icon: Icon(
                          Iconsax.arrow_2,
                          color: whiteClr,
                        )),
                    LanguageSelectionButton(
                      language: 'English',
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InputTextWidget(),
                InputTextWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




