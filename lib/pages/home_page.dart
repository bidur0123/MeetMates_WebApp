import 'package:flutter/material.dart';
import 'package:flutter_agora_demo/pages/calender_page.dart';
import 'package:flutter_agora_demo/pages/create_channel_page.dart';
import 'package:flutter_agora_demo/pages/join_channel_page.dart';
import 'package:flutter_agora_demo/pages/schedule_meeting.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('MeetMates'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Welcome Mates!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                const Text("Have a nice day!",
                    style: TextStyle(
                      fontSize: 16,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Wrap(
                      children: [
                        _buildMenuItem(
                            'Create Meeting',
                            Icons.video_call, () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateChannelPage()));
                        }
                        ),
                        _buildMenuItem(
                            'Join Meeting',
                            Icons.group, () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const JoinChannelPage()));
                        }
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        _buildMenuItem('Schedule Meeting', Icons.event, () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const ScheduleEventPage()));
                        }),
                        _buildMenuItem('Calendar', Icons.calendar_today, () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> CalendarPage()));
                        }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SvgPicture.asset(
                'asset/video_call.svg',
                semanticsLabel: 'image',
                fit: BoxFit.contain,
                placeholderBuilder: (BuildContext context) => Container(
                    margin: const EdgeInsets.only(left: 350),
                    child: const CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, Function() onTap) {
    return SizedBox(
      height: 150,
      width: 200,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 50,
                  color: Colors.blue,
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
