import 'package:flutter/material.dart';
import 'package:sky_rightz_360/view/home/alerts_screen.dart';
import 'package:sky_rightz_360/view/home/sentinel_screen.dart';
import 'package:sky_rightz_360/view/home/vault_screen.dart';
import 'package:sky_rightz_360/view/home/profile_screen.dart';
import 'package:sky_rightz_360/view/resolution/resolution_dashboard_screen.dart';
import 'package:sky_rightz_360/view/plans/plans_pricing_screen.dart';
import 'package:sky_rightz_360/view/ticket_guard/ticket_guard_screen.dart';
import 'package:sky_rightz_360/view/border_ready/border_ready_screen.dart';
import 'package:sky_rightz_360/view/bag_track/bag_track_screen.dart';
import 'package:sky_rightz_360/view/trip_visualizer/trip_visualizer_screen.dart';
import 'package:sky_rightz_360/view/expense_tracker/expense_tracker_screen.dart';
import 'package:sky_rightz_360/view/claim_submission/claim_submission_screen.dart';
import 'package:sky_rightz_360/view/claim_intelligence/claim_intelligence_screen.dart';

class DashboardScreen extends StatefulWidget {
  final Function(int)? onSwitchTab;
  const DashboardScreen({super.key, this.onSwitchTab});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back,',
                      style: TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'ABC',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFF1F2937),
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF1F2937).withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF374151), width: 1),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search flights, cases...',
                  hintStyle: TextStyle(color: Color(0xFF6B7280)),
                  icon:
                      Icon(Icons.search, color: Color(0xFF9CA3AF), size: 20),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Summary Cards
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (widget.onSwitchTab != null) {
                        widget.onSwitchTab!(1); // Switch to Alerts tab
                      }
                    },
                    child: _buildSummaryCard(
                      icon: Icons.notifications_none,
                      value: '3',
                      label: 'Active Alerts',
                      iconColor: const Color(0xFFFFC229),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildSummaryCard(
                    icon: Icons.description_outlined,
                    value: '12',
                    label: 'Cases',
                    iconColor: const Color(0xFF3B82F6),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildSummaryCard(
                    icon: Icons.group_outlined,
                    value: '₦2.4M',
                    label: 'Saved',
                    iconColor: const Color(0xFF10B981),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Disruption Banner
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF3B1E1E),
                    Color(0xFF2D1B1B),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFF4B2A2A), width: 1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEF4444).withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.warning_amber_rounded,
                        color: Color(0xFFEF4444), size: 24),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '3 Disruptions Need Attention',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Critical issues requiring immediate action',
                          style: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            if (widget.onSwitchTab != null) {
                              widget.onSwitchTab!(1); // Switch to Alerts tab
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFEF4444),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text('View All Alerts'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // AI Recommendation Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1F2937).withOpacity(0.5),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFF374151), width: 1),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC229).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.auto_awesome,
                            color: Color(0xFFFFC229), size: 20),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'AI Recommendation',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Powered by Sentinel',
                            style: TextStyle(
                              color: const Color(0xFF9CA3AF).withOpacity(0.7),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF111827),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'We recommend starting a claim for W3 205. You\'re entitled to ₦45,000 compensation under NCAA regulations.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFC229),
                              foregroundColor: Colors.black,
                              elevation: 0,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'Resolve Now',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Modules Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Modules',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(color: Color(0xFFFFC229)),
                  ),
                ),
              ],
            ),
            const Text(
              'AVAILABLE',
              style: TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 12,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.1,
              children: [
                GestureDetector(
                  onTap: () {
                    if (widget.onSwitchTab != null) {
                      widget.onSwitchTab!(2); // Switch to Sentinel tab
                    }
                  },
                  child: _buildModuleCard('Sentinel', 'AI Intelligence',
                      Icons.auto_awesome, const Color(0xFF3B82F6)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TicketGuardScreen()),
                    );
                  },
                  child: _buildModuleCard(
                      'TicketGuard',
                      'Ticket Analysis',
                      Icons.confirmation_number_outlined,
                      const Color(0xFFFFC229)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BorderReadyScreen()),
                    );
                  },
                  child: _buildModuleCard('BorderReady', 'Travel Compliance',
                      Icons.public, const Color(0xFF10B981)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResolutionDashboardScreen()),
                    );
                  },
                  child: _buildModuleCard('ResolveFlow', 'Claim Workflow',
                      Icons.insights, const Color(0xFFA855F7)),
                ),
                GestureDetector(
                  onTap: () {
                    if (widget.onSwitchTab != null) {
                      widget.onSwitchTab!(3); // Switch to Vault tab
                    }
                  },
                  child: _buildModuleCard('Document Vault', 'Secure Storage',
                      Icons.folder_outlined, const Color(0xFFEC4899)),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Traveler Plus Section
            Row(
              children: [
                const Text(
                  'TRAVELER PLUS',
                  style: TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 12,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFC229).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Upgrade',
                    style: TextStyle(
                        color: Color(0xFFFFC229),
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.1,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BagTrackScreen()),
                    );
                  },
                  child: _buildModuleCard('BagTrack', 'Baggage Monitor',
                      Icons.luggage_outlined, const Color(0xFFF97316),
                      isLocked: true),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TripVisualizerScreen()),
                    );
                  },
                  child: _buildModuleCard('Trip Visualizer', 'Journey Map',
                      Icons.map_outlined, const Color(0xFF06B6D4),
                      isLocked: true),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ExpenseTrackerScreen()),
                    );
                  },
                  child: _buildModuleCard('Expense Tracker', 'Track Spending',
                      Icons.attach_money, const Color(0xFF10B981),
                      isLocked: true),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ClaimSubmissionScreen()),
                    );
                  },
                  child: _buildModuleCard('Claim Submission', 'Submit Claims',
                      Icons.description_outlined, const Color(0xFF6366F1),
                      isLocked: true),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ClaimIntelligenceScreen()),
                    );
                  },
                  child: _buildModuleCard('Claim Intelligence', 'Analytics',
                      Icons.trending_up, const Color(0xFFF43F5E),
                      isLocked: true),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Premium Banner
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF26231A),
                    Color(0xFF1F1D17),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFF3F3B2E), width: 1),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC229).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.shield_outlined,
                            color: Color(0xFFFFC229), size: 28),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Unlock Premium Features',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Upgrade to Plus for advanced modules',
                              style: TextStyle(
                                color: Color(0xFF9CA3AF),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0B1222),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PlansPricingScreen()),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'View Plans',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.chevron_right,
                              color: Colors.white, size: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Active Issues Section
            const Text(
              'Active Issues',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildIssueCard(
              'W3 205',
              'CRITICAL',
              const Color(0xFFEF4444),
              'Air Peace',
              'Flight Cancelled',
              '2 hours ago',
            ),
            const SizedBox(height: 16),
            _buildIssueCard(
              'AA 301',
              'HIGH',
              const Color(0xFFF97316),
              'Arik Air',
              '4 Hour Delay',
              '5 hours ago',
            ),
            const SizedBox(height: 100), // Spacing for bottom nav
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
      {required IconData icon,
      required String value,
      required String label,
      required Color iconColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937).withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF374151), width: 1),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildModuleCard(
      String title, String subtitle, IconData icon, Color iconColor,
      {bool isLocked = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF374151), width: 1),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  color: const Color(0xFF9CA3AF).withOpacity(0.7),
                  fontSize: 11,
                ),
              ),
            ],
          ),
          if (isLocked)
            const Positioned(
              top: 0,
              right: 0,
              child:
                  Icon(Icons.lock_outline, color: Color(0xFF4B5563), size: 16),
            ),
        ],
      ),
    );
  }

  Widget _buildIssueCard(String id, String status, Color statusColor,
      String airline, String issue, String time) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937).withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF374151), width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    id,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                time,
                style: TextStyle(
                  color: const Color(0xFF6B7280).withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              airline,
              style: TextStyle(
                color: const Color(0xFF9CA3AF).withOpacity(0.8),
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF0B1222).withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              issue,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF111827),
                foregroundColor: Colors.white,
                elevation: 0,
                side: const BorderSide(color: Color(0xFF374151), width: 1),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Start Resolution'),
            ),
          ),
        ],
      ),
    );
  }

}
