import 'package:flutter/material.dart';
import 'package:sky_rightz_360/view/onboarding/choose_role_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      'color': const Color(0xFF2962FF), // Blue
      'icon': Icons.notifications_none,
      'title': 'Disruption Awareness',
      'subtitle':
          'Get instant alerts for flight delays, cancellations, and baggage issues before they disrupt your journey.',
    },
    {
      'color': const Color(0xFFFF6D00), // Orange
      'icon': Icons.auto_awesome,
      'title': 'Smart Resolution',
      'subtitle':
          'AI-powered step-by-step guidance to resolve your travel issues. Get refunds, rebookings, and compensation automatically.',
    },
    {
      'color': const Color(0xFF00C853), // Green
      'icon': Icons.headset_mic,
      'title': 'Premium Concierge',
      'subtitle':
          '24/7 expert support from travel resolution specialists. We handle the complex cases so you don\'t have to.',
    },
    {
      'color': const Color(0xFF536DFE), // Indigo/Purple-blue
      'icon': Icons.shield_outlined,
      'title': 'Built for Nigeria',
      'subtitle':
          'Fully compliant with Nigerian aviation law (NCAA, NCAR) and ICAO standards. Your rights are protected.',
    },
  ];

  void _nextPage() {
    if (_currentPageIndex < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ChooseRoleScreen(),
        ),
      );
    }
  }

  void _skip() {
    // Normally navigate to Sign In/Sign Up
    // Skipping logic without extra navigation
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Off-white
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Custom Progress Indicators (Top bars)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  _onboardingData.length,
                  (index) => Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 0 : 4,
                        right: index == _onboardingData.length - 1 ? 0 : 4,
                      ),
                      height: 4,
                      decoration: BoxDecoration(
                        color: _currentPageIndex == index
                            ? const Color(0xFF2962FF)
                            : const Color(
                                0xFFD2DDFE), // Light blue-gray for inactive
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 1), // Top spacing

              // PageView for content
              Expanded(
                flex: 6,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                  itemCount: _onboardingData.length,
                  itemBuilder: (context, index) {
                    final data = _onboardingData[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon with shadow
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: data['color'],
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    (data['color'] as Color).withOpacity(0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Icon(
                            data['icon'],
                            color: Colors.white,
                            size: 48,
                          ),
                        ),
                        const SizedBox(height: 48),

                        // Title
                        Text(
                          data['title'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF111827), // Dark grey/black
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Subtitle
                        Text(
                          data['subtitle'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            color: Color(0xFF6B7280), // Gray
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const Spacer(flex: 1), // Bottom spacing

              // Buttons
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: _nextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2962FF),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24), // Pill shape
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _currentPageIndex == _onboardingData.length - 1
                              ? 'Get Started'
                              : 'Continue',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward_ios, size: 14),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: _skip,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: Color(0xFFE5E7EB)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            Color(0xFF2962FF), // Blue text for outline button
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }
}
