import 'package:ayan_healthcare/app/controller/find_doctors/doctors_list_controller.dart';
import 'package:ayan_healthcare/app/ui/screens/doctors/widget/doctor_card.dart';
import 'package:ayan_healthcare/assets/spacing.dart';
import 'package:ayan_healthcare/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindDoctor extends StatefulWidget {
  const FindDoctor({super.key});

  @override
  State<FindDoctor> createState() => _FindDoctorState();
}

class _FindDoctorState extends State<FindDoctor> {
  late Future<void> _fetchDoctorsFuture;

  @override
  void initState() {
    super.initState();
    final FindDoctorController findDoctorController =
        Get.put(FindDoctorController());
    _fetchDoctorsFuture = findDoctorController.fetchDoctorsList();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final FindDoctorController findDoctorController =
        Get.find<FindDoctorController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(S.of(context).find_doctors),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // Search Bar
              buildSearchBar(
                hintText: S.of(context).search_hint,
                controller: searchController,
                onSearch: () {
                  findDoctorController.searchQuery.value =
                      searchController.text;
                },
                onClear: () {
                  searchController.clear();
                  findDoctorController.searchQuery.value = '';
                },
                showSuffix: searchController.text.isNotEmpty,
                onChanged: (value) {
                  findDoctorController.searchQuery.value = value;
                },
              ),

              widgetSpacerVertically(),

              // Doctor List
              Expanded(
                child: FutureBuilder<void>(
                  future: _fetchDoctorsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(S.of(context).error_loading_messages));
                    } else {
                      return Obx(() {
                        if (findDoctorController.filteredDoctors.isEmpty) {
                          return Center(
                              child: Text(S.of(context).no_doctors_found));
                        } else {
                          return ListView.builder(
                            itemCount:
                                findDoctorController.filteredDoctors.length,
                            itemBuilder: (BuildContext context, int index) {
                              final doctor =
                                  findDoctorController.filteredDoctors[index];
                              return DoctorListCard(
                                doctorModel: doctor,
                              );
                            },
                          );
                        }
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchBar({
    required TextEditingController controller,
    required String hintText,
    required Function onSearch,
    required Function onClear,
    required bool showSuffix,
    required Function(String) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: TextInputType.text,
        maxLength: 150,
        onEditingComplete: Get.focusScope?.unfocus,
        onFieldSubmitted: (query) {
          onSearch();
        },
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          filled: false,
          hintText: hintText,
          counterText: "",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: showSuffix
              ? GestureDetector(
                  onTap: () {
                    Get.focusScope?.unfocus();
                    controller.clear();
                    onClear();
                  },
                  child: const Icon(Icons.close),
                )
              : null,
        ),
      ),
    );
  }
}
