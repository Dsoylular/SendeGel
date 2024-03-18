import 'package:appjamteam39/LoginPage.dart';
import 'package:flutter/material.dart';
import 'LogicalData/Event.dart';
import 'LogicalData/Member.dart';
import 'LogicalData/startDataBase.dart';


void main() {
  startDataBase();
  globalMemberList = getMembers();
  globalEventList = getEvents();
  // runApp(MyApp(members: globalMemberList,events: globalEventList));
  runApp(MyApp(currentUser: globalMemberList[14], members: globalMemberList, events: globalEventList,));
}

List<Member> globalMemberList = [];
List<Event> globalEventList = [];




class MyApp extends StatelessWidget {
  List<Member> members;
  List<Event> events;
  Member currentUser; // 14
  MyApp({super.key, required this.events, required this.members, required this.currentUser});
  //MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EntryPage(events: globalEventList, members: globalMemberList, currentUser: currentUser),
      // home: Scaffold(
      //   body: EventWidget(currentUser: members[5], events: events,members: members,))
    );
  }
}
