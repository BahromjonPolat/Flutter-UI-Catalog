class Chat {
  final String _sender;
  final String _receiver;
  final String _message;

  Chat(this._sender, this._receiver, this._message);

  String get message => _message;

  String get receiver => _receiver;

  String get sender => _sender;
}
