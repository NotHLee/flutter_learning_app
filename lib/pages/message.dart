import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/widgets/app_bar.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)?.settings.arguments as RemoteMessage?;

    return Scaffold(
      appBar: CustomAppBar(title: 'Message'),
      body: Column(
        children: [
          if (message != null) ...[
            Text(message.notification!.title.toString()),
            Text(message.notification!.body.toString()),
            Text(message.data.toString()),
          ] else ... [
            Text('No message available')
          ],
        ],
      ),
    );
  }
}