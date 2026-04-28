import 'package:flutter/material.dart';
import 'package:sky_rightz_360/view/home/dashboard_screen.dart';
import 'package:sky_rightz_360/view/resolution/claim_success_screen.dart';

class ResolutionWorkflowScreen extends StatefulWidget {
  const ResolutionWorkflowScreen({super.key});

  @override
  State<ResolutionWorkflowScreen> createState() => _ResolutionWorkflowScreenState();
}

class _ResolutionWorkflowScreenState extends State<ResolutionWorkflowScreen> {
  int _currentStep = 1;

  void _nextStep() {
    if (_currentStep < 5) {
      setState(() => _currentStep++);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ClaimSuccessScreen()),
      );
    }
  }

  void _previousStep() {
    if (_currentStep > 1) {
      setState(() => _currentStep--);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1222),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: _previousStep,
        ),
        title: const Text('Back', style: TextStyle(color: Colors.white, fontSize: 16)),
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          _buildWorkflowHeader(),
          _buildStepIndicator(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: _buildCurrentStepView(),
            ),
          ),
          if (_currentStep != 1 && _currentStep != 2 && _currentStep != 5)
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _nextStep,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC229),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Continue', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildWorkflowHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Resolution Workflow',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'We\'ll guide you step-by-step to resolve this disruption',
            style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIndicatorDot(1, 'Confirm'),
          _buildIndicatorDot(2, 'Rights'),
          _buildIndicatorDot(3, 'Documents'),
          _buildIndicatorDot(4, 'Resolution'),
          _buildIndicatorDot(5, 'Submit'),
        ],
      ),
    );
  }

  Widget _buildIndicatorDot(int step, String label) {
    bool isCompleted = _currentStep > step;
    bool isActive = _currentStep == step;

    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: isCompleted || isActive ? const Color(0xFF00C853) : Colors.white12,
            shape: BoxShape.circle,
            border: isActive ? Border.all(color: Colors.white, width: 2) : null,
          ),
          child: isCompleted
              ? const Icon(Icons.check, color: Colors.white, size: 14)
              : Center(
                  child: Text(
                    step.toString(),
                    style: TextStyle(
                      color: isActive ? Colors.white : Colors.white38,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.white38,
            fontSize: 9,
          ),
        ),
      ],
    );
  }

  Widget _buildCurrentStepView() {
    switch (_currentStep) {
      case 1:
        return _buildStep1();
      case 2:
        return _buildStep2();
      case 3:
        return _buildStep3();
      case 4:
        return _buildStep4();
      case 5:
        return _buildStep5();
      default:
        return const SizedBox.shrink();
    }
  }

  // Step 1: Confirm Disruption
  Widget _buildStep1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Step 1: Confirm Disruption',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Let\'s verify the details of your travel disruption',
          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF161D2D),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              _buildStep1DetailRow(Icons.warning_rounded, 'Flight W3 205', 'CANCELLED', const Color(0xFFEF4444)),
              const Divider(height: 32, color: Colors.white10),
              _buildStep1DetailRow(Icons.map_outlined, 'Route', 'Lagos (LOS) → Abuja (ABV)', null),
              const Divider(height: 32, color: Colors.white10),
              _buildStep1DetailRow(Icons.calendar_today, 'Date', 'April 27, 2026', null),
              const Divider(height: 32, color: Colors.white10),
              _buildStep1DetailRow(Icons.access_time, 'Scheduled Time', '14:00 WAT', null),
            ],
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'Is this information correct?',
          style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Please confirm that the flight details above match your booking',
          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: _nextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC229),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Yes, Continue', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: Colors.white12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('No, Edit', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStep1DetailRow(IconData icon, String label, String value, Color? valueColor) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(8)),
          child: Icon(icon, color: Colors.white70, size: 20),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 11)),
            const SizedBox(height: 2),
            Text(
              value,
              style: TextStyle(
                color: valueColor ?? Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Step 2: Your Passenger Rights
  Widget _buildStep2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Step 2: Your Passenger Rights',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'You\'re protected under Nigerian aviation law',
          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFFFC229).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFFFC229).withOpacity(0.2)),
          ),
          child: Row(
            children: [
              const Icon(Icons.security, color: Color(0xFFFFC229), size: 32),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Legal Protection', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(
                      'Your rights are enforced by the Nigerian Civil Aviation Authority (NCAA) and aligned with ICAO standards',
                      style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 11, height: 1.4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        _buildRightsItem('Full Refund', 'Get a complete refund of your ticket cost within 7-14 days', 'NCAA Regulation Part 19.2.1'),
        _buildRightsItem('Alternative Flight', 'Free rebooking on the next available flight to your destination', 'NCAA Regulation Part 19.2.2'),
        _buildRightsItem('Compensation', '₦45,000 compensation for domestic flight cancellation', 'NCAA Regulation Part 19.2.5', isRecommended: true),
        _buildRightsItem('Care & Assistance', 'Meals, refreshments, and accommodation if overnight stay required', 'NCAA Regulation Part 19.2.3'),
        const SizedBox(height: 32),
        const Text('Why This Matters', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(
          'Understanding your rights ensures you receive fair compensation and treatment. The NCAA requires airlines to comply with these regulations or face penalties.',
          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13, height: 1.5),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _nextStep,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFC229),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('I Understand, Continue', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget _buildRightsItem(String title, String desc, String regulation, {bool isRecommended = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isRecommended ? const Color(0xFFFFC229).withOpacity(0.05) : const Color(0xFF161D2D),
        borderRadius: BorderRadius.circular(16),
        border: isRecommended ? Border.all(color: const Color(0xFFFFC229).withOpacity(0.3)) : null,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    if (isRecommended) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: const Color(0xFFFFC229), borderRadius: BorderRadius.circular(4)),
                        child: const Text('Recommended', style: TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(desc, style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 11)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.gavel, color: Colors.white38, size: 10),
                    const SizedBox(width: 4),
                    Text(regulation, style: const TextStyle(color: Colors.white38, fontSize: 9)),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.white24),
        ],
      ),
    );
  }

  // Step 3: Upload Documents
  Widget _buildStep3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Step 3: Upload Documents',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Provide evidence to support your claim',
          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13),
        ),
        const SizedBox(height: 24),
        const Text('Required Documents', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildUploadItem('Flight Ticket / Booking Confirmation', 'Uploaded', true),
        _buildUploadItem('Passport / ID', 'PDF, JPG, PNG (Max 5MB)', false),
        const SizedBox(height: 24),
        const Text('Optional Documents', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildUploadItem('Boarding Pass', 'Strengthen your claim', false),
        _buildUploadItem('Cancellation Notice', 'Uploaded', true),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Tip', style: TextStyle(color: Color(0xFFFFC229), fontSize: 11, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(
                'While optional documents aren\'t required, they significantly increase your claim\'s success rate. Consider uploading all available documentation.',
                style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12, height: 1.4),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUploadItem(String title, String subtitle, bool isUploaded) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161D2D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isUploaded ? const Color(0xFF00C853).withOpacity(0.1) : Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              isUploaded ? Icons.check_circle : Icons.upload_file_outlined,
              color: isUploaded ? const Color(0xFF00C853) : Colors.white38,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: isUploaded ? const Color(0xFF00C853) : Colors.white38,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          if (!isUploaded)
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.1),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 0,
              ),
              child: const Text('Upload', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ),
        ],
      ),
    );
  }

  // Step 4: Choose Resolution
  Widget _buildStep4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Step 4: Choose Resolution',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Select how you\'d like to resolve this disruption',
          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13),
        ),
        const SizedBox(height: 24),
        _buildResolutionOption(
          'Full Refund Only',
          'Get a complete refund of your ticket cost',
          '₦85,000',
          '7-14 business days',
          Icons.monetization_on,
          const Color(0xFFFFC229),
        ),
        _buildResolutionOption(
          'Rebooking',
          'Free rebooking on next available flight',
          'No cost',
          'Immediate',
          Icons.sync,
          const Color(0xFF00C853),
        ),
        _buildResolutionOption(
          'Refund + Compensation',
          'Full refund plus NCAA mandated compensation',
          '₦130,000',
          '14-21 business days',
          Icons.add_circle,
          const Color(0xFFFFC229),
          isRecommended: true,
        ),
        const SizedBox(height: 24),
        const Text('Why We Recommend This', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(
          'This option maximizes your compensation under NCAA regulations. You\'ll receive both your full ticket refund and the legally mandated compensation for flight cancellation.',
          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildResolutionOption(String title, String desc, String amount, String time, IconData icon, Color iconColor, {bool isRecommended = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF161D2D),
        borderRadius: BorderRadius.circular(24),
        border: isRecommended ? Border.all(color: const Color(0xFFFFC229).withOpacity(0.5)) : null,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: iconColor.withOpacity(0.1), shape: BoxShape.circle),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        if (isRecommended) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(color: const Color(0xFFFFC229), borderRadius: BorderRadius.circular(4)),
                            child: const Text('Recommended', style: TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(desc, style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 11)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount', style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 10)),
                  Text(amount, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Processing', style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 10)),
                  Text(time, style: const TextStyle(color: Colors.white, fontSize: 13)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Step 5: Review & Submit
  Widget _buildStep5() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Step 5: Review & Submit',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Verify your claim details before submission',
          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF00C853).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF00C853).withOpacity(0.2)),
          ),
          child: Row(
            children: [
              const Icon(Icons.auto_awesome, color: Color(0xFF00C853), size: 32),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Claim Auto-Generated', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(
                      'We\'ve created your claim based on NCAA regulations',
                      style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 11),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        const Text('Claim Summary', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildSummaryRow(Icons.flight, 'Flight', 'W3 205 (LOS → ABV)'),
        _buildSummaryRow(Icons.calendar_today, 'Date', 'April 27, 2026'),
        _buildSummaryRow(Icons.warning_amber, 'Issue', 'Flight Cancellation'),
        _buildSummaryRow(Icons.monetization_on, 'Claim Amount', '₦130,000', valueColor: const Color(0xFFFFC229)),
        const SizedBox(height: 32),
        const Text('Contact Information', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildContactField('rahmat@skyrightz360.com', Icons.email_outlined),
        const SizedBox(height: 12),
        _buildContactField('+234 801 234 5678', Icons.phone_outlined),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(16)),
          child: Text(
            'I confirm that all information provided is accurate and I authorize SkyRightz360 to submit this claim on my behalf to the airline.',
            style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12, height: 1.4),
          ),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _nextStep,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFC229),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Submit Claim', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(height: 24),
        const Text('What Happens Next?', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(
          'We\'ll submit your claim to Air Peace and track the status. You\'ll receive email updates at each stage. Most claims are resolved within 14-21 business days.',
          style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 11, height: 1.4),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(IconData icon, String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.white24, size: 20),
          const SizedBox(width: 16),
          Text(label, style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 13)),
          const Spacer(),
          Text(value, style: TextStyle(color: valueColor ?? Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildContactField(String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF161D2D),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white38, size: 20),
          const SizedBox(width: 12),
          Text(value, style: const TextStyle(color: Colors.white70, fontSize: 14)),
        ],
      ),
    );
  }
}
