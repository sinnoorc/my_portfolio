import '../../../../../common_libs.dart';
import '../../../../../gen/fonts.gen.dart';

class SkillsSection extends StatelessWidget {
  final Color backgroundColor;
  
  const SkillsSection({
    super.key,
    this.backgroundColor = const Color(0xFF1a1a1a),
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'SKILLS',
            style: TextStyle(
              fontFamily: FontFamily.helveticaNow,
              fontSize: 80,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _SkillCategory(
                    title: 'MOBILE DEVELOPMENT',
                    skills: [
                      'Flutter & Dart',
                      'Cross-platform Apps',
                      'Native Performance',
                      'Material Design',
                      'iOS & Android',
                      'State Management',
                      'API Integration',
                    ],
                  ),
                ),
                const SizedBox(width: 80),
                Expanded(
                  child: _SkillCategory(
                    title: 'WEB DEVELOPMENT',
                    skills: [
                      'Flutter Web',
                      'Responsive Design',
                      'Progressive Web Apps',
                      'Modern UI/UX',
                      'Performance Optimization',
                      'SEO Implementation',
                      'Browser Compatibility',
                    ],
                  ),
                ),
                const SizedBox(width: 80),
                Expanded(
                  child: _SkillCategory(
                    title: 'TECHNICAL EXPERTISE',
                    skills: [
                      'Clean Architecture',
                      'Test-Driven Development',
                      'Git & Version Control',
                      'CI/CD Pipelines',
                      'Database Management',
                      'REST APIs',
                      'Firebase & Backend',
                    ],
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

class _SkillCategory extends StatelessWidget {
  final String title;
  final List<String> skills;

  const _SkillCategory({
    required this.title,
    required this.skills,
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
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFFF40C3F),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 24),
        ...skills.map((skill) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            skill,
            style: const TextStyle(
              fontFamily: FontFamily.helveticaNow,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
              height: 1.4,
            ),
          ),
        )),
      ],
    );
  }
}