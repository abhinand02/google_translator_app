import 'package:flutter/material.dart';
import 'package:google_translator/widgets/text_widget.dart';

class LanguageSelectionButton extends StatelessWidget {
  const LanguageSelectionButton({
    super.key,
    required this.language,
  });

  final String language;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          context: context,
          builder: (context) {
            return Container(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('From'),
                      ],
                    ),
                  ),
                  Container(
                    child: Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(Icons.share),
                            title: Text('Share'),
                          );
                        },
                        itemCount: 10,
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
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
      child: TextWidget(
        text: language,
        fontSize: 18,
      ),
    );
  }
}
