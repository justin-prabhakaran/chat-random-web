import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomweb/features/chat/data/repositories/repository.dart';

import '../bloc/chat_bloc.dart';

class ChatPage extends StatelessWidget {
  // final List<String> messages = [];

  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Repository.instance.makeConnection();
    BlocProvider.of<ChatBloc>(context).add(AddLoadingEvent());
    Repository.instance.listen(context);

    return Scaffold(
      body: BlocListener<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state is UserConnectedState) {
            showSnackBar(context, "User Connected Successfull");
          }
          if (state is UserDisconnectedState) {
            showSnackBar(context, "User Disconnected !");
            Navigator.pop(context);
          }
        },
        child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  BlocBuilder<ChatBloc, ChatState>(
                    builder: (context, state) {
                      if (state is ChatRecivedState) {
                        print('Log : Rebuilding.......');
                        print('Message :' + state.messages.last);
                        return Expanded(
                          child: ListView.builder(
                            itemCount: state.messages.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(state.messages[index]),
                              );
                            },
                          ),
                        );
                      } else if (state is LoadingState) {
                        return const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return Expanded(child: Container());
                      }
                    },
                  ),
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
                        onSubmitted: (val) {
                          BlocProvider.of<ChatBloc>(context)
                              .add(SendMessageEvent(val));
                        },
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
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: GoogleFonts.firaCode(color: Colors.green, fontSize: 18),
      ),
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.green)),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          left: MediaQuery.of(context).size.width - 500,
          right: 20),
    ));
  }
}
