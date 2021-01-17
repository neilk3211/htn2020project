import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*testing stuff here
int maxLength = 2;
final bool maxLengthEnforced = true;*/

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final nameController = TextEditingController();
  final hourController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Task'),
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
                  key: _formKey,
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: nameController,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  labelText: 'Name of Task *',
                  labelStyle: TextStyle(
                    color: Colors.blue,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'task name is required';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height:20),
              TextFormField(
              cursorColor: Colors.blue,
              controller: hourController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Hours to Complete Task',
                icon: Icon(Icons.hourglass_bottom),
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return null;
                }
                try { 
                  double.parse(value);
                  return null;
                } catch (e)  {
                  return 'please enter a number';
                }
              },
              ),
              SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.pop(context, {
                        'taskname': nameController.text,
                        'duration': hourController.text.isEmpty ? null : double.parse(hourController.text)*3600 //convert hour to seconds
                      });
                    }
                  }, 
                  child: Text('Save')),
              )
            ],
          ),
        ),
      ),
    );
  }
}