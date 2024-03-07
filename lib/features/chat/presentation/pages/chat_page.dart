import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(index.toString()),
                    );
                  },
                )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      autofocus: true,
                      onSubmitted: (val) {},
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.black,
                        filled: true,
                        hoverColor: Colors.black,
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.send_outlined),
                          color: Colors.green,
                        ),
                      ),
                      style: GoogleFonts.firaCode(
                          color: Colors.green, fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
