import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:randomweb/features/chat/data/repositories/repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    final List<String> messages = [];

    on<MessageRecivedEvent>((event, emit) {
      messages.add(event.message);
      emit(ChatRecivedState(messages));
    });

    on<SendMessageEvent>((event, emit) {
      Repository().sendMessage(event.message);
    });

    on<UserConnectedEvent>((event, emit) {
      emit(UserConnectedState());
    });
    on<UserDisconnectedEvent>((event, emit) {
      emit(UserDisconnectedState());
    });
  }
}
