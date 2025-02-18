import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_management/generated/l10n.dart';

void showComplaintDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            S.of(context).complaints_suggestions_title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        content: Container(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListTile(
                  leading: const Icon(Icons.report, color: Colors.red),
                  title: Text(S.of(context).complaints_suggestions_leave_complaint),
                  onTap: () {},
                ),
                const Gap(10),
                ListTile(
                  leading: const Icon(Icons.list_alt, color: Colors.blue),
                  title: Text(S.of(context).complaints_suggestions_current_complaints),
                  onTap: () {},
                ),
                const Gap(10),
                ListTile(
                  leading: const Icon(Icons.lightbulb, color: Colors.green),
                  title: Text(S.of(context).complaints_suggestions_leave_suggestion),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
