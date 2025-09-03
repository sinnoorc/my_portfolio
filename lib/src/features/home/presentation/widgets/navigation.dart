import '../../../../../common_libs.dart';
import '../../../../../gen/fonts.gen.dart';

class FloatingNavigation extends StatelessWidget {
  final Function(int) onSectionTap;
  final int currentSection;

  const FloatingNavigation({
    super.key,
    required this.onSectionTap,
    required this.currentSection,
  });

  @override
  Widget build(BuildContext context) {
    final navItems = [
      _NavItem(label: 'Home', index: 0),
      _NavItem(label: 'About', index: 1),
      _NavItem(label: 'Skills', index: 2),
      _NavItem(label: 'Projects', index: 3),
      _NavItem(label: 'Contact', index: 4),
    ];

    return Positioned(
      top: 40,
      right: 50,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: navItems.map((item) {
            final isActive = item.index == currentSection;
            return GestureDetector(
              onTap: () => onSectionTap(item.index),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFFF40C3F) : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  item.label,
                  style: TextStyle(
                    fontFamily: FontFamily.helveticaNow,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isActive ? Colors.white : Colors.white70,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _NavItem {
  final String label;
  final int index;

  _NavItem({required this.label, required this.index});
}

class ScrollProgressIndicator extends StatelessWidget {
  final double progress;

  const ScrollProgressIndicator({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 50,
      top: 0,
      bottom: 0,
      child: Container(
        width: 2,
        color: Colors.white.withOpacity(0.1),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 2,
            height: MediaQuery.of(context).size.height * progress,
            color: const Color(0xFFF40C3F),
          ),
        ),
      ),
    );
  }
}