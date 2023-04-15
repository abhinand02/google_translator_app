import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_translator/services/api_service.dart';
import 'package:google_translator/widgets/text_widget.dart';
import 'package:iconsax/iconsax.dart';
import '../Application/Home/home_bloc.dart';
import '../constants/constants.dart';
import '../widgets/input_text_widget.dart';
import '../widgets/language_selection_button.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

final TextEditingController sourController = TextEditingController();
late  TextEditingController targController;
var source, target;
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
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LanguageSelectionButton(
                          language: state.isSelectedSourceLang,
                          desLang: 'From',
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Iconsax.arrow_2,
                              color: whiteClr,
                            )),
                        LanguageSelectionButton(
                          desLang: 'To',
                          language: state.isSelectedTargetLang,
                        )
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    targController = TextEditingController(text: state.translatedText);
                    print(state.sourceLangCode);
                    return Column(
                                  children: [
                                    InputTextWidget(controller:sourController,target: state.targetLangCode ?? '',source: state.sourceLangCode ?? '' , stText: 'From ${state.isSelectedSourceLang}',length: state.sourceTextLen,),
                                    InputTextWidget(controller: targController,target:  state.targetLangCode ?? '', source: state.sourceLangCode ?? '', stText: 'To ${state.isSelectedTargetLang}',length:  state.sourceTextLen,),
                                  ],
                                );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
