import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessageMixin {
  void messageListener(Rxn<MessageModel> message) {
    ever<MessageModel?>(message, (model) {
      if (model != null) {
        _elegantNotificationWidget(
          type: model.type,
          message: message.value!,
        );
      }
    });
  }

  Future<void> _elegantNotificationWidget({
    required MessageType type,
    required MessageModel message,
  }) async {
    if (type == MessageType.sucess) {
      return _snack(
        color: Colors.green,
        msg: message.message,
        title: message.title,
        icon: Icons.check,
      );
    } else if (type == MessageType.infor) {
      return _snack(
        color: Colors.blue,
        msg: message.message,
        title: message.title,
        icon: Icons.info_outline,
      );
    } else {
      return _snack(
        color: Colors.red,
        msg: message.message,
        title: message.title,
        icon: Icons.error,
      );
    }
  }

  _snack(
          {required Color color,
          required String title,
          required String msg,
          required IconData icon}) =>
      Get.snackbar(
        title,
        msg,
        icon: Icon(icon, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: color,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );
}

class MessageModel {
  final String title;
  final String message;
  final MessageType type;

  MessageModel.error(this.title, this.message) : type = MessageType.error;
  MessageModel.sucess(this.title, this.message) : type = MessageType.sucess;
  MessageModel.info(this.title, this.message) : type = MessageType.infor;
}

enum MessageType { error, sucess, infor }

extension MessageTypeExtension on MessageType {
  Color get color {
    switch (this) {
      case MessageType.infor:
        return Colors.blue[200] ?? Colors.blue;
      case MessageType.error:
        return Colors.red[600] ?? Colors.red;
      case MessageType.sucess:
        return Colors.green;
    }
  }
}
