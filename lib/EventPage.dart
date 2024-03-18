import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'LogicalData/Event.dart';
import 'LogicalData/Member.dart';



class EventWidget extends StatefulWidget {
  //final String text;
  List<Member> members;
  List<Event> events;
  Member currentUser;

  final ScrollController _scrollController = ScrollController();

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
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Gölgenin rengi ve şeffaflığı
                      spreadRadius: 5, // Gölgenin yayılma yarıçapı
                      blurRadius: 7, // Gölgenin bulanıklık yarıçapı
                      offset: Offset(0, 3), // Gölgenin konumu (x, y)
                    )
                  ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
                    child: Map(currentUser: widget.currentUser, events: widget.events), ),
              ),
              Expanded(
                child: ListView(
                  controller: widget._scrollController,
                  children: [
                    for (Event event in widget.events)
                      GestureDetector(
                        onTap: () {

                        }, // evendetail görüntüle
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                color: Colors.grey.withOpacity(0.5), // Gölgenin rengi ve şeffaflığı
                                  spreadRadius: 5, // Gölgenin yayılma yarıçapı
                                  blurRadius: 7, // Gölgenin bulanıklık yarıçapı
                                  offset: Offset(0, 3), // Gölgenin konumu (x, y)
                                )
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                height: 130,
                                color: Colors.purple,
                                child: Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Row(
                                                  children: [
                                                    Expanded(child: Padding(padding: const EdgeInsets.only(left: 15),child: Text(event.name, style: const TextStyle(color: Colors.white),))), // başlık
                                                    Padding(padding: EdgeInsets.only(right: 15, top: 7),child: ElevatedButton(onPressed: () {
                                                        Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetails(event: event)),).then((result) {
                                                          if(result == true){
                                                            widget.currentUser.joinEvent(event: event);
                                                            setState(() {
                                                            });
                                                          }// EventDetails ekranından bir sonuç geldiğinde burada işlem yapabilirsiniz, ancak bu örnekte bir şey yapılmıyor.
                                                        });
      
                                                    }, child: Text('İncele')))
                                              ]),
                                              Row(
                                                children: [
                                                  Expanded(child: Flexible(child: Padding(padding: EdgeInsets.only(left: 10),child: Text(event.description, maxLines: 2, overflow: TextOverflow.fade,style: const TextStyle(color: Colors.white),)))),
                                                  SizedBox(width: 80, child: Padding(padding: EdgeInsets.only(left: 5),child: Text('${event.members.length}/${event.maxMember} kişi')))
                                                ],
                                              )
      
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
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
  late GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
      },

      initialCameraPosition: CameraPosition(target: widget.currentUser.point, zoom: 13),
      markers: <Marker>{
        Marker(
          markerId: MarkerId(widget.currentUser.name), // üzgünüm ama her Event birbirinden ayrı bir isme sahip olmalı
          position: widget.currentUser.point,
          icon: BitmapDescriptor.defaultMarker,
        ),
        for (Event event in widget.events)
          Marker(
            markerId: MarkerId(event.name), // üzgünüm ama her Event birbirinden ayrı bir isme sahip olmalı
            position: event.point,
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(
              title: event.name,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {return EventDetails(event: event);})).then((result) {
                  if (result == true) {
                    event.members.add(widget.currentUser);
                    widget.currentUser.joinedEvent.add(event);
                    setState(() {});
                  }
                });
              },
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {return EventDetails(event: event);})).then((result) {
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
  void moveCameraToEvent(Event event) {
    mapController.animateCamera(CameraUpdate.newLatLng(event.point));
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
          Text(event.description),
          Row(
            children: [
              const Text('Ekip Üyeleri:'),
              Text('${event.members.length}/${event.maxMember}')
            ],
          ),
          SizedBox(
            height: 300,
            width: 300,
            child: Expanded(
                child: ListView(
                  children: [
                    for(Member member in event.members)
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
                      ),
                  ],
                )
            ),
          )
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





// Row(
// children: [
// Text('${member.name} ${member.surname}'),
// IconButton(
// onPressed: () {
// /*MemberDetail*/
// },
// icon: const Icon(Icons.account_box),
// padding: const EdgeInsets.only(right: 10),
// )
// ],
// ),
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
