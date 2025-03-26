import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tabibi_web/theme/app_fonts.dart';
import 'package:tabibi_web/theme/app_images.dart';

class HomePatientDesktop extends StatefulWidget {
  const HomePatientDesktop({super.key});

  @override
  State<HomePatientDesktop> createState() => _HomePatientDesktopState();
}

class _HomePatientDesktopState extends State<HomePatientDesktop> {
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  // Section keys for scrolling
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _consultationKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key, int index) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool showDoctorImage = constraints.maxWidth > 1100;
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Navbar(
                  selectedIndex: _selectedIndex,
                  onItemSelected: (index) {
                    final keys = [
                      _homeKey,
                      _consultationKey,
                      _aboutKey,
                      _contactKey,
                    ];
                    _scrollToSection(keys[index], index);
                  },
                ),
                HeroSection(key: _homeKey, showDoctorImage: showDoctorImage),
                Consultation(key: _consultationKey),
                AboutSection(key: _aboutKey),
                ContactSection(key: _contactKey),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Enhanced Navbar with hover and selection effects
class Navbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const Navbar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 40.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo section
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFFFFFFFF),
                radius: 28.r,
                child: Image.asset(Assets.imagesLogo),
              ),
              SizedBox(width: 3.w),
              CircleAvatar(
                backgroundColor: const Color(0xFFFFFFFF),
                radius: 40.r,
                child: SvgPicture.asset(Assets.imagesTABIBI, width: 20.w),
              ),
            ],
          ),

          // Navigation buttons
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(30.h),
            ),
            child: Row(
              children: [
                _NavbarButton(
                  title: "Home",
                  isSelected: selectedIndex == 0,
                  onTap: () => onItemSelected(0),
                ),
                SizedBox(width: 2.w),
                _NavbarButton(
                  title: "Consult",
                  isSelected: selectedIndex == 1,
                  onTap: () => onItemSelected(1),
                ),
                SizedBox(width: 2.w),
                _NavbarButton(
                  title: "About",
                  isSelected: selectedIndex == 2,
                  onTap: () => onItemSelected(2),
                ),
                SizedBox(width: 2.w),
                _NavbarButton(
                  title: "Contact",
                  isSelected: selectedIndex == 3,
                  onTap: () => onItemSelected(3),
                ),
              ],
            ),
          ),

          // User icons
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFFFFFFFF),
                radius: 35.r,
                child: Image.asset(Assets.imagesPerson),
              ),
              SizedBox(width: 5.w),
              CircleAvatar(
                backgroundColor: const Color(0xFFFFFFFF),
                radius: 35.r,
                child: SvgPicture.asset(Assets.imagesNotification),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom Navbar Button with hover and selection effects
class _NavbarButton extends StatefulWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavbarButton({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_NavbarButton> createState() => _NavbarButtonState();
}

class _NavbarButtonState extends State<_NavbarButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: BoxDecoration(
            color:
                widget.isSelected
                    ? const Color(0xFF1C274D)
                    : _isHovered
                    ? const Color(0xFF1C274D).withOpacity(0.1)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            widget.title,
            style: AppStyles.styleRegular18.copyWith(
              color: widget.isSelected ? Colors.white : const Color(0xFF000000),
              fontWeight:
                  widget.isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

// HERO SECTION
class HeroSection extends StatelessWidget {
  final bool showDoctorImage;
  const HeroSection({super.key, required this.showDoctorImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10.w, top: 40.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // The Left Text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      Text(
                        'we’re driven by one mession',
                        style: AppStyles.styleRegular18.copyWith(
                          color: Color(0xFF3B3B3B),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Achieve\nthe best version\nof your health',
                        style: AppStyles.styleMeduim48,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Take the first step towards better health\nwith personalized care.',
                        style: AppStyles.styleRegular20.copyWith(
                          color: Color(0xFF3B3B3B),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Container(
                        padding: EdgeInsets.only(
                          left: 10.w,
                          right: 5.w,
                          top: 12.h,
                          bottom: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF1C274D),
                          borderRadius: BorderRadius.circular(30.h),
                        ),
                        child: Row(
                          mainAxisSize:
                              MainAxisSize
                                  .min, // Ensures the container wraps content
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Consultation",
                              style: AppStyles.styleMeduim20,
                            ),
                            SizedBox(width: 3.w), // Adjust spacing if needed
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 3.w,
                              color: Color(0xFFFFFFFF),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // The Right Text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(Assets.imagesQuotes, width: 5.w),
                      SizedBox(height: 16.h),
                      Text(
                        'We\'re here to prioritize your \nhealth and well-being, making \nit easier than ever to connect \nyou with trusted doctors and \nquality care.',
                        style: AppStyles.styleItalic24,
                      ),
                      SizedBox(height: 16.h),
                      Text('Tabibi Team', style: AppStyles.styleRegular16),
                      SizedBox(height: 24.h),
                      SvgPicture.asset(Assets.imagesSign, width: 100.w),
                    ],
                  ),
                ],
              ),
            ),
            SvgPicture.asset(Assets.imagesBottomBar, width: 1.sw),
          ],
        ),
        if (showDoctorImage)
          Positioned(
            bottom: 37,
            right: 0,
            left: 0,
            child: Center(
              child: Image.asset(
                Assets.imagesMainDoctor,
                width: 160.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
      ],
    );
  }
}

// STATISTICS SECTION (Important Appointments)
class Consultation extends StatelessWidget {
  const Consultation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem(
                '1,200+',
                'Instant Appointments',
                'Connecting you with top doctors for immediate care.',
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                width: 0.5.w,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  color: const Color(0xFF000000).withOpacity(0.3),
                ),
              ),
              _buildStatItem(
                '99%',
                'Remote & In-Person Consultations',
                'Access care from home or visit nearby clinics.',
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 40.h),
            width: 1.sw,
            height: 2.5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.w),
              color: const Color(0xFF000000).withOpacity(0.3),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem(
                '1,200+',
                'Expert Care Accuracy',
                'Providing precise and personalized treatment.',
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                width: 0.5.w,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  color: const Color(0xFF000000).withOpacity(0.3),
                ),
              ),
              _buildStatItem(
                '99%',
                'Patient Satisfaction',
                'Ensuring a smooth and stress-free health journey.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String title, String description) {
    return SizedBox(
      width: 140.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.styleMeduim24.copyWith(color: Color(0xFF000000)),
          ),
          SizedBox(height: 8.h),
          Text(description, style: AppStyles.styleLight16),
          SizedBox(height: 8.h),
          Text(
            value,
            style: AppStyles.styleMeduim36.copyWith(
              color: const Color(0xFF12339D),
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}

// ABOUT SECTION (What Patients Say)
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Image.asset(
                Assets.imagesWelcome,
                fit: BoxFit.fitHeight,
                height: 165.w,
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: SvgPicture.asset(Assets.imagesSignBack),
                  ),
                  Container(
                    padding: EdgeInsets.all(15.w),
                    color: Color(0xFF373737).withOpacity(0.1),
                    height: 165.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('About Tabibi', style: AppStyles.styleMeduim40),
                        SizedBox(height: 20.h),
                        Text(
                          'Revolutionizing Healthcare, One Click at a Time',
                          style: AppStyles.styleItalic15,
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          'We are building Tabibi to revolutionize healthcare by making it effortless for you to connect with doctors. Whether you need to book an appointment, consult online, track your health, or access medical records, we ensure a seamless, secure, and efficient experience >',
                          style: AppStyles.styleRegular24,
                        ),
                        Text(
                          'All at your fingertips.',
                          style: AppStyles.styleMeduim24.copyWith(
                            color: Color(0xFF000000),
                          ),
                        ),
                        SizedBox(height: 25.h),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Goal: ',
                                style: AppStyles.styleSemiBold16,
                              ),
                              TextSpan(
                                text:
                                    'Make healthcare easy and accessible for everyone.',
                                style: AppStyles.styleLight16,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Mission: ',
                                style: AppStyles.styleSemiBold16,
                              ),
                              TextSpan(
                                text:
                                    'Connect patients and doctors with smart, seamless technology.',
                                style: AppStyles.styleLight16,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What Patients Say \nAbout Tabibi',
                      style: AppStyles.styleMeduim36,
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      'We are proud to have helped thousands of patients take steps towards better health.',
                      style: AppStyles.styleLight20,
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        SizedBox(width: 4.w),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFF000000).withOpacity(0.2),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6.h),
                            child: Icon(Icons.arrow_back_ios_new_outlined),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFF000000).withOpacity(0.2),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6.h),
                            child: Icon(Icons.arrow_forward_ios_outlined),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(Assets.imagesQuotes2),

                  SizedBox(height: 35.h),
                  Text(
                    'The Tabibi app made booking my appointment so easy! I had a virtual consultation with my doctor, and everything was smooth and hassle-free.',
                    style: AppStyles.styleRegular22,
                  ),
                  SizedBox(height: 35.h),
                  Row(
                    children: [
                      Image.asset(Assets.imagesPerson1),
                      SizedBox(width: 5.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ahmed Elshennawy",
                            style: AppStyles.styleRegular20,
                          ),
                          Text("December 12"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        Stack(
          children: [
            Positioned.fill(child: SvgPicture.asset(Assets.imagesSignBack)),
            Container(
              padding: EdgeInsets.all(15.w),
              color: Color(0xFF373737).withOpacity(0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Healthy Living: Simple Steps for a Better You',
                    style: AppStyles.styleMeduim36,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Taking care of your health doesn’t have to be complicated. Follow these simple yet effective tips to stay active, eat well, and maintain a balanced lifestyle for a healthier, happier life.',
                    style: AppStyles.styleLight20,
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      _buildAbouItem(
                        "Stay Hydrated",
                        "Drink at least 8 glasses of water daily to maintain energy levels, support digestion, and keep your skin and organs healthy. Dehydration can lead to fatigue, headaches, and poor concentration.",
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        width: 0.5.w,
                        height: 200.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.w),
                          color: const Color(0xFF000000).withOpacity(0.3),
                        ),
                      ),
                      _buildAbouItem(
                        'Eat a Balanced Diet',
                        'Include a variety of fruits, vegetables, lean proteins, and whole grains in your meals. A nutrient-rich diet strengthens your immune system, improves digestion, and boosts overall health.',
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        width: 0.5.w,
                        height: 200.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.w),
                          color: const Color(0xFF000000).withOpacity(0.3),
                        ),
                      ),
                      _buildAbouItem(
                        'Stay Active',
                        'Engage in at least 30 minutes of physical activity daily, whether it’s walking, running, or exercising. Regular movement helps maintain a healthy weight, reduces stress, and supports heart health.',
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 40.h),
                    width: 1.sw,
                    height: 2.5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.w),
                      color: const Color(0xFF000000).withOpacity(0.3),
                    ),
                  ),
                  Row(
                    children: [
                      _buildAbouItem(
                        "Get Enough Sleep",
                        "Quality sleep is essential for mental and physical well-being. Aim for 7-8 hours of rest each night to improve focus, enhance mood, and allow your body to repair and recharge.",
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        width: 0.5.w,
                        height: 200.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.w),
                          color: const Color(0xFF000000).withOpacity(0.3),
                        ),
                      ),
                      _buildAbouItem(
                        'Manage Stress',
                        'Practice stress-relief techniques like meditation, deep breathing, or yoga. Managing stress effectively can prevent anxiety, improve heart health, and enhance overall well-being.',
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        width: 0.5.w,
                        height: 200.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.w),
                          color: const Color(0xFF000000).withOpacity(0.3),
                        ),
                      ),
                      _buildAbouItem(
                        'Regular Check-Ups',
                        'Schedule routine visits with your doctor to monitor your health, detect potential issues early, and stay informed about necessary vaccinations and screenings. Prevention is key to long-term wellness.',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(
          width: 1.sw,
          child: Image.asset(Assets.imagesBye, fit: BoxFit.fitWidth),
        ),

        Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                Assets.imagesFooterDoc,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(horizontal: 110.w, vertical: 80.h),
              child: Column(
                children: [
                  Text(
                    'want to get touched with doctor?',
                    style: AppStyles.styleRegular50,
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    textAlign: TextAlign.center,
                    'Book a consultation now and we will help you determine the next ste towards better health',
                    style: AppStyles.styleLight24,
                  ),
                  SizedBox(height: 50.h),
                  Container(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 5.w,
                      top: 12.h,
                      bottom: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(30.h),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Book a consultation",
                          style: AppStyles.styleMeduim24.copyWith(
                            color: Color(0xFF1C274D),
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Icon(
                          Icons.arrow_forward,
                          size: 3.w,
                          color: Color(0xFF1C274D),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAbouItem(String title, String description) {
    return SizedBox(
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppStyles.styleMeduim24),
          SizedBox(height: 8.h),
          Text(description, style: AppStyles.styleLight16),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}

// CONTACT SECTION
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 40.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get Touch \nwith Tabbii team',
                      style: AppStyles.styleSemiBold24,
                    ),
                    SizedBox(height: 25.h),
                    Text(
                      'Have a question, what aspects or what to answer when I/2/3 were to apply to your study? We should try to understand why they were not going to be helpful. We do not need to ask questions about what to answer. We would like to ask questions about what to answer.',
                      style: AppStyles.styleLight20,
                    ),
                    SizedBox(height: 25.h),
                    Text(
                      "tabibiteam@gmail.com",
                      style: AppStyles.styleLight20.copyWith(
                        color: Color(0xff000000).withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              label: Text(
                                'Full Name',
                                style: AppStyles.styleRegular20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              label: Text(
                                'Email',
                                style: AppStyles.styleRegular20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              label: Text(
                                'Phone',
                                style: AppStyles.styleRegular20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              label: Text(
                                'Subject',
                                style: AppStyles.styleRegular20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('Message', style: AppStyles.styleRegular20),
                      ),
                    ),
                    SizedBox(height: 30.h),

                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Checkbox(value: true, onChanged: (bool? value) {}),
                        Text('I agree with the Privacy Policies'),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 10.w,
                          right: 5.w,
                          top: 12.h,
                          bottom: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF1C274D),
                          borderRadius: BorderRadius.circular(30.h),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Submit", style: AppStyles.styleMeduim20),
                            SizedBox(width: 3.w), // Adjust spacing if needed
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 3.w,
                              color: Color(0xFFFFFFFF),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 130.w, vertical: 60.h),
          width: 1.sw,
          decoration: BoxDecoration(color: Color(0xff202020)),
          child: Column(
            children: [
              Text(
                'Tabibi',
                style: AppStyles.styleBold44.copyWith(color: Color(0xFFFFFFFF)),
              ),
              SizedBox(height: 45.h),
              Text(
                'Stay connected with us:',
                style: AppStyles.styleMeduim24.copyWith(
                  color: Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: 35.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Facebook',
                    style: AppStyles.styleMeduim24.copyWith(
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  Text(
                    'Twitter',
                    style: AppStyles.styleMeduim24.copyWith(
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  Text(
                    'Instagram',
                    style: AppStyles.styleMeduim24.copyWith(
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35.h),
              Text(
                'Copyright © 2025 Tabibi. All rights reserved.',
                style: AppStyles.styleRegular16.copyWith(
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
