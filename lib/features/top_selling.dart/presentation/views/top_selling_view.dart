import 'package:flutter/material.dart';
import 'package:thimar_app/core/constants/custom_app_bar.dart';
import 'package:thimar_app/l10n/l10n.dart';

class TopSellingView extends StatelessWidget {
  const TopSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        AppLocalizations.of(context)!.topSelling,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: IconButton(
                icon: Icon(Icons.notifications, color: Colors.black),
                onPressed: () {
                  // Define the action for the search button here
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
