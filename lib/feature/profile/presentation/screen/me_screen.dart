import 'package:flutter/material.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/feature/profile/presentation/widget/card_services_widget.dart';
import 'package:qabilati/feature/profile/presentation/widget/personal_identification_card_widget.dart';
import 'package:qabilati/generated/l10n.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MeScreen extends StatelessWidget {
  const MeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PersonalIdentificationCardWidget(
            name: LocalStorageApp.getHiveData("user_data")["user_name"],
            image:
                "${dotenv.env['SUPABASE_URL_IMAGE']}${LocalStorageApp.getHiveData("user_data")["user_image"]}",
            uuid: LocalStorageApp.getHiveData("user_data")["user_uuid"],
          ),
          Divider(color: ColorApp.greyDa, thickness: 8.0),
          CardServicesWidget(
            title: S.of(context).pay,
            iconData: Icons.paypal_outlined,
            coloricon: Colors.greenAccent,
            onTap: () {},
          ),
          Divider(color: ColorApp.greyDa, thickness: 8.0),
          CardServicesWidget(
            title: S.of(context).favorite,
            iconData: Icons.favorite_sharp,
            coloricon: ColorApp.red,
            onTap: () {},
          ),
          Divider(color: ColorApp.greymiddle),
          CardServicesWidget(
            title: S.of(context).post,
            iconData: Icons.photo_size_select_actual_outlined,
            coloricon: Colors.lightBlue,
            onTap: () {},
          ),
          Divider(color: ColorApp.greyDa, thickness: 8.0),
          CardServicesWidget(
            title: S.of(context).setting,
            iconData: Icons.settings_outlined,
            coloricon: Colors.blue,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
