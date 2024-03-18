import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class AddNewTravelPage extends StatefulWidget {
  const AddNewTravelPage({super.key});

  @override
  State<AddNewTravelPage> createState() => _AddNewTravelPageState();
}

class _AddNewTravelPageState extends State<AddNewTravelPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _eventNameController = TextEditingController();
  TextEditingController _areaNameController = TextEditingController();

  TextEditingController _eventDateController = TextEditingController();

  TextEditingController _maxPersonController = TextEditingController();
  TextEditingController _areaController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  TimeOfDay? selectedTime= TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    String selectedDateFormat = DateFormat.yMd().format(_selectedDate);

    return Scaffold(
      appBar: _appbarDesign(),
      body: SingleChildScrollView(
        primary: true,
        child: Column(
          children: [
            const SizedBox(height: 30),
            _image(),
            const SizedBox(height: 20),
            Container(color: Colors.purple, height: 5, width: double.infinity),
            Padding(
              padding: const EdgeInsets.only(left:16.0, right: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                          labelText: 'Etkinliği Yapan Kişinin Adı '),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Lütfen adınızı girin';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _eventNameController,
                      decoration:
                      const InputDecoration(labelText: 'Etkinliğin Adı'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Lütfen adınızı girin';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _areaController,
                      decoration:
                      const InputDecoration(labelText: 'Gezilecek Yer'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Lütfen adınızı girin';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Etkinliğin Tarihi ",
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedDateFormat,
                          style: const TextStyle(fontSize: 18),
                        ),
                        ElevatedButton(
                          onPressed: _presentDatePicker,
                          child: const Icon(
                            Icons.calendar_month_outlined,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    const Text(
                      "Etkinliğin Saati ",
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedTime!.format(context),
                          style: const TextStyle(fontSize: 18),
                        ),
                        ElevatedButton(
                          onPressed: () => _selectTime(context),
                          child: const Icon(
                            Icons.timer_sharp,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    TextFormField(
                      controller: _maxPersonController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Maximum Kişi Katılımcı Sayısı'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Lütfen adınızı girin';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),


                    _saveButton(_submitForm),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Center _saveButton(void _submitForm()) {
    return Center(
        child: TextButton.icon(
            style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                fixedSize: const Size(170, 50)),
            onPressed: (){
              _submitForm;
              Navigator.pop(context);
            },
            icon: const Icon(Icons.download_done_rounded, color: Colors.white),
            label: const Text(
              "Kaydet",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            )));
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Formu gönderme işlemleri burada yapılır
      print('Ad: ${_nameController.text}');
      print('E-posta: ${_areaController.text}');
    }
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((pickedDate) {
      if (pickedDate != null && pickedDate != _selectedDate) {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  Center _image() {
    return Center(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
                20), // Adjust the radius to your preference
            child: Image.asset(
              'assets/images/img_1.png',
              fit: BoxFit.cover,
              width:
              300, // Adjust the width and height of the image container as needed
              height: 200,
            ),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 25,
                  )))
        ],
      ),
    );
  }

  AppBar _appbarDesign() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: Colors.white, // Change the color of the back button here
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Align(
        alignment: Alignment.centerRight,
        child: Text(
          'SendeGel',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.purple, Colors.deepPurple],
          ),
        ),
      ),
      backgroundColor: Colors.transparent, // Make the app bar transparent
      elevation: 0, // Remove the shadow
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(
              50), // You can adjust this value to change the shape
        ),
      ),
      centerTitle: true, // Center the title
    );
  }
}
