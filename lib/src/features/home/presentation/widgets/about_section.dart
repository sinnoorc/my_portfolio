import '../../../../../common_libs.dart';
import '../../../../../gen/fonts.gen.dart';

class AboutSection extends StatelessWidget {
  final Color backgroundColor;
  
  const AboutSection({
    super.key,
    this.backgroundColor = const Color(0xFF2a2a2a),
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ABOUT ME',
                  style: TextStyle(
                    fontFamily: FontFamily.helveticaNow,
                    fontSize: 80,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Hello! I\'m Sinnoor C, a passionate Flutter developer who thrives on turning creative ideas into functional, beautiful applications.',
                  style: TextStyle(
                    fontFamily: FontFamily.helveticaNow,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFF40C3F),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'With a strong foundation in cross-platform development, I specialize in creating seamless user experiences that work flawlessly across mobile, web, and desktop platforms. My approach combines clean, maintainable code with modern design principles to deliver applications that not only look great but perform exceptionally.',
                  style: TextStyle(
                    fontFamily: FontFamily.helveticaNow,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'I believe in the power of technology to solve real-world problems and am constantly exploring new ways to push the boundaries of what\'s possible with Flutter. Whether it\'s implementing complex animations, optimizing performance, or crafting intuitive user interfaces, I bring enthusiasm and expertise to every project.',
                  style: TextStyle(
                    fontFamily: FontFamily.helveticaNow,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 80),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 140), // Align with title
                _ExperienceItem(
                  title: 'Flutter Developer',
                  company: 'Freelance & Contract',
                  period: '2022 - Present',
                  description: 'Developing custom Flutter applications for various clients, focusing on clean architecture and user experience.',
                ),
                const SizedBox(height: 40),
                _ExperienceItem(
                  title: 'Mobile App Developer',
                  company: 'Previous Experience',
                  period: '2020 - 2022',
                  description: 'Built cross-platform mobile applications and gained expertise in modern development practices.',
                ),
                const SizedBox(height: 60),
                const Text(
                  'EDUCATION & CERTIFICATIONS',
                  style: TextStyle(
                    fontFamily: FontFamily.helveticaNow,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  '• Computer Science Background\n• Flutter Development Certification\n• Mobile Development Specialization\n• Continuous Learning in Emerging Technologies',
                  style: TextStyle(
                    fontFamily: FontFamily.helveticaNow,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final String title;
  final String company;
  final String period;
  final String description;

  const _ExperienceItem({
    required this.title,
    required this.company,
    required this.period,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: FontFamily.helveticaNow,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$company • $period',
          style: const TextStyle(
            fontFamily: FontFamily.helveticaNow,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFFF40C3F),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          description,
          style: const TextStyle(
            fontFamily: FontFamily.helveticaNow,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white70,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}