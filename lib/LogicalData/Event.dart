import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Member.dart';

class Event{
  Event({required this.name, required this.description, this.imagePath = 'assests/images/none.jpg', required this.creator, required this.maxMember, required this.point}){members.add(creator);}

  String name;
  String description;
  String imagePath;
  Member creator;
  int maxMember;
  LatLng point;
  List<Member> members = [];

  bool isItJoinAble(){
    if(members.length < maxMember){
      return true;
    }
    return false;
  }



}