import 'package:flutter/material.dart';

/// Tab 3: a simple profile with two settings switches.
class ProfileScreen extends StatefulWidget {
  final int favoritesCount;

  const ProfileScreen({super.key, required this.favoritesCount});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool notifications = true;
  bool emailDigest = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 16),
        const Center(
          child: CircleAvatar(radius: 48, child: Icon(Icons.person, size: 56)),
        ),
        const SizedBox(height: 12),
        const Center(
          child: Text(
            'Aibek Nurlan',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const Center(child: Text('aibek@narxoz.kz')),
        const SizedBox(height: 24),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: const Text('Saved tours'),
          trailing: Text('${widget.favoritesCount}'),
        ),
        const Divider(),
        SwitchListTile(
          title: const Text('Notifications'),
          value: notifications,
          onChanged: (value) => setState(() => notifications = value),
        ),
        SwitchListTile(
          title: const Text('Weekly email digest'),
          value: emailDigest,
          onChanged: (value) => setState(() => emailDigest = value),
        ),
      ],
    );
  }
}
