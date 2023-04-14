import 'package:home_smart/Utilitize/utilitize.dart';
import 'package:http/http.dart' as http;
import '../api.dart';
class GetAttacks {
  Future<dynamic> getAttacks() async {
    const endPoint = "/api/alerts/1" ;
    dynamic data = await Api().get(
      apiUrl: Utilities.baseURL  + endPoint ,
    );
    return data;
  }


}
