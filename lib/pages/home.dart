import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  String isDay='';
  @override
  Widget build(BuildContext context) {

    data=data.isNotEmpty?data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    String bgImage=data['isDayTime']? 'day.png':'night.png';
  Color bgColor = data['isDayTime']
    ? Color(0xff468DAA)
    : Color(0xff042342);
    return Scaffold(
      backgroundColor: bgColor ,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Text(data['location'],
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),                 
                  ],
                ),
                
                 Text(data['time'],
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),), 
                      
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(data['day'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                        SizedBox(width: 10,),
                        Text(data['date'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),                
                   ],
                 ),                               
                SizedBox(height: 10), 
                 TextButton.icon(                     
                onPressed: ()async{
                  dynamic result=await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data={
                      'flag': result['flag'],
                      'location': result['location'],
                      'time': result['time'],
                      'day': result['day'],
                      'date': result['date'],
                      'isDayTime':result['isDayTime']
                    };
                  });
                },
                icon: Icon(Icons.edit_location, 
                size: 15,           
                color: Colors.grey[200]),
                label: Text('Edit Location',
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.5,
                  color: Colors.grey[200],
                  fontWeight: FontWeight.bold,
                ),),
                ),           
              ],            
            ),
            
          ),         
        ),
        
    );
  }
}