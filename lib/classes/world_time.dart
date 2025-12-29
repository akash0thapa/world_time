import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location='';
  String flag='';
  String time='';
  String day='';
  String date='';
  String url='';
  bool isDayTime=false;

  WorldTime({required this.location,required this.flag,required this.url});

Future<void> getTime() async{

  try{
// Getting Response
  Response response=await get (Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$url'));
  Map data=json.decode(response.body);
  String datetime=data['dateTime'];
  // print(response.body);

  // Create DateTime object
  DateTime now=DateTime.parse(datetime);
  // print(now);

  isDayTime=now.hour>5 && now.hour<18? true:false;
  print('is day:$isDayTime');
  // set time property
  time= DateFormat.jm().format(now);
  day= DateFormat.E('en_US').format(now);
  date= DateFormat.yMMMd('en_US').format(now);
}
catch(e){
  print("Error: $e");
  time='Cannot get time';
}
}

}

