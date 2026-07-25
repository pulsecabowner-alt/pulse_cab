import 'package:flutter/material.dart';
import 'widgets/step_card.dart';

class HowItWorksSection extends StatefulWidget {
  const HowItWorksSection({super.key});

  @override
  State<HowItWorksSection> createState() => _HowItWorksSectionState();
}

class _HowItWorksSectionState extends State<HowItWorksSection> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<int> _activeStep = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    const stepHeight = 140;
    final currentStep = (offset / stepHeight).floor();
    _activeStep.value = currentStep.clamp(0, 3);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _activeStep.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [
          const Text(
            'Your Ride Journey',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),

          SizedBox(
            height: 520,
            child: ListView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              children: [
                JourneyStep(
                  index: 0,
                  notifier: _activeStep,
                  icon: Icons.my_location,
                  title: 'Select Route',
                  description: 'Choose your pickup and drop location easily.',
                ),
                JourneyStep(
                  index: 1,
                  notifier: _activeStep,
                  icon: Icons.directions_car,
                  title: 'Choose Your Cab',
                  description: 'Select sedan, SUV or luxury vehicle.',
                ),
                JourneyStep(
                  index: 2,
                  notifier: _activeStep,
                  icon: Icons.assignment_turned_in,
                  title: 'Confirm Booking',
                  description: 'Review ride details with fixed pricing.',
                ),
                JourneyStep(
                  index: 3,
                  notifier: _activeStep,
                  icon: Icons.flag,
                  title: 'Enjoy Your Ride',
                  description: 'Driver will contact and pick you on time.',
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
