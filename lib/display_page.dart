import 'package:flutter/material.dart';

class DisplayDataPage extends StatelessWidget {
  final Map<String, String> formData;

  DisplayDataPage({required this.formData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image1.jpeg'), // Path to your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Personal Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                DetailRow(label: 'Full Name', value: formData['fullName']),
                DetailRow(label: 'Date of Birth', value: formData['dob']),
                DetailRow(label: 'Time of Birth', value: formData['timeOfBirth']),
                DetailRow(label: 'Place of Birth', value: formData['pob']),
                DetailRow(label: 'Complexion', value: formData['complexion']),
                DetailRow(label: 'Height', value: formData['height']),
                DetailRow(label: 'Gotra/Caste', value: formData['caste']),
                DetailRow(label: 'Occupation', value: formData['occupation']),
                DetailRow(label: 'Income', value: formData['income']),
                DetailRow(label: 'Education', value: formData['education']),
                SizedBox(height: 20),
                Text(
                  'Family Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                DetailRow(label: 'Father\'s Name', value: formData['fatherName']),
                DetailRow(label: 'Mother\'s Name', value: formData['motherName']),
                DetailRow(label: 'Number of Siblings', value: formData['siblings']),
                SizedBox(height: 20),
                Text(
                  'Contact Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                DetailRow(label: 'Phone Number', value: formData['phone']),
                DetailRow(label: 'Email Address', value: formData['email']),
                DetailRow(label: 'Address', value: formData['address']),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String label;
  final String? value;

  DetailRow({required this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value ?? ''),
          ),
        ],
      ),
    );
  }
}
