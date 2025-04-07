import 'package:ayan_healthcare/app/ui/widgets/custom_card.dart';
import 'package:ayan_healthcare/app/ui/widgets/dividers/dividers.dart';
import 'package:ayan_healthcare/assets/styles/text_styles/text_styles.dart';
import 'package:ayan_healthcare/generated/l10n.dart';
import 'package:flutter/material.dart';

class AppDoctorCard extends StatelessWidget {
  final String doctorName;
  final String doctorSpecialty;
  final String doctorFee;
  final String doctorImagePath;

  const AppDoctorCard({
    super.key,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.doctorFee,
    this.doctorImagePath = "assets/images/find-doctor.png", // Dummy image path
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      radius: 12.0,
      margin: const EdgeInsets.only(
        left: 12,
        right: 12,
        top: 16,
      ),
      child: Column(
        children: [
          ListTile(
            leading: SizedBox(
              height: 50.0,
              width: 50.0,
              child: ClipOval(
                child: doctorImagePath.startsWith("http")
                    ? Image.network(
                        doctorImagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                              "https://instacare.pk/assets/img/Image-not-found.jpg");
                        },
                      )
                    : Image.asset(
                        doctorImagePath,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(
                right: 80.0,
              ),
              child: Text(
                doctorName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4.0),
                Text(
                  doctorSpecialty,
                  style: MyTextStyle.styleBodyText2,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: S.of(context).fee + "\n", // Use localization
                      style: const TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: doctorFee,
                          style: MyTextStyle.styleSubTile2,
                        ),
                      ],
                    ),
                  ),
                ),
                verticalDivider(),
                Expanded(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: S.of(context).experience + "\n", // Use localization
                      style: MyTextStyle.styleBodyText2,
                      children: [
                        TextSpan(
                          text: S
                              .of(context)
                              .dummy_experience, // Use localization
                          style: MyTextStyle.styleSubTile2,
                        ),
                      ],
                    ),
                  ),
                ),
                verticalDivider(),
                Expanded(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: S.of(context).wait_time + "\n", // Use localization
                      style: MyTextStyle.styleBodyText2,
                      children: [
                        TextSpan(
                          text: S.of(context).under_15_min, // Use localization
                          style: MyTextStyle.styleSubTile2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
