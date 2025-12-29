import 'package:flutter/material.dart';
import 'package:world_time/classes/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  
void setupWorldTime() async{
  WorldTime instance=WorldTime(location: 'Kathmandu',flag: 'Nepal.png',url: 'Asia/Kathmandu');
  await instance.getTime();
  print(instance.time);
  Navigator.pushReplacementNamed(context,'/home',arguments: {
    'location':instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'day': instance.day,
    'date': instance.date,
    'isDayTime':instance.isDayTime,
  });
  
}
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
        body:Center(
          child: SpinKitCircle(
          color: Colors.black,
          size: 50.0,
        ),
        ),
    );
  }
}