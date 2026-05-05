import 'package:flutter/material.dart';
import 'package:sky_rightz_360/view/home/main_screen.dart';
import 'package:sky_rightz_360/view/home/alerts_screen.dart';
import 'package:sky_rightz_360/view/home/sentinel_screen.dart';
import 'package:sky_rightz_360/view/home/vault_screen.dart';
import 'package:sky_rightz_360/view/home/profile_screen.dart';
import 'package:sky_rightz_360/view/resolution/resolution_dashboard_screen.dart';

class ClaimSuccessScreen extends StatelessWidget {
  const ClaimSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1222),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Success Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
                decoration: const BoxDecoration(
                  color: Color(0xFF00C853),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.check, color: Color(0xFF00C853), size: 40),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Claim Submitted!',
                      style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Your claim has been successfully submitted to Air Peace',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Claim Reference Card
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFF161D2D),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Claim Reference',
                            style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'SR360-2026-0427',
                            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildMiniInfo('Flight', 'W3 205'),
                              _buildMiniInfo('Amount', '₦130,000'),
                            ],
                          ),
                          const Divider(height: 48, color: Colors.white10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Estimated Resolution',
                                style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12),
                              ),
                              const Text(
                                '14-21 business days',
                                style: TextStyle(color: Color(0xFFFFC229), fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // What Happens Next
                    const Text(
                      'What Happens Next',
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    _buildTimelineItem(1, 'Claim Submitted to Airline', 'We\'ve sent your claim to Air Peace with all supporting documents', true),
                    _buildTimelineItem(2, 'Airline Review', 'Air Peace will review your claim (typically 7-10 days)', false, isInProgress: true),
                    _buildTimelineItem(3, 'Resolution & Payment', 'Once approved, compensation will be processed to your account', false),

                    const SizedBox(height: 32),

                    // Quick Actions
                    const Text(
                      'Quick Actions',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    _buildQuickAction(Icons.track_changes, 'Track Status', 'Monitor your claim progress in real-time'),
                    _buildQuickAction(Icons.folder_open, 'Active Cases', 'See all your ongoing resolutions'),

                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const MainScreen()),
                            (route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFC229),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Go to Home', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const ResolutionDashboardScreen()),
                          );
                        },
                        child: const Text('View Cases', style: TextStyle(color: Colors.white38)),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Support Section
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Need Help?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Text(
                            'Our concierge team is available 24/7 if you have questions about your claim',
                            style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12),
                          ),
                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            child: const Text('Contact Support', style: TextStyle(color: Color(0xFFFFC229), fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const BoxDecoration(
          color: Color(0xFF0B1222),
          border: Border(top: BorderSide(color: Color(0xFF1F2937), width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, 'Home', false, context),
            _buildNavItem(Icons.notifications_outlined, 'Alerts', false, context),
            _buildNavItem(Icons.auto_awesome_outlined, 'Sentinel', false, context),
            _buildNavItem(Icons.folder_outlined, 'Vault', false, context),
            _buildNavItem(Icons.person_outline, 'Profile', false, context),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 11)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildTimelineItem(int step, String title, String desc, bool isCompleted, {bool isInProgress = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isCompleted ? const Color(0xFF00C853) : (isInProgress ? const Color(0xFFFFC229).withOpacity(0.2) : Colors.white12),
                  shape: BoxShape.circle,
                  border: isInProgress ? Border.all(color: const Color(0xFFFFC229), width: 2) : null,
                ),
                child: isCompleted
                    ? const Icon(Icons.check, color: Colors.white, size: 14)
                    : Center(child: Text(step.toString(), style: TextStyle(color: isInProgress ? const Color(0xFFFFC229) : Colors.white38, fontSize: 10, fontWeight: FontWeight.bold))),
              ),
              if (step < 3) Container(width: 2, height: 40, color: Colors.white12),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: isCompleted || isInProgress ? Colors.white : Colors.white38, fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text(desc, style: TextStyle(color: Colors.white38, fontSize: 11, height: 1.4)),
                if (isCompleted) ...[
                  const SizedBox(height: 8),
                  const Text('✓ Completed', style: TextStyle(color: Color(0xFF00C853), fontSize: 10, fontWeight: FontWeight.bold)),
                ],
                if (isInProgress) ...[
                  const SizedBox(height: 8),
                  const Text('In Progress', style: TextStyle(color: Color(0xFFFFC229), fontSize: 10, fontWeight: FontWeight.bold)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String title, String desc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF161D2D), borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(12)), child: Icon(icon, color: const Color(0xFFFFC229), size: 20)),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)), const SizedBox(height: 2), Text(desc, style: TextStyle(color: Colors.white38, fontSize: 11))])),
          const Icon(Icons.chevron_right, color: Colors.white24),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          if (label == 'Home') {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainScreen()), (route) => false);
          } else if (label == 'Alerts') {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AlertsScreen()));
          } else if (label == 'Sentinel') {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SentinelScreen()));
          } else if (label == 'Vault') {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const VaultScreen()));
          } else if (label == 'Profile') {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
          }
        }
      },
      child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(icon, color: isSelected ? const Color(0xFFFFC229) : const Color(0xFF9CA3AF)), const SizedBox(height: 4), Text(label, style: TextStyle(fontSize: 11, color: isSelected ? const Color(0xFFFFC229) : const Color(0xFF9CA3AF)))]),
    );
  }
}
