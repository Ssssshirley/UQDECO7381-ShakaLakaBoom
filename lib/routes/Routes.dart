import 'package:flutter/material.dart';
import 'package:quiz/pages/tabs/Track.dart';

import '../pages/tabs/Activities.dart';
import '../pages/tabs/Discover.dart';
import '../pages/tabs/Leaderboard.dart';
import '../pages/tabs/Profile.dart';
import '../pages/tabs/Tabs.dart';

//configure your button route here
final Map routes = {
  "/": (context) => Tabs(),
  "/Track": (context) => const TrackPage(),
  "/Activities": (context) => const ActivitiesPage(),
  "/Discover": (context) => const DiscoverPage(),
  "/Leaderboard": (context) => const LeaderboardPage(),
  "/Profile": (context) => const ProfilePage(),
};

//do not modify this.
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
