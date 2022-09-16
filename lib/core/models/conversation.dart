import 'package:meeja/core/enums/message_type.dart';

class Conversation{
  String? messageText;
  String? sentAt;
  bool? isMessageRead;
  String? sender;
  MessageType? type;

  Conversation({this.sentAt,this.isMessageRead,this.messageText,this.sender,this.type});

  Conversation.formJson(json, id){
    this.messageText = json['messageText'];
    this.sentAt = json['sentAt'];
    this.isMessageRead = json['isMessageRead'];
    this.sender = json['sender'];
    this.type = json['type'];
  }

  toJson(){
    return {
      'messageText' : this.messageText,
      'sentAt' : this.sentAt,
      'isMessageRead' : this.isMessageRead,
      'sender' : this.sender,
      'type' : this.type?.type ?? MessageType.text.type,
    };
  }

}