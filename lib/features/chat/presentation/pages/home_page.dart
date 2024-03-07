import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chat_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Random Chat',
          style: GoogleFonts.firaCode(color: Colors.green, fontSize: 18),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text(
              //   'Enter your name : ',
              //   style:
              //       GoogleFonts.firaCode(color: Colors.green, fontSize: 18),
              // ),\
              AnimatedTextKit(
                  isRepeatingAnimation: false,
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Enter your name : ',
                      textStyle: GoogleFonts.firaCode(
                          color: Colors.green, fontSize: 18),
                    ),
                  ]),
              SizedBox(
                width: 100,
                child: TextField(
                  onSubmitted: (String val) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>const ChatPage(),
                        ));
                  },
                  // showCursor: true,
                  autofocus: true,
                  style:
                      GoogleFonts.firaCode(color: Colors.green, fontSize: 18),
                  cursorColor: Colors.green,
                  decoration: const InputDecoration(
                    hoverColor: Colors.black,
                    fillColor: Colors.black,
                    filled: true,
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
          // Text(
          //   'Press Enter to make new connection',
          //   style: GoogleFonts.firaCode(color: Colors.green, fontSize: 18),
          // )
          AnimatedTextKit(
            totalRepeatCount: 1,
            animatedTexts: [
              TypewriterAnimatedText('Press Enter to make new connection',
                  textStyle:
                      GoogleFonts.firaCode(color: Colors.green, fontSize: 18))
            ],
          ),
        ],
      ),
    );
  }
}
