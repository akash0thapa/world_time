import 'package:flutter/material.dart';
import 'package:world_time/classes/world_time.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
     List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kathmandu', location: 'Kathmandu', flag: 'nepal.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(url: 'Asia/Beijing', location: 'Beijing', flag: 'china.png'),
    WorldTime(url: 'Asia/BT', location: 'Bhutan', flag: 'bhutan.png'),
  ];

void UpdateTime(index) async{
  WorldTime instance=locations[index];
  await instance.getTime();
  /*navigate to home screen
  instead of pushing home screen, we pop the selection location page*/
  Navigator.pop(context,{
    'location':instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'day': instance.day,
    'date': instance.date,
    'isDayTime':instance.isDayTime,
  });
  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        title: Text('Select Location',
        style: TextStyle(
          fontSize: 25.0,
          letterSpacing: 1.5,
          color: Colors.white,
          fontWeight: FontWeight.w500
        ),),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
      ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: (){
                  UpdateTime(index);
                },
                title: Text(locations[index].location,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('lib/assets/${locations[index].flag}'),
                ),
              ),       
            ),
          ),
          ),      
    );
  }
}