import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:home_smart/service/end_point/checkNewAttacks.dart';

class Utilities {

  static String baseURL= 'http://192.168.8.116' ;
  @pragma('vm:entry-point')
  static Future<void> triggerNot() async {
    await CheckAttacksService().checkAttacks().then((attacks) {
      List<dynamic> data = attacks as List<dynamic> ;
      if(data.isNotEmpty){
        AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: 10,
              channelKey: "Basic_channel_key" ,
              title: "Smart Home Notification" ,
              body: "Here new Notification for you Please look up for it "
          ),

        ) ;
      }
    }) ;



  }
}