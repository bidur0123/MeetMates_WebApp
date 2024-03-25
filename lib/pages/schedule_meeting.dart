import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ScheduleEventPage extends StatefulWidget {
  const ScheduleEventPage({Key? key}) : super(key: key);

  @override
  _ScheduleEventPageState createState() => _ScheduleEventPageState();
}

class _ScheduleEventPageState extends State<ScheduleEventPage> {
  late final TextEditingController _eventNameController;
  late final TextEditingController _dateController;
  late final TextEditingController _startTimeController;
  late final TextEditingController _endTimeController;
  late final TextEditingController _descriptionController;

  Color _selectedColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    _eventNameController = TextEditingController();
    _dateController = TextEditingController();
    _startTimeController = TextEditingController();
    _endTimeController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _eventNameController.dispose();
    _dateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _selectColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select a color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: _selectedColor,
              onColorChanged: (color) {
                setState(() {
                  _selectedColor = color;
                });
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Schedule Event'),
        ),
        body: Stack(
          children: [
           // const ParticlesBackground(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _eventNameController,
                      decoration: const InputDecoration(
                        labelText: 'Event Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        labelText: 'Select Date',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () async {
                            final selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2050),
                            );
                            if (selectedDate != null) {
                              setState(() {
                                _dateController.text =
                                    selectedDate.toString();
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _startTimeController,
                            decoration:  InputDecoration(
                              labelText: 'Start Time',
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.access_time),
                              ),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: _endTimeController,
                            decoration:  InputDecoration(
                              labelText: 'End Time',
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.access_time),
                              ),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Meeting Description',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Event Color',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const SizedBox(width: 10.0),
                        GestureDetector(
                          onTap: () => _selectColor(context),
                          child: Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: _selectedColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {

                        },
                        child: const Text('Add Event'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
