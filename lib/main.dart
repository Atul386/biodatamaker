import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'display_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marriage Biodata Maker',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MarriageBiodata(),
    );
  }
}

class MarriageBiodata extends StatefulWidget {
  @override
  _MarriageBiodataState createState() => _MarriageBiodataState();
}

class _MarriageBiodataState extends State<MarriageBiodata> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, String> _formData = {
    'fullName': '',
    'dob': '',
    'timeOfBirth': '',
    'pob': '',
    'complexion': '',
    'height': '',
    'caste': '',
    'occupation': '',
    'income': '',
    'education': '',
    'fatherName': '',
    'motherName': '',
    'siblings': '',
    'phone': '',
    'email': '',
    'address': '',
  };

  Future<void> _saveFormData() async {
    final prefs = await SharedPreferences.getInstance();
    _formData.forEach((key, value) {
      prefs.setString(key, value);
    });
  }

  void _clearForm() {
    _formKey.currentState?.reset();
    _formData.updateAll((key, value) => '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marriage Biodata Maker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Personal Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  labelText: 'Full Name',
                  onSaved: (value) {
                    _formData['fullName'] = value!;
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                DatePickerField(
                  labelText: 'Date of Birth',
                  onSaved: (value) {
                    _formData['dob'] = value!;
                  },
                ),
                SizedBox(height: 10),
                TimePickerField(
                  labelText: 'Time of Birth',
                  onSaved: (value) {
                    _formData['timeOfBirth'] = value!;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  labelText: 'Place Of Birth',
                  onSaved: (value) {
                    _formData['pob'] = value!;
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your place of birth';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  labelText: 'Complexion',
                  onSaved: (value) {
                    _formData['complexion'] = value!;
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your complexion';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                HeightPickerField(
                  labelText: 'Height',
                  onSaved: (value) {
                    _formData['height'] = value!;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  labelText: 'Gotra/Caste',
                  onSaved: (value) {
                    _formData['caste'] = value!;
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your gotra/caste';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  labelText: 'Occupation',
                  onSaved: (value) {
                    _formData['occupation'] = value!;
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your occupation';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  labelText: 'Income (Optional)',
                  onSaved: (value) {
                    _formData['income'] = value!;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  labelText: 'Education',
                  onSaved: (value) {
                    _formData['education'] = value!;
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your education';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Family Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  labelText: 'Father\'s Name',
                  onSaved: (value) {
                    _formData['fatherName'] = value!;
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your father\'s name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  labelText: 'Mother\'s Name',
                  onSaved: (value) {
                    _formData['motherName'] = value!;
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your mother\'s name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  labelText: 'Number of Siblings',
                  onSaved: (value) {
                    _formData['siblings'] = value!;
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter number of siblings';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Contact Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  labelText: 'Phone Number',
                  onSaved: (value) {
                    _formData['phone'] = value!;
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  labelText: 'Email Address',
                  onSaved: (value) {
                    _formData['email'] = value!;
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  labelText: 'Address',
                  onSaved: (value) {
                    _formData['address'] = value!;
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          _saveFormData();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DisplayDataPage(formData: _formData),
                            ),
                          );
                        }
                      },
                      child: Text('Save'),
                    ),
                    ElevatedButton(
                      onPressed: _clearForm,
                      child: Text('Clear'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;

  CustomTextField({
    required this.labelText,
    this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      onSaved: onSaved,
      validator: validator,
    );
  }
}

class DatePickerField extends StatefulWidget {
  final String labelText;
  final FormFieldSetter<String>? onSaved;

  DatePickerField({required this.labelText, this.onSaved});

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (date != null) {
          _controller.text = DateFormat('dd/MM/yyyy').format(date);
        }
      },
      onSaved: widget.onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please select a date';
        }
        return null;
      },
    );
  }
}

class TimePickerField extends StatefulWidget {
  final String labelText;
  final FormFieldSetter<String>? onSaved;

  TimePickerField({required this.labelText, this.onSaved});

  @override
  _TimePickerFieldState createState() => _TimePickerFieldState();
}

class _TimePickerFieldState extends State<TimePickerField> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(),
      ),
      readOnly: true,
      onTap: () async {
        TimeOfDay? time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (time != null) {
          _controller.text = time.format(context);
        }
      },
      onSaved: widget.onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please select a time';
        }
        return null;
      },
    );
  }
}

class HeightPickerField extends StatefulWidget {
  final String labelText;
  final FormFieldSetter<String>? onSaved;

  HeightPickerField({required this.labelText, this.onSaved});

  @override
  _HeightPickerFieldState createState() => _HeightPickerFieldState();
}

class _HeightPickerFieldState extends State<HeightPickerField> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(),
      ),
      readOnly: true,
      onTap: () async {
        // Here you can implement height selection logic
        // For simplicity, let's use a simple number input dialog
        int? height = await _showHeightInputDialog();
        if (height != null) {
          _controller.text = '$height cm';
        }
      },
      onSaved: widget.onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please select your height';
        }
        return null;
      },
    );
  }

  Future<int?> _showHeightInputDialog() async {
    return showDialog<int>(
      context: context,
      builder: (context) {
        TextEditingController heightController = TextEditingController();
        return AlertDialog(
          title: Text('Enter Height'),
          content: TextField(
            controller: heightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Height in cm',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(int.tryParse(heightController.text));
              },
            ),
          ],
        );
      },
    );
  }
}
