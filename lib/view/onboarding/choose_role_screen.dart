import 'package:flutter/material.dart';
import 'package:sky_rightz_360/view/home/dashboard_screen.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Off-white background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title
              const Text(
                'Choose Your Role',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF111827), // Dark grey/black
                ),
              ),
              const SizedBox(height: 12),

              // Subtitle
              const Text(
                "Select how you'll use SkyRightz360",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF6B7280), // Gray
                ),
              ),
              const SizedBox(height: 48),

              // Role Cards
              _buildRoleCard(
                context: context,
                color: const Color(0xFF2962FF), // Blue
                icon: Icons.person_outline,
                title: 'Traveler',
                subtitle:
                    'Individual travelers seeking flight compensation and support',
              ),
              const SizedBox(height: 20),

              _buildRoleCard(
                context: context,
                color: const Color(0xFFFF6D00), // Orange
                icon: Icons.domain, // Or Icons.corporate_fare / Icons.business
                title: 'Travel Agency',
                subtitle: 'Agencies managing disruptions for multiple clients',
              ),
              const SizedBox(height: 20),

              _buildRoleCard(
                context: context,
                color: const Color(0xFF00C853), // Green
                icon: Icons.work_outline, // Suitcase icon
                title: 'Corporate Travel Desk',
                subtitle:
                    'Corporate teams handling employee travel disruptions',
              ),
              const SizedBox(height: 48),

              // Bottom Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Normally navigates to SignInScreen
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Color(0xFF2962FF),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required BuildContext context,
    required Color color,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon Container
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),

            // Texts
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // Right Chevron
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(
                Icons.chevron_right,
                color: Color(0xFF9CA3AF), // Light gray
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
