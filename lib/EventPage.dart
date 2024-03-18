import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'LogicalData/Event.dart';
import 'LogicalData/Member.dart';



class EventWidget extends StatefulWidget {
  //final String text;
  List<Member> members;
  List<Event> events;
  Member currentUser;

  EventWidget(
      {super.key,
      required this.members,
      required this.events,
      required this.currentUser});

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Map(currentUser: widget.currentUser, events: widget.events),
            ),
            ListView(
              children: [
            for (Event event in widget.events)
              const Text('Hello'),
              /*Row(
                children: [
                  Column(
                    children: [
                      Text(event.name),
                      Text(event.description)
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (event.isItJoinAble()) {
                              setState(() {
                                event.members.add(widget.currentUser);
                                widget.currentUser.joinedEvent.add(event);
                              }); // ekrana pop-up çıksın ve bu etkinliğe katıldınız vs. yazsın. setState Yapalıcak mı?
                            }
                            else {
                              null;
                            }
                          },
                          child: const Text('KATIL')),
                      // on pressed düzenlenecek
                      Text('${event.members.length}/${event.maxMember}')
                    ],
                  ),
                ],
              ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Map extends StatefulWidget {
  Map({super.key, required this.currentUser, required this.events});

  Member currentUser;
  List<Event> events;

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: widget.currentUser.point, zoom: 13),
      markers: {
        for (Event event in widget.events)
          Marker(
            markerId: MarkerId(event.name), // üzgünüm ama her Event birbirinden ayrı bir isme sahip olmalı
            position: event.point,
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(
              title: event.name,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EventDetails(event: event);
                })).then((result) {
                  if (result == true) {
                    event.members.add(widget.currentUser);
                    widget.currentUser.joinedEvent.add(event);
                    setState(() {});
                  }
                });
              },
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EventDetails(event: event);
              })).then((result) {
                if (result == true) {
                  event.members.add(widget.currentUser);
                  widget.currentUser.joinedEvent.add(event);
                  setState(() {});
                }
              });
            },
          ),
      },
    );
  }
}

class EventDetails extends StatelessWidget {
  EventDetails({super.key, required this.event});

  Event event;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(event.name),
      content: Column(
        children: [
          Text(event.name),
          Text(
            event.description,
            overflow: TextOverflow.fade,
            maxLines: 2,
          ),
          Row(
            children: [
              const Text('Ekip Üyeleri:'),
              Text('${event.members}/${event.maxMember}')
            ],
          ),
          ListView(
            children: [
              for (Member member in event.members)
                Row(
                  children: [
                    Text('${member.name} ${member.surname}'),
                    IconButton(
                      onPressed: () {
                        /*MemberDetail*/
                      },
                      icon: const Icon(Icons.account_box),
                      padding: const EdgeInsets.only(right: 10),
                    )
                  ],
                )
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false); // İletişim kutusunu kapat ve ekibe katılma
          },
          child: const Text('Kapat'),
        ),
        TextButton(
          onPressed: () {
            if (event.isItJoinAble()) {
              Navigator.of(context).pop(true); // İletişim kutusunu kapat ve ekibe katıl
            } else {
              null;
            }
          },
          child: const Text('Katıl'),
        ),
      ],
    );
  }
}

// class MemberDetail extends StatelessWidget {
//   const MemberDetail({super.key, required this.member});
//   final Member member;
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('${member.name} + ${member.surname}'),
//       content: Center(
//         child: Column(
//           children: [
//
//           ],
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop(); // İletişim kutusunu kapat
//           },
//           child: Text('Tamam'),
//         ),
//       ],
//     );
//   }
// }


/*
* Scaffold(
      body: Column(
        children: [
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: (){
                    // TODO: FILTER EKRANINA GİDİLECEK YAZILMASI LAZIM
                  },
                  child: Icon(Icons.filter_list),
              ),
              SizedBox(width: 8),
            ],
          ),
          // TODO: BURASI TASARLANACAK
        ],
      ),
    );*/
