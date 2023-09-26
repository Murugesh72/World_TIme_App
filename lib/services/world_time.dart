import 'dart:convert';

import 'package:http/http.dart';

class WorldTime {
  late String location;
  late String time = "";
  late String flag;
  late String url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    // Create a Uri object from the URL string
    Uri uri = Uri.parse('http://worldtimeapi.org/api/timezone/$url');

    // Make the HTTP request using the Uri object
    Response response = await get(uri);

    Map data = jsonDecode(response.body);

    // get properties from json
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);

    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    print(now);

    // set the time property
    time = now.toString();
  }
}
