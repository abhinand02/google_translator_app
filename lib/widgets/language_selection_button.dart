import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_translator/model/lang_code_list.dart';
import 'package:google_translator/widgets/text_widget.dart';

import '../Application/Home/home_bloc.dart';

class LanguageSelectionButton extends StatelessWidget {
  const LanguageSelectionButton({
    super.key,
    required this.language,
    required this.desLang,
  });

  final String language;
  final String desLang;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            BlocProvider.of<HomeBloc>(context).add(const GetLanguages());
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              context: context,
              builder: (context) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(desLang),
                          ],
                        ),
                      ),
                      Container(
                        child: Expanded(
                          child: BlocBuilder<HomeBloc, HomeState>(
                            builder: (context, state) {
                              if (state.langList == null) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  final so =  state.langList![index].language;
                                  final data = LangList.isoLangs[
                                      state.langList![index].language];
                                  return ListTile(
                                    onTap: () {
                                      // print(so);
                                      BlocProvider.of<HomeBloc>(context).add(
                                          desLang == 'To'
                                              ? IsSelectedLang(
                                                  newSourceLang: state
                                                      .isSelectedSourceLang,
                                                  newTargetLang: data!['name']!,
                                                  newSourceCode: state
                                                          .sourceLangCode ??
                                                      '',
                                                  newTargrtCode: so)
                                              : IsSelectedLang(
                                                  newSourceLang: data!['name']!,
                                                  newTargetLang: state
                                                      .isSelectedTargetLang,
                                                  newSourceCode: so,
                                                  newTargrtCode:
                                                      state.targetLangCode ??
                                                          ''));
                                      Navigator.of(context).pop();
                                    },
                                    title: Text(data?['name'] ?? ''),
                                  );
                                },
                                itemCount: 64,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(133, 98, 97, 97),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // <-- Radius
            ),
          ),
          child: Container(
            width: width * .26,
            child: FittedBox(
              child: TextWidget(
                text: language,
                fontSize: 18,
              ),
            ),
          )),
    );
  }
}
