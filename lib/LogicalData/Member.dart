import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Event.dart';

class Member{

  Member({required this.name, required this.surname, required this.hometown, required this.birthYear, required this.birthMonth, required this.birthDay, required this.point});

  String name;
  String surname;
  String hometown;
  late String email = '${name.toLowerCase() + surname.toLowerCase()}@gmail.com';
  late String password = name.toLowerCase() + surname.toLowerCase();
  int birthDay;
  int birthMonth;
  int birthYear;
  LatLng point;

  List<Event> joinedEvent = [];
  List<Event> createdEvent = [];

  void joinEvent({required Event event}){
    event.members.add(this);
    joinedEvent.add(event);
  }

  Event createEvent({required String name, required String description, String imagePath = 'assests/images/none.jpg', required int maxMember, required LatLng point}){
    Event newEvent = Event(name: name, description: description, imagePath: imagePath, creator: this, maxMember: maxMember, point: point);
    createdEvent.add(newEvent);
    return newEvent;
  }

}
