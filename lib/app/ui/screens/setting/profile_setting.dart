import 'package:ayan_healthcare/app/controller/setting/profile_setting.dart';
import 'package:ayan_healthcare/app/ui/screens/setting/profile_photo.dart';
import 'package:ayan_healthcare/app/ui/widgets/custom_button.dart';
import 'package:ayan_healthcare/assets/spacing.dart';
import 'package:ayan_healthcare/generated/l10n.dart';
import 'package:ayan_healthcare/helper/toaster.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../chat/chat_screen.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileSettingController controller = Get.put(ProfileSettingController());
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController cnicController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController genderController = TextEditingController();
    final _firestore = FirebaseFirestore.instance;

    Widget _buildDoctorsList() {
      return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('doctors').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error loading doctors'));
          }

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final doctors = snapshot.data!.docs;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index].data() as Map<String, dynamic>;

              return ListTile(
                leading: CircleAvatar(
                  child: Text(doctor['name'][0]),
                ),
                title: Text(doctor['name']),
                subtitle: Text(doctor['specialization'] ?? ''),
                trailing: IconButton(
                  icon: Icon(Icons.chat),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          doctorId: doctors[index].id,
                          doctorName: doctor['name'],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profile_setting), // Using localized string
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ProfilePhoto(),
              widgetSpacerVertically(),

              // Name Field
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: S.of(context).enter_full_name, // Localized hint
                  labelText: S.of(context).full_name, // Localized label
                  suffixIcon: const Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).name_empty; // Localized error
                  }
                  return null;
                },
              ),
              widgetSpacerVertically(),

              // Email Field
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: S.of(context).email_example, // Localized hint
                  labelText: S.of(context).email, // Localized label
                  suffixIcon: const Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).email_empty; // Localized error
                  }
                  if (!GetUtils.isEmail(value)) {
                    return S.of(context).invalid_email; // Localized error
                  }
                  return null;
                },
              ),
              widgetSpacerVertically(),

              // CNIC Field
              TextFormField(
                controller: cnicController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: S.of(context).enter_cnic, // Localized hint
                  labelText: S.of(context).cnic, // Localized label
                  suffixIcon: const Icon(Icons.credit_card),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).cnic_empty; // Localized error
                  }
                  return null;
                },
              ),
              widgetSpacerVertically(),

              // Phone Number Field
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: S.of(context).phone_example, // Localized hint
                  labelText: S.of(context).phone, // Localized label
                  suffixIcon: const Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).phone_empty; // Localized error
                  }
                  return null;
                },
              ),
              widgetSpacerVertically(),

              // Gender Selection
              DropdownButtonFormField<String>(
                value: genderController.text.isEmpty
                    ? null
                    : genderController.text,
                onChanged: (value) {
                  genderController.text = value!;
                },
                decoration: InputDecoration(
                  labelText: S.of(context).gender, // Localized label
                  suffixIcon: const Icon(Icons.accessibility),
                ),
                items: [
                  S.of(context).male,
                  S.of(context).female,
                  S.of(context).other
                ] // Localized options
                    .map((gender) => DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return S
                        .of(context)
                        .please_select_gender; // Localized error
                  }
                  return null;
                },
              ),
              widgetSpacerVertically(),

              // Save Button
              CustomButton(
                text: S.of(context).save, // Localized text
                onPressed: () {
                  if (nameController.text.isEmpty) {
                    Toaster.showToast(
                        "${S.of(context).error}${S.of(context).name_empty}"); // Localized error
                    return;
                  }
                  if (emailController.text.isEmpty ||
                      !GetUtils.isEmail(emailController.text)) {
                    Toaster.showToast(
                        S.of(context).invalid_email); // Localized error
                    return;
                  }
                  if (cnicController.text.isEmpty) {
                    Toaster.showToast(
                        S.of(context).cnic_empty); // Localized error
                    return;
                  }
                  if (phoneController.text.isEmpty) {
                    Toaster.showToast(
                        S.of(context).phone_empty); // Localized error
                    return;
                  }
                  if (genderController.text.isEmpty) {
                    Toaster.showToast(
                        S.of(context).please_select_gender); // Localized error
                    return;
                  }

                  // Handle save logic
                  print("Name: ${nameController.text}");
                  print("Email: ${emailController.text}");
                  print("CNIC: ${cnicController.text}");
                  print("Phone: ${phoneController.text}");
                  print("Gender: ${genderController.text}");

                  Toaster.showToast(
                      "${S.of(context).profile_updated} ${S.of(context).profile_update_success}"); // Localized success
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
