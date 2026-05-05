import 'package:flutter/material.dart';
import 'package:sky_rightz_360/view/home/main_screen.dart';
import 'package:sky_rightz_360/view/home/alerts_screen.dart';
import 'package:sky_rightz_360/view/home/sentinel_screen.dart';
import 'package:sky_rightz_360/view/home/vault_screen.dart';
import 'package:sky_rightz_360/view/home/profile_screen.dart';

class PlansPricingScreen extends StatefulWidget {
  const PlansPricingScreen({super.key});

  @override
  State<PlansPricingScreen> createState() => _PlansPricingScreenState();
}

class _PlansPricingScreenState extends State<PlansPricingScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['Traveler', 'Agency', 'Corporate', 'Academy'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1222),
      body: Column(
        children: [
          // Yellow Header
          _buildHeader(),

          // Custom Tab Bar
          _buildTabBar(),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: _buildTabContent(),
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
        color: Color(0xFFFFC229),
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
                Icon(Icons.arrow_back, color: Colors.black, size: 20),
                SizedBox(width: 8),
                Text(
                  'Back',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Plans & Pricing',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Choose the right plan for you',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black12),
                ),
                child: const Icon(Icons.workspace_premium,
                    color: Colors.black, size: 28),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _tabs.length,
        itemBuilder: (context, index) {
          bool isSelected = _selectedTabIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTabIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color:
                    isSelected ? const Color(0xFF1F2937) : Colors.transparent,
                borderRadius: BorderRadius.circular(25),
                border: isSelected
                    ? Border.all(
                        color: const Color(0xFF3B82F6).withOpacity(0.5))
                    : null,
              ),
              child: Text(
                _tabs[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF9CA3AF),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return _buildTravelerPlans();
      case 1:
        return _buildAgencyPlans();
      case 2:
        return _buildCorporatePlans();
      case 3:
        return _buildAcademyPlans();
      default:
        return const SizedBox();
    }
  }

  Widget _buildTravelerPlans() {
    return Column(
      children: [
        _buildPlanCard(
          title: 'Basic',
          price: 'Free',
          features: [
            'Sentinel AI',
            'TicketGuard',
            'BorderReady',
            'ResolveFlow',
            'Document Vault',
          ],
          buttonText: 'Current Plan',
          isCurrent: true,
        ),
        const SizedBox(height: 20),
        _buildPlanCard(
          title: 'Plus',
          price: '₦9,999/mo',
          features: [
            'Everything in Basic',
            'BagTrack',
            'Trip Visualizer',
            'Expense Tracker',
            'Claim Submission',
            'Claim Intelligence',
          ],
          buttonText: 'Upgrade',
          isPremium: true,
          tag: 'Most Popular',
        ),
        const SizedBox(height: 20),
        _buildPlanCard(
          title: 'Concierge Pass',
          price: '₦24,999/mo',
          features: [
            'Everything in Plus',
            '24/7 Concierge Support',
            'Priority Resolution',
            'Dedicated Account Manager',
          ],
          buttonText: 'Upgrade',
        ),
      ],
    );
  }

  Widget _buildAgencyPlans() {
    return Column(
      children: [
        _buildPlanCard(
          title: 'Agency Pro',
          price: '₦49,999/mo',
          features: [
            'Multi-client management',
            'Team collaboration',
            'Advanced analytics',
            'API access',
          ],
          buttonText: 'Contact Sales',
        ),
        const SizedBox(height: 20),
        _buildPlanCard(
          title: 'Agency Concierge',
          price: '₦99,999/mo',
          features: [
            'Everything in Pro',
            'White-label option',
            'Custom workflows',
            'Dedicated support',
          ],
          buttonText: 'Contact Sales',
        ),
      ],
    );
  }

  Widget _buildCorporatePlans() {
    return _buildCtaCard(
      title: 'Corporate Solutions',
      description: 'Custom enterprise plans for corporate travel teams',
      buttonText: 'Request Demo',
      icon: Icons.business_center_outlined,
    );
  }

  Widget _buildAcademyPlans() {
    return _buildCtaCard(
      title: 'Academy Access',
      description: 'Learn travel rights and claim management',
      buttonText: 'View Classes',
      icon: Icons.school_outlined,
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    required List<String> features,
    required String buttonText,
    bool isPremium = false,
    bool isCurrent = false,
    String? tag,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937).withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isPremium
              ? const Color(0xFFFFC229).withOpacity(0.3)
              : const Color(0xFF374151),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (tag != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFFFC229),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tag,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            price,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          ...features.map((feature) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_outline,
                        color: Color(0xFF10B981), size: 18),
                    const SizedBox(width: 12),
                    Text(
                      feature,
                      style: const TextStyle(
                          color: Color(0xFF9CA3AF), fontSize: 14),
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: isPremium
                    ? const Color(0xFFFFC229)
                    : (isCurrent
                        ? Colors.transparent
                        : const Color(0xFF111827)),
                foregroundColor: isPremium ? Colors.black : Colors.white,
                elevation: 0,
                side: isCurrent
                    ? const BorderSide(color: Color(0xFF374151))
                    : (isPremium
                        ? null
                        : const BorderSide(color: Color(0xFF374151))),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isPremium
                      ? Colors.black
                      : (isCurrent ? const Color(0xFF9CA3AF) : Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCtaCard({
    required String title,
    required String description,
    required String buttonText,
    required IconData icon,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937).withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF374151), width: 1),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFFFFC229), size: 48),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC229),
                foregroundColor: Colors.black,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
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
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        } else if (label == 'Alerts') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const AlertsScreen()));
        } else if (label == 'Sentinel') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SentinelScreen()));
        } else if (label == 'Vault') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const VaultScreen()));
        } else if (label == 'Profile') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()));
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
