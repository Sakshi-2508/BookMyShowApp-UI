import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Hi!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Edit Profile',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          const Divider(),
          _buildListTile('Play Credit Card', 'View your Play Credit Card details and offers',
              Icons.credit_card),
          _buildListTile('Help Centre', 'Need help or have questions?', Icons.help_outline),
          _buildListTile('Accounts & Settings',
              'Location, Payments, Permissions & More', Icons.settings),
          const Divider(),
          _buildListTile('Rewards', 'View your rewards & unlock new ones', Icons.card_giftcard),
          _buildListTile('Offers', 'View the latest offers', Icons.local_offer),
          _buildListTile('Gift Cards', 'Send gift cards to your loved ones', Icons.card_membership),
          const Divider(),
          _buildListTile(
              'Food & Beverages', 'Order food & beverages for your show', Icons.fastfood),
          _buildListTile(
              'List your Show', 'Got an event? Partner with us', Icons.event_available),
          const Divider(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Share', style: TextStyle(color: Colors.grey)),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Rate Us', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
          const Center(
            child: Text(
              'App Version: 16.5.1',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'BookMyShow',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(String title, String subtitle, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.red),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      onTap: () {},
    );
  }
}
