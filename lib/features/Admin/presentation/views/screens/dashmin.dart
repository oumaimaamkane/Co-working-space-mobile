import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:coworking_space_mobile/ui/screen/dashboard/dashboad_controller.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/widgets/card_announce_medium.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/widgets/headline.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/widgets/navigate_button.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/widgets/card_with_transparent_border.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/widgets/subtitle.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/widgets/rail.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/widgets/menu.dart';

class DashminScreen extends StatelessWidget {
  const DashminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Row(
        children: [
          const Rail(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Your existing content here
                    // For example:
                    const Headline(
                      title: "Dashboard",
                      caption: "Un bref aperçu de l'etat du systeme",
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 214,
                      child: ListView.separated(
                        itemCount: 12,
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(width: 16),
                        itemBuilder: (context, index) => const CardAnnounceMedium(
                          iconData: Icons.stars,
                          title: "La meilleure information ici!",
                          subtitle:
                              "Cette card est faite pour placer des annonces important pour le systeme.",
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        const Subtitle(title: "Section"),
                        const Spacer(),
                        NavigateButton(
                          onTap: () {},
                          title: "Voir plus",
                          iconData: Icons.arrow_forward,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 214,
                      child: ListView.separated(
                        itemCount: 10,
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(width: 16),
                        itemBuilder: (context, index) => CardWithTransparentAndBorder(
                          selected: index == 0,
                          title: 'Une Section',
                          description: 'Ceci est la description de cette section.',
                          onTap: () {},
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
          const Menu(),
        ],
      ),
    );
  }
}

