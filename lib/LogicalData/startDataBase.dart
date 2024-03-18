import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Event.dart';
import 'Member.dart';
import 'package:flutter/material.dart';

List<Event> events = [];
List<Member> members = [];

void startDataBase() {
  Member mustafa = Member(name: 'Mustafa',
      surname: 'Yalçın',
      hometown: 'Mersin',
      birthYear: 2003,
      birthMonth: 7,
      birthDay: 25,
      point: const LatLng(41.013094, 29.079471));
  members.add(mustafa);
  Member ahmet = Member(name: 'Ahmet',
      surname: 'Günaydin',
      hometown: 'İstanbul',
      birthYear: 2002,
      birthMonth: 1,
      birthDay: 11,
      point: const LatLng(41.029412, 29.032607));
  members.add(ahmet);
  Member gulcan = Member(name: 'Gülcan',
      surname: 'Zerda',
      hometown: 'Karaman',
      birthYear: 2001,
      birthMonth: 2,
      birthDay: 1,
      point: const LatLng(41.049999, 29.105048));
  members.add(gulcan);
  Member jack = Member(name: 'Jack',
      surname: 'Toronto',
      hometown: 'Washington',
      birthYear: 2003,
      birthMonth: 3,
      birthDay: 7,
      point: const LatLng(41.049999, 29.105048));
  members.add(jack);
  Member elif = Member(name: 'Elif',
      surname: 'Zadeoğlu',
      hometown: 'Gümüşhane',
      birthYear: 2004,
      birthMonth: 8,
      birthDay: 16,
      point: const LatLng(41.043855, 29.003511));
  members.add(elif);
  Member melisa = Member(name: 'Melisa',
      surname: 'Sevil',
      hometown: 'Konya',
      birthYear: 2006,
      birthMonth: 5,
      birthDay: 28,
      point: const LatLng(41.087960, 29.044460));
  members.add(melisa);
  Member berat = Member(name: 'Berat',
      surname: 'Gümüş',
      hometown: 'Mersin',
      birthYear: 2003,
      birthMonth: 6,
      birthDay: 23,
      point: const LatLng(40.994700, 28.907509));
  members.add(berat);
  Member yusuf = Member(name: 'Yusuf',
      surname: 'Adil',
      hometown: 'Mersin',
      birthYear: 2003,
      birthMonth: 11,
      birthDay: 24,
      point: const LatLng(41.102746, 28.868010));
  members.add(yusuf);
  Member mehmet = Member(name: 'Mehmet',
      surname: 'Sakin',
      hometown: 'İzmir',
      birthYear: 1999,
      birthMonth: 12,
      birthDay: 26,
      point: const LatLng(38.467373, 27.135360));
  members.add(mehmet);
  Member emine = Member(name: 'Emine',
      surname: 'Durmaz',
      hometown: 'Edirne',
      birthYear: 2002,
      birthMonth: 10,
      birthDay: 29,
      point: const LatLng(38.469327, 27.178482));
  members.add(emine);
  Member recep = Member(name: 'Recep',
      surname: 'Durur',
      hometown: 'Çanakkale',
      birthYear: 2003,
      birthMonth: 9,
      birthDay: 30,
      point: const LatLng(41.013094, 29.079471));
  members.add(recep);
  Member tayyip = Member(name: 'Tayyip',
      surname: 'Bayezid',
      hometown: 'Mersin',
      birthYear: 2000,
      birthMonth: 5,
      birthDay: 14,
      point: const LatLng(36.889301, 30.686626));
  members.add(tayyip);
  Member ekrem = Member(name: 'Ekrem',
      surname: 'Hoca',
      hometown: 'Balıkesir',
      birthYear: 2001,
      birthMonth: 6,
      birthDay: 18,
      point: const LatLng(36.924853, 30.689437));
  members.add(ekrem);
  Member mahmut = Member(name: 'Mahmut',
      surname: 'Derbeder',
      hometown: 'Ankara',
      birthYear: 2000,
      birthMonth: 8,
      birthDay: 11,
      point: const LatLng(37.072540, 30.197547));
  members.add(mahmut);
  Member mansur = Member(name: 'Mansur',
      surname: 'Hızlı',
      hometown: 'Ankara',
      birthYear: 2004,
      birthMonth: 3,
      birthDay: 14,
      point: const LatLng(39.885694, 32.847596));
  members.add(mansur);
  Member murat = Member(name: 'Murat',
      surname: 'Tok',
      hometown: 'Ankara',
      birthYear: 2005,
      birthMonth: 1,
      birthDay: 23,
      point: const LatLng(39.954947, 32.589849));
  members.add(murat);
  Member afet = Member(name: 'Afet',
      surname: 'Gizli',
      hometown: 'İstanbul',
      birthYear: 2005,
      birthMonth: 3,
      birthDay: 31,
      point: const LatLng(39.963637, 32.901788));
  members.add(afet);

  Event e1 = tayyip.createEvent(name: 'İstanbul\'un Tarih Kokan Sokakları',
      description: 'İstanbul\'un daracık sokaklarında tarihi bir yolculuğa çıkalım.',
      imagePath: 'assets/images/daracik_sokaklar.jpg',
      maxMember: 4,
      point: const LatLng(41.0357, 28.9370));
  Event e2 = mansur.createEvent(name: 'Boğaz\'ın Büyüleyici Manzarası',
      description: 'Boğaziçi\'nde unutulmaz bir manzara keyfi yapalım.',
      imagePath: 'assets/images/bogazici_unutulmaz.jpg',
      maxMember: 5,
      point: const LatLng(41.0167, 29.0536));
  Event e3 = murat.createEvent(name: 'Tarihi Yarımada Keşfi',
      description: 'İstanbul\'un tarihi yarımadasını keşfe çıkalım.',
      imagePath: 'assets/images/buyuk_ada.jpg',
      maxMember: 6,
      point: const LatLng(41.0096, 28.9799));
  Event e4 = mansur.createEvent(name: 'Kapalıçarşı\'da Alışveriş Keyfi',
      description: 'Kapalıçarşı\'da alışveriş yapmak için buluşalım.',
      imagePath: 'assets/images/kapaliCarsi.jpg',
      maxMember: 4,
      point: const LatLng(41.0105, 28.9688));
  Event e5 = mahmut.createEvent(name: 'Sultanahmet\'te Görkemli Yapılar',
      description: 'Sultanahmet\'te Ayasofya ve Sultanahmet Camii\'ni ziyaret edelim.',
      imagePath: 'assets/images/img_4.png',
      maxMember: 5,
      point: const LatLng(41.0054, 28.9760));
  Event e6 = recep.createEvent(name: 'Galata Kulesi\'nde Manzara Keyfi',
      description: 'Galata Kulesi\'nde İstanbul manzarasının tadını çıkaralım.',
      imagePath: 'assets/images/galata.jpg',
      maxMember: 6,
      point: const LatLng(41.0259, 28.9744));
  Event e7 = yusuf.createEvent(name: 'İstanbul\'un Adalarında Bisiklet Turu',
      description: 'İstanbul\'un adalarında bisikletle tur atalım.',
      imagePath: 'assets/images/buyuk_ada.jpg',
      maxMember: 8,
      point: const LatLng(40.8760, 29.0916));
  Event e8 = emine.createEvent(name: 'İstiklal Caddesi\'nde Gece Yürüyüşü',
      description: 'İstiklal Caddesi\'nde gece yürüyüşü yapalım.',
      imagePath: 'assets/images/img_1.png',
      maxMember: 4,
      point: const LatLng(41.0340, 28.9799));
  Event e9 = ahmet.createEvent(name: 'İstanbul\'un Meşhur Lezzetleri Turu',
      description: 'İstanbul\'un en ünlü restoranlarında lezzet turu yapalım.',
      imagePath: 'assets/images/img_4.png',
      maxMember: 6,
      point: const LatLng(41.0082, 28.9784));
  Event e10 = ekrem.createEvent(name: 'Ortaköy\'de Boğaz Köprüsü Manzarası',
      description: 'Ortaköy\'de Boğaz Köprüsü\'nün manzarasını izleyelim.',
      imagePath: 'assets/images/img_6.png',
      maxMember: 5,
      point: const LatLng(41.0524, 29.0123));
  events.add(e1);
  events.add(e2);
  events.add(e3);
  events.add(e4);
  events.add(e5);
  events.add(e6);
  events.add(e7);
  events.add(e8);
  events.add(e9);
  events.add(e10);

  murat.joinEvent(event: e3);
  afet.joinEvent(event: e3);
  recep.joinEvent(event: e3);
  mustafa.joinEvent(event: e2);
  berat.joinEvent(event: e2);
  melisa.joinEvent(event: e3);
  elif.joinEvent(event: e4);
  jack.joinEvent(event: e2);
  gulcan.joinEvent(event: e2);
  mehmet.joinEvent(event: e7);
  gulcan.joinEvent(event: e3);
  ahmet.joinEvent(event: e4);
  melisa.joinEvent(event: e5);
  berat.joinEvent(event: e5);
  yusuf.joinEvent(event: e4);
  jack.joinEvent(event: e4);
  mansur.joinEvent(event: e7);
  ekrem.joinEvent(event: e7);
}

