import 'package:appjamteam39/LoginPage.dart';
import 'package:appjamteam39/EventPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'LogicalData/Event.dart';
import 'LogicalData/Member.dart';
import 'LogicalData/startDataBase.dart';


void main() {
  startDataBase();
  globalMemberList = getMembers();
  globalEventList = getEvents();
  // runApp(MyApp(members: globalMemberList,events: globalEventList));
  runApp(MyApp());
}

List<Member> globalMemberList = [];
List<Event> globalEventList = [];




class MyApp extends StatelessWidget {
  // List<Member> members;
  // List<Event> events;
  // Member currentUser = Member(name: 'system', surname: 'bot', hometown: 'Processor', birthYear: 0, birthMonth: 0, birthDay: 1, point: const LatLng(0,0));
  // MyApp({super.key, required this.events, required this.members});
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loginpage(),
      // home: Scaffold(
      //   body: EventWidget(currentUser: members[5], events: events,members: members,))
    );
  }
}
