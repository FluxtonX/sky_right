import 'package:flutter/material.dart';
import 'package:sky_rightz_360/view/home/main_screen.dart';
import 'package:sky_rightz_360/view/home/alerts_screen.dart';
import 'package:sky_rightz_360/view/home/sentinel_screen.dart';
import 'package:sky_rightz_360/view/home/vault_screen.dart';
import 'package:sky_rightz_360/view/home/profile_screen.dart';

class ClaimSubmissionScreen extends StatefulWidget {
  const ClaimSubmissionScreen({super.key});

  @override
  State<ClaimSubmissionScreen> createState() => _ClaimSubmissionScreenState();
}

class _ClaimSubmissionScreenState extends State<ClaimSubmissionScreen> {
  int _currentStep = 1;

  void _nextStep() {
    if (_currentStep < 4) {
      setState(() => _currentStep++);
    }
  }

  void _prevStep() {
    if (_currentStep > 1) {
      setState(() => _currentStep--);
    }
  }

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
              child: _buildStepContent(),
            ),
          ),
          if (_currentStep > 1) _buildNavigationButtons(),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    double progress = _currentStep / 4;
    String progressText = '${(_currentStep * 25)}% Complete';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF6366F1), Color(0xFF4F46E5)],
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
            onTap: () {
              if (_currentStep > 1) {
                _prevStep();
              } else {
                Navigator.pop(context);
              }
            },
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
                child: const Icon(Icons.description_outlined, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Claim Submission',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Submit compensation claims',
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
          const SizedBox(height: 32),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Step $_currentStep of 4',
                    style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 11),
                  ),
                  Text(
                    progressText,
                    style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.white.withOpacity(0.1),
                  color: Colors.white,
                  minHeight: 6,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 1:
        return _buildStep1();
      case 2:
        return _buildStep2();
      case 3:
        return _buildStep3();
      case 4:
        return _buildStep4();
      default:
        return const SizedBox();
    }
  }

  Widget _buildStep1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.auto_awesome_outlined, color: Color(0xFFFFC229), size: 18),
            SizedBox(width: 12),
            Text(
              'Quick Start',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Start your claim from existing data or create from scratch',
          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13),
        ),
        const SizedBox(height: 24),
        _buildQuickStartCard(
          icon: Icons.link,
          title: 'Link Case from Vault',
          subtitle: 'Use existing case data',
          color: const Color(0xFFFFC229),
        ),
        const SizedBox(height: 16),
        _buildQuickStartCard(
          icon: Icons.warning_amber_rounded,
          title: 'Select Sentinel Alert',
          subtitle: 'Convert alert to claim',
          color: const Color(0xFFFFC229),
        ),
        const SizedBox(height: 16),
        _buildQuickStartCard(
          icon: Icons.article_outlined,
          title: 'Start from Scratch',
          subtitle: 'Manual claim entry',
          color: const Color(0xFF10B981),
          onTap: _nextStep,
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF1F2937).withOpacity(0.3),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFF374151), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.assignment_outlined, color: Color(0xFF3B82F6), size: 18),
                  const SizedBox(width: 12),
                  const Text(
                    'Claim Requirements',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ...[
                'Flight booking confirmation',
                'Proof of disruption (cancellation notice, delay report)',
                'Valid ID or passport',
                'Any additional expenses receipts',
              ].map((req) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(color: Color(0xFF9CA3AF))),
                    Expanded(child: Text(req, style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12))),
                  ],
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStep2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.person_outline, color: Color(0xFFFFC229), size: 18),
            SizedBox(width: 12),
            Text(
              'Passenger Details',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildFormField('Full Name', 'e.g., Rahmat Ullah', isRequired: true),
        const SizedBox(height: 20),
        _buildFormField('Email Address', 'rahmat@example.com', isRequired: true, icon: Icons.mail_outline),
        const SizedBox(height: 20),
        _buildFormField('Phone Number', '+234 801 234 5678', isRequired: true, icon: Icons.phone_outlined),
        const SizedBox(height: 20),
        _buildFormField('Passport/ID Number', 'e.g., A12345678', isRequired: true),
      ],
    );
  }

  Widget _buildStep3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.flight_takeoff, color: Color(0xFFFFC229), size: 18),
            SizedBox(width: 12),
            Text(
              'Booking Details',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildFormField('Flight Number', 'e.g., W3 205', isRequired: true),
        const SizedBox(height: 20),
        _buildFormField('Airline', 'e.g., Air Peace', isRequired: true),
        const SizedBox(height: 20),
        _buildFormField('Travel Date', '', isRequired: true, icon: Icons.calendar_today_outlined),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: _buildFormField('From', 'Lagos (LOS)', isRequired: true)),
            const SizedBox(width: 16),
            Expanded(child: _buildFormField('To', 'Abuja (ABV)', isRequired: true)),
          ],
        ),
        const SizedBox(height: 20),
        _buildFormField('Booking Reference/PNR', 'e.g., ABC123', isRequired: true),
        const SizedBox(height: 20),
        _buildFormField('Disruption Type', '', isRequired: true),
      ],
    );
  }

  Widget _buildStep4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.file_upload_outlined, color: Color(0xFFFFC229), size: 18),
            SizedBox(width: 12),
            Text(
              'Upload Documents',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildUploadItem('Flight Ticket/Boarding Pass', isRequired: true),
        _buildUploadItem('Disruption Notice/Proof', isRequired: true),
        _buildUploadItem('ID/Passport Copy', isRequired: true),
        _buildUploadItem('Additional Expenses (Optional)', isRequired: false),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF10B981).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF10B981).withOpacity(0.2)),
          ),
          child: Row(
            children: [
              const Icon(Icons.check_circle_outline, color: Color(0xFF10B981), size: 24),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ready to Submit',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      'All required documents uploaded. Review and submit your claim.',
                      style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 11),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickStartCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1F2937).withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF374151), width: 1),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 2),
                  Text(subtitle, style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 11)),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.white.withOpacity(0.2), size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(String label, String hint, {bool isRequired = false, IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12),
            children: [
              if (isRequired)
                const TextSpan(text: ' *', style: TextStyle(color: Color(0xFFEF4444))),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: icon != null ? Icon(icon, color: Colors.white.withOpacity(0.3), size: 20) : null,
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.2)),
            filled: true,
            fillColor: const Color(0xFF1F2937).withOpacity(0.3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xFF374151)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUploadItem(String title, {bool isRequired = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937).withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF374151), width: 1),
      ),
      child: Row(
        children: [
          Icon(Icons.insert_drive_file_outlined, color: Colors.white.withOpacity(0.4), size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: title,
                style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                children: [
                  if (isRequired)
                    const TextSpan(text: ' *', style: TextStyle(color: Color(0xFFEF4444))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: _prevStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0B1222),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  side: const BorderSide(color: Color(0xFF374151)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Back'),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: _nextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _currentStep == 4 ? const Color(0xFFFFC229) : const Color(0xFFFFC229),
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(_currentStep == 4 ? 'Submit Claim' : 'Continue', style: const TextStyle(fontWeight: FontWeight.bold)),
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
