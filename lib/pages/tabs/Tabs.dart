import 'package:flutter/material.dart';

import 'Leaderboard.dart';
import 'Profile.dart';
import 'Track.dart';
import 'Activities.dart';
import 'Discover.dart';


class Tabs extends StatefulWidget {
  Tabs({super.key});


  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    TrackPage(),
    ActivitiesPage(),
    DiscoverPage(),
    LeaderboardPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child:Scaffold(
          appBar: AppBar(
            title: const Text("go_eco"),
            backgroundColor: Colors.green,
            centerTitle: true,

          ),
          body: _pages[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.green,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (int index){
              setState(() {
                _currentIndex=index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.track_changes),
                  label: "Track"
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_activity),
                label: "Activities",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Discover",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: "Leaderboard",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle),
                label: "Profile",
              ),
            ],
          ),
        )
    );
  }
}