import 'package:home_smart/Utilitize/utilitize.dart';
import 'package:http/http.dart' as http;
import '../api.dart';
class CheckAttacksService {
  Future<dynamic> checkAttacks() async {
    const endPoint = "/api/alerts/unread/1" ;
    dynamic data = await Api().get(
      apiUrl: Utilities.baseURL  + endPoint ,

    );
    return data;
  }


}
