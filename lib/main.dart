import 'package:appjamteam39/EventPage.dart';
import 'package:flutter/material.dart';
import 'package:appjamteam39/EntryPage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'LogicalData/Event.dart';
import 'LogicalData/Member.dart';
import 'LogicalData/startDataBase.dart';


void main() {
  startDataBase();
  globalMemberList = getMembers();
  globalEventList = getEvents();
  runApp(MyApp(members: globalMemberList,events: globalEventList));
}

List<Member> globalMemberList = [];
List<Event> globalEventList = [];




class MyApp extends StatelessWidget {
  List<Member> members;
  List<Event> events;
  Member currentUser = Member(name: 'system', surname: 'bot', hometown: 'Processor', birthYear: 0, birthMonth: 0, birthDay: 1, point: const LatLng(0,0));
  MyApp({super.key, required this.events, required this.members});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EventWidget(members: members, events: events, currentUser: currentUser),
    );
  }
}
