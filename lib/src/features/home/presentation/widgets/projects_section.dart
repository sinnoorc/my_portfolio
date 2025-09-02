import '../../../../../common_libs.dart';
import '../../../../../gen/fonts.gen.dart';

class ProjectsSection extends StatelessWidget {
  final Color backgroundColor;
  
  const ProjectsSection({
    super.key,
    this.backgroundColor = const Color(0xFF0a0a0a),
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
            'FEATURED PROJECTS',
            style: TextStyle(
              fontFamily: FontFamily.helveticaNow,
              fontSize: 80,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 60),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _ProjectCard(
                    title: 'E-Commerce Flutter App',
                    description: 'A full-featured e-commerce application built with Flutter, featuring product catalog, shopping cart, payment integration, and user authentication.',
                    technologies: ['Flutter', 'Firebase', 'Stripe', 'Provider'],
                    color: const Color(0xFFF40C3F),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: _ProjectCard(
                    title: 'Portfolio Website',
                    description: 'This interactive portfolio website showcasing modern design principles, smooth animations, and responsive layouts built with Flutter Web.',
                    technologies: ['Flutter Web', 'Riverpod', 'Go Router', 'Custom Animations'],
                    color: const Color(0xFF7312DB),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: _ProjectCard(
                    title: 'Task Management App',
                    description: 'A productivity app with real-time collaboration, task tracking, deadline management, and team communication features.',
                    technologies: ['Flutter', 'WebSocket', 'SQLite', 'Notifications'],
                    color: const Color(0xFF0EA5E9),
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

class _ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final Color color;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.technologies,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFF1a1a1a),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              fontFamily: FontFamily.helveticaNow,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 24),
          const Text(
            'TECHNOLOGIES',
            style: TextStyle(
              fontFamily: FontFamily.helveticaNow,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white54,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: technologies.map((tech) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: color.withOpacity(0.3), width: 1),
              ),
              child: Text(
                tech,
                style: TextStyle(
                  fontFamily: FontFamily.helveticaNow,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}