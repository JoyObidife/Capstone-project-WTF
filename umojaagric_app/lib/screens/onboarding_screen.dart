import 'package:flutter/material.dart';
import 'package:umojaagric_app/widgets/onboarding_page.dart';
import 'package:umojaagric_app/pages/welcome_page.dart';
import 'package:umojaagric_app/pages/home_page.dart'; 

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _languages = ['English', 'Swahili', 'French'];
  String? _selectedLanguage = 'English';

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _skipToRoleSelection() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const WelcomePage()),
    );
  }

  void _skipToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          // SCREEN 1: Splash / Intro
          OnboardingPage(
            backgroundImage: 'assets/images/onboarding_screen_1.png',
            hasOverlay: true, 
            backgroundColor: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/product_image.png',
                  height: 120,
                ),
                
                 SizedBox(height: 10),
                 Text(
                  'Smarter systems, zero spoilage',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
                 Spacer(),
                Padding(
                  padding:  EdgeInsets.only(bottom: 50.0),
                  child: GestureDetector(
                    onTap: _nextPage,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child:  Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // SCREEN 2: Select Language
          OnboardingPage(
            backgroundGradient:  LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.green.shade50, Colors.green.shade100], // Soft green gradient
            ),
            child: Column(
              children: [
                  
                Expanded(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                         Icon(Icons.language, color: Colors.green),
                         SizedBox(width: 10),
                          Text(
                            'Select Language',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedLanguage,
                              icon:  Icon(Icons.arrow_drop_down, color: Colors.green),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedLanguage = newValue;
                                });
                             
                                Future.delayed( Duration(milliseconds: 500), _nextPage);
                              },
                              items: _languages.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 50.0),
                  child: GestureDetector(
                    onTap: _nextPage,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // SCREEN 3: Real-Time Tracking
          _buildContentPage(
            imagePath: 'assets/images/onboarding_screen_2.jpeg',
            title: 'Real-Time Tracking',
            description: 'Monitor your produce journey from farm to market with real-time updates and meaningful insights.',
            pageIndex: 2,
            isLastPage: false,
          ),

          // SCREEN 4: Fresh, Healthy Produce
          _buildContentPage(
            imagePath: 'assets/images/onboarding_screen_3.jpeg',
            title: 'Fresh, Healthy Produce',
            description: 'Ensure the highest quality of produce with our smart logistics and spoilage prevention systems.',
            pageIndex: 3,
            isLastPage: true,
          ),
        ],
      ),
    );
  }

  Widget _buildContentPage({
    required String imagePath,
    required String title,
    required String description,
    required int pageIndex,
    required bool isLastPage,
  }) {
    return OnboardingPage(
      backgroundColor: Colors.grey.shade100,
      child: Column(
        children: [
         Spacer(flex: 1),
         
          Container(
            height: 350,
            margin: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  offset: Offset(0, 8),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Spacer(flex: 2),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) => _buildDot(index, pageIndex)),
                ),
                 SizedBox(height: 30),
                if (isLastPage)
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _skipToRoleSelection,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                else
                  GestureDetector(
                    onTap: _nextPage,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child:  Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index, int currentPageIndex) {
    bool isActive = index == currentPageIndex;
    return AnimatedContainer(
      duration:  Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
