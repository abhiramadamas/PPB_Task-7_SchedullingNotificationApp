import 'package:scheduling_and_notification/services/notification_service.dart';
import 'package:scheduling_and_notification/widgets/notification_button.dart';
import 'package:scheduling_and_notification/widgets/top_bar.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Colors.grey[200]!,
            ],
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const TopBar(title: 'Awesome Notification'),
            NotificationButton(
                text: "Normal Notification",
                onPressed: () async {
                  await NotificationService.showNotification(title: 'Title of the notification', body: "Body of the notification",);
                },
            ),
            NotificationButton(onPressed: () async {
              await NotificationService.showNotification(title: "Title of the notification", body: "Body of the notification", summary: "Small Summary", notificationLayout: NotificationLayout.Inbox,);
            }, text: "Notification With Summary"),
            NotificationButton(onPressed: () async {
              await NotificationService.showNotification(title: "Title of the notification", body: "Body of the notification", summary: "Small Summary", notificationLayout: NotificationLayout.ProgressBar,);
            }, text: "Progress Bar Notification"),
            NotificationButton(onPressed: () async {
              await NotificationService.showNotification(title: "Title of the notification", body: "Body of the notification", summary: "Small Summary", notificationLayout: NotificationLayout.Messaging,);
            }, text: "Message Notification"),
            NotificationButton(onPressed: () async {
              await NotificationService.showNotification(title: "Title of the notification", body: "Body of the notification", summary: "Small Summary", notificationLayout: NotificationLayout.BigPicture, bigPicture: "https://files.tecnoblog.net/wp-content/uploads/2019/09/emoji.jpg",);
            }, text: "Big Image Notification"),
            NotificationButton(onPressed: () async {
              await NotificationService.showNotification(title: "Title of the notification", body: "Body of the notification", summary: "Small Summary", payload: {
                "navigate": "true",
              }, actionButtons: [
                NotificationActionButton(key: 'check', label: 'Check it out', actionType: ActionType.SilentAction, color: Colors.green,)
              ]);
            }, text: "Action Button Notification"),
            NotificationButton(onPressed: () async {
              await NotificationService.showNotification(title: "Scheduled Notification", body: "Notification was fired after 5 seconds", scheduled: true, interval: 1,);
            }, text: 'Scheduled Notification'),
          ],
        ),
      ),
    );
  }
}