List<Member> getMembers() {
  return members;
}

List<Event> getEvents() {
  return events;
}





  /*Başlık: "İstanbul'un Tarih Kokan Sokakları"
Açıklama: İstanbul'un daracık sokaklarında tarihi bir yolculuğa çıkalım.
Lokasyon: Balat: 41.0357° N, 28.9370° E

Başlık: "Boğaz'ın Büyüleyici Manzarası"
Açıklama: Boğaziçi'nde unutulmaz bir manzara keyfi yapalım.
Lokasyon: Çamlıca Tepesi: 41.0167° N, 29.0536° E

Başlık: "İstanbul'un Lezzet Durağı: Karaköy"
Açıklama: Karaköy'de lezzetli bir yemek molası verelim.
Lokasyon: Karaköy Meydanı: 41.0244° N, 28.9747° E

Başlık: "Asırlık Çınarların Gölgesinde: Fenerbahçe Parkı"
Açıklama: Fenerbahçe Parkı'nda doğayla iç içe dinlenme zamanı.
Lokasyon: Fenerbahçe Parkı: 40.9873° N, 29.0515° E

Başlık: "İstanbul'un Cazibe Merkezi: Taksim Meydanı"
Açıklama: Taksim Meydanı'nda şehrin nabzını hissedelim.
Lokasyon: Taksim Meydanı: 41.0365° N, 28.9866° E

Başlık: "Adaların Huzur Dolu Sessizliği"
Açıklama: Adaların sakin atmosferinde huzura yolculuk.
Lokasyon: Büyükada: 40.8720° N, 29.1207° E

Başlık: "Büyüleyici Ege Esintileri: Moda Sahili"
Açıklama: Moda Sahili'nde Ege'nin serin esintilerini hissedelim.
Lokasyon: Moda Sahili: 40.9858° N, 29.0263° E

Başlık: "İstanbul'un Görkemli Tarih Sahnesi: Harbiye Askeri Müzesi"
Açıklama: Harbiye Askeri Müzesi'nde tarihin derinliklerine inelim.
Lokasyon: Harbiye Askeri Müzesi: 41.0412° N, 28.9886° E

Başlık: "İstanbul'un Renkli Pazarı: Mısır Çarşısı"
Açıklama: Mısır Çarşısı'nda renkli bir alışveriş deneyimi yaşayalım.
Lokasyon: Mısır Çarşısı: 41.0172° N, 28.9708° E*/
