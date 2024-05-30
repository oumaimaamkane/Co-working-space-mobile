import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/features/widgets/price_table.dart';


class MembershipSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 1000,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg-cw1-1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SectionHeader(title: "Membership options"),
              const SizedBox(height: 16.0),
              PriceTable(
                title: "Desk",
                price: "\$40 / mo",
                description:
                    "Monday through Friday access to open workspace with conference room bookings available.",
                features: const [
                  "Mix of sitting and standing workspaces",
                  "24/7 Access",
                  "Coffee, tea, still, and sparkling water",
                  "Access to community's online member network",
                  "Fast Wi-Fi and prints"
                ],
              ),
              const SizedBox(height: 16.0),
              PriceTable(
                title: "Virtual",
                price: "\$60 / mo",
                description:
                    "Send and receive packages and mail from our midtown location. Conference room bookings available.",
                features: const [
                  "Mix of sitting and standing workspaces",
                  "24/7 Access",
                  "Coffee, tea, still, and sparkling water",
                  "Access to community's online member network",
                  "Fast Wi-Fi and prints"
                ],
                ribbon: "BEST",
              ),
              const SizedBox(height: 16.0),
              PriceTable(
                title: "Office",
                price: "\$90 / mo",
                description:
                    "Monday through Friday access to open workspace with conference room bookings available.",
                features: const [
                  "Mix of sitting and standing workspaces",
                  "24/7 Access",
                  "Coffee, tea, still, and sparkling water",
                  "Access to community's online member network",
                  "Fast Wi-Fi and prints"
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 8.0),
        Image.asset('images/layericon-1.png'),
        const SizedBox(height: 8.0),
        const Text(
          "Beautiful setting, abundant natural light, amazing comfort, super-fast internet, industrial style interior, custom made desks, state-of-the-art AC system, top notch location,…",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      ],
    );
  }
}
