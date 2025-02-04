import 'package:flutter/material.dart';
import 'package:maggood/utils/appcolor.dart';
import 'package:maggood/utils/appwidgets.dart';
import 'package:maggood/viewmodels/providers/booklet_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:provider/provider.dart';

class BookletScreen extends StatelessWidget {
  const BookletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1 / 2,
            decoration: const BoxDecoration(
              color: mainGreen,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 60),
                const Text(
                  "Buku Panduan",
                  style: TextStyle(
                    color: mainWhite,
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                  ),
                ),
                const Text(
                  "Panduan dan informasi seputar proses budidaya maggot.",
                  style: TextStyle(
                    color: mainWhite,
                  ),
                ),
                Consumer<BookletProvider>(builder: (context, state, _) {
                  return state.isLoaded
                      ? Container(
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: mainWhite,
                            boxShadow: [cardShadow()],
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 2 / 3,
                            child: Consumer<BookletProvider>(
                                builder: (context, state, _) {
                              return PdfView(
                                controller: state.pdfController,
                                scrollDirection: Axis.vertical,
                                onDocumentError: (error) {
                                  debugPrint(error.toString());
                                },
                                onDocumentLoaded: (document) {
                                  context
                                      .read<BookletProvider>()
                                      .setIsLoaded(true);
                                },
                              );
                            }),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(
                            top: (MediaQuery.of(context).size.height / 2) - 136,
                          ),
                          child: const CircularProgressIndicator(
                            color: mainBlack,
                          ),
                        );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
