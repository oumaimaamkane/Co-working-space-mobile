import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/widgets/card_announce_medium.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/widgets/headline.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/widgets/navigate_button.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/widgets/card_with_transparent_border.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/widgets/subtitle.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/dashmin_viewmodel.dart';
import 'package:coworking_space_mobile/core/layout/dash_layout.dart';

class DashminScreen extends StatelessWidget {
  final DashminViewModel viewModel = DashminViewModel();

  DashminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashLayout(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Headline(
              title: "Dashboard",
              caption: "Un bref aperçu de l'etat du systeme",
            ),
            const SizedBox(height: 32),
            FutureBuilder<List<String>>(
              future: viewModel.getDashboardData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error loading data'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available'));
                } else {
                  return SizedBox(
                    height: 214,
                    child: ListView.separated(
                      itemCount: snapshot.data!.length,
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
                  );
                }
              },
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                const Subtitle(title: "Section"),
                const Spacer(),
                NavigateButton(
                  onTap: () => viewModel.navigateTo(context, '/details'),
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
    );
  }
}



