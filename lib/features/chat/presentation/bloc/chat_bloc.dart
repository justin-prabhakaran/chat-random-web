import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:randomweb/features/chat/data/repositories/repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  List<String> messages = [];

  ChatBloc() : super(ChatInitial()) {
    on<MessageRecivedEvent>((event, emit) {
      messages.add(event.message);
      emit(ChatRecivedState(List<String>.from(messages)));
    });

    on<SendMessageEvent>((event, emit) {
      Repository.instance.sendMessage(event.message);
    });

    on<UserConnectedEvent>((event, emit) {
      messages = [];
      emit(UserConnectedState());
    });
    on<UserDisconnectedEvent>((event, emit) {
      messages = [];
      emit(UserDisconnectedState());
    });

    on<AddLoadingEvent>(
      (event, emit) {
        emit(LoadingState());
      },
    );
  }
}
