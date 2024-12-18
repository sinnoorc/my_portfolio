import '../../../../../common_libs.dart';
import '../../../../../gen/fonts.gen.dart';

class BottomSection extends StatelessWidget {
  final Color color;
  const BottomSection({
    super.key,
    this.color = const Color.fromARGB(255, 115, 18, 219),
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      color: color,
      child: const Stack(
        children: [
          Positioned.fill(
            top: -50,
            child: Center(
              child: Text(
                '\nA CREATOR OF THINGS.\nSOMETIMES I GO EXPLORE\nAND MAKE THINGS\nTHAT I FIND INTERESTING',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.helveticaNow,
                  fontSize: 80,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OverlayTextSection extends StatelessWidget {
  const OverlayTextSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: const Stack(
        children: [
          Positioned(
            left: 50,
            bottom: 30,
            child: Text(
              'Sinnoor C',
              style: TextStyle(
                fontFamily: FontFamily.helveticaNow,
                fontSize: 120,
                fontWeight: FontWeight.w800,
                height: 1.2,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            right: 50,
            bottom: 25,
            child: SizedBox(
              width: 470,
              child: Text(
                '''A creator and explorer at heart. I build visually stunning and seamlessly functional applications that inspire. Like the endless horizon, I believe every project holds limitless possibilities—blending creativity, clean code, and innovation to bring ideas to life.Whether crafting smooth experiences for mobile, web, or desktop,''',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.helveticaNow,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
