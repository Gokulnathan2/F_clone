import 'package:rxdart/rxdart.dart';

class MyBloc {
  final BehaviorSubject<String> _textController = BehaviorSubject<String>();

  void updateText(String text) {
    _textController.sink.add(text);
  }

  Stream<String> get textStream => _textController.stream;

  String get textValue => _textController.value;

  dispose() {
    _textController.close();
  }
}
