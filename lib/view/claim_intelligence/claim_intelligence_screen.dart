import 'package:flutter/material.dart';
import 'package:sky_rightz_360/view/home/main_screen.dart';
import 'package:sky_rightz_360/view/home/alerts_screen.dart';
import 'package:sky_rightz_360/view/home/sentinel_screen.dart';
import 'package:sky_rightz_360/view/home/vault_screen.dart';
import 'package:sky_rightz_360/view/home/profile_screen.dart';

class ClaimIntelligenceScreen extends StatefulWidget {
  const ClaimIntelligenceScreen({super.key});

  @override
  State<ClaimIntelligenceScreen> createState() => _ClaimIntelligenceScreenState();
}

class _ClaimIntelligenceScreenState extends State<ClaimIntelligenceScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['Active Claims', 'Airline Intelligence'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1222),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _buildSummaryMetrics(),
                  const SizedBox(height: 24),
                  _buildEmailMonitor(),
                  const SizedBox(height: 24),
                  _buildAIRecommendation(),
                  const SizedBox(height: 32),
                  _buildTabBar(),
                  const SizedBox(height: 24),
                  _selectedTabIndex == 0 ? _buildActiveClaimsTab() : _buildAirlineIntelligenceTab(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF43F5E), Color(0xFFE11D48)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Row(
              children: [
                Icon(Icons.arrow_back, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text(
                  'Back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.trending_up, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Claim Intelligence',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Analytics & Insights dashboard',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Success Rate', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12)),
                    const SizedBox(height: 4),
                    const Text('92%', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(width: 1, height: 40, color: Colors.white.withOpacity(0.2)),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Avg Resolution', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12)),
                    const SizedBox(height: 4),
                    const Text('11.4 days', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryMetrics() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildMetricCard(Icons.description_outlined, '24', 'Total Claims', const Color(0xFF3B82F6)),
        _buildMetricCard(Icons.attach_money, '₦2.4M', 'Recovered', const Color(0xFF10B981)),
        _buildMetricCard(Icons.trending_up, '92%', 'Success Rate', const Color(0xFFFFC229)),
        _buildMetricCard(Icons.access_time, '3', 'Overdue', const Color(0xFFEF4444)),
      ],
    );
  }

  Widget _buildMetricCard(IconData icon, String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF374151), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildEmailMonitor() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937).withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF374151), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.mail_outline, color: Color(0xFF3B82F6), size: 20),
              SizedBox(width: 12),
              Text(
                'Email Correspondence Monitor',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCommStat('18', 'Sent', const Color(0xFF10B981)),
              _buildCommStat('3', 'Drafts', const Color(0xFF9CA3AF)),
              _buildCommStat('12', 'Reviewed', const Color(0xFF3B82F6)),
              _buildCommStat('8', 'Archived', const Color(0xFF6B7280)),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.send_outlined, size: 16),
                  label: const Text('Compose', style: TextStyle(fontWeight: FontWeight.bold)),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFF374151)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_outlined, size: 16),
                  label: const Text('Review', style: TextStyle(fontWeight: FontWeight.bold)),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFF374151)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCommStat(String value, String label, Color color) {
    return Column(
      children: [
        Text(value, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 11)),
      ],
    );
  }

  Widget _buildAIRecommendation() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFC229).withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFFFC229).withOpacity(0.2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.auto_awesome_outlined, color: Color(0xFFFFC229), size: 20),
              SizedBox(width: 12),
              Text(
                'AI Strategist Recommendation',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Based on airline response patterns, we recommend following up on W3 205 within 48 hours. Air Peace typically responds better to polite but firm second follow-ups.',
            style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 13, height: 1.5),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC229),
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Draft Follow-up', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: () {},
                child: const Text('View Analysis', style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937).withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: List.generate(_tabs.length, (index) {
          bool isSelected = _selectedTabIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedTabIndex = index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF3B82F6) : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    _tabs[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : const Color(0xFF9CA3AF),
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildActiveClaimsTab() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildFilterChip('All', true),
              _buildFilterChip('Awaiting Response', false),
              _buildFilterChip('Response Received', false),
            ],
          ),
        ),
        const SizedBox(height: 24),
        _buildClaimCard(
          flight: 'W3 205',
          status: 'Awaiting Response',
          statusColor: const Color(0xFF3B82F6),
          route: 'Air Peace • LOS ✈ ABV',
          amount: '₦130,000',
          filed: 'Apr 22, 2026',
          days: '5 days',
          icon: Icons.access_time,
        ),
        _buildClaimCard(
          flight: 'AA 301',
          status: 'Response Received',
          statusColor: const Color(0xFFFFC229),
          route: 'Arik Air • ABV ✈ PHC',
          amount: '₦95,000',
          filed: 'Apr 20, 2026',
          days: '12 days',
          icon: Icons.mail_outline,
          showRespond: true,
        ),
        _buildClaimCard(
          flight: 'BA 075',
          status: 'Finalized',
          statusColor: const Color(0xFF10B981),
          route: 'British Airways • LHR ✈ LOS',
          amount: '₦250,000',
          filed: 'Apr 15, 2026',
          days: '17 days',
          icon: Icons.check_circle_outline,
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFFC229) : const Color(0xFF1F2937).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.white,
          fontSize: 11,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildClaimCard({
    required String flight,
    required String status,
    required Color statusColor,
    required String route,
    required String amount,
    required String filed,
    required String days,
    required IconData icon,
    bool showRespond = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937).withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF374151), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(flight, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(status, style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Icon(icon, color: statusColor.withOpacity(0.5), size: 18),
            ],
          ),
          const SizedBox(height: 4),
          Text(route, style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildClaimMetric('Claim Amount', amount, isYellow: true),
              _buildClaimMetric('Filed', filed),
              _buildClaimMetric('Days Open', days),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFF374151)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('View Details', style: TextStyle(fontSize: 12)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: showRespond ? const Color(0xFFFFC229) : const Color(0xFF0B1222),
                      foregroundColor: showRespond ? Colors.black : Colors.white,
                      elevation: 0,
                      side: showRespond ? null : const BorderSide(color: Color(0xFF374151)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(showRespond ? 'Respond' : 'Follow Up', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildClaimMetric(String label, String value, {bool isYellow = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 10)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: isYellow ? const Color(0xFFFFC229) : Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildAirlineIntelligenceTab() {
    return Column(
      children: [
        _buildAirlineCard('Air Peace', 'Fair', const Color(0xFFFFC229), '14.2 days', '55%', '₦620K', '₦85K'),
        _buildAirlineCard('Ibom Air', 'Excellent', const Color(0xFF10B981), '8.5 days', '100%', '₦240K', '₦60K'),
        _buildAirlineCard('Green Africa Airways', 'Poor', const Color(0xFFEF4444), '19.0 days', '30%', '₦75K', '₦37.5K'),
        _buildAirlineCard('Ethiopian Airlines', 'Good', const Color(0xFF3B82F6), '10.8 days', '75%', '₦420K', '₦105K'),
        _buildAirlineCard('Emirates', 'Excellent', const Color(0xFF10B981), '7.2 days', '100%', '₦540K', '₦180K'),
        _buildAirlineCard('British Airways', 'Excellent', const Color(0xFF10B981), '9.5 days', '100%', '₦500K', '₦250K'),
        _buildAirlineCard('Qatar Airways', 'Good', const Color(0xFF3B82F6), '11.2 days', '80%', '₦160K', '₦80K'),
      ],
    );
  }

  Widget _buildAirlineCard(String name, String rating, Color ratingColor, String response, String success, String total, String avg) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937).withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF374151), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFC229).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.flight_takeoff, color: Color(0xFFFFC229), size: 16),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      Text('8 claims filed', style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 11)),
                    ],
                  ),
                ],
              ),
              Text(rating, style: TextStyle(color: ratingColor, fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              _buildAirlineMetric('Avg Response', response),
              const SizedBox(width: 24),
              _buildAirlineMetric('Success Rate', success, valueColor: const Color(0xFF10B981)),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Color(0xFF374151)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Total Recovered', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 10)),
                  const SizedBox(height: 4),
                  Text(total, style: const TextStyle(color: Color(0xFF10B981), fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Avg per Claim', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 10)),
                  const SizedBox(height: 4),
                  Text(avg, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAirlineMetric(String label, String value, {Color? valueColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 10)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: valueColor ?? Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xFF0B1222),
        border: Border(top: BorderSide(color: Color(0xFF1F2937), width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_outlined, 'Home'),
          _buildNavItem(Icons.notifications_outlined, 'Alerts'),
          _buildNavItem(Icons.auto_awesome_outlined, 'Sentinel'),
          _buildNavItem(Icons.folder_outlined, 'Vault'),
          _buildNavItem(Icons.person_outline, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        if (label == 'Home') {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
        } else if (label == 'Alerts') {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AlertsScreen()));
        } else if (label == 'Sentinel') {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SentinelScreen()));
        } else if (label == 'Vault') {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const VaultScreen()));
        } else if (label == 'Profile') {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFF9CA3AF), size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 10),
          ),
        ],
      ),
    );
  }
}
