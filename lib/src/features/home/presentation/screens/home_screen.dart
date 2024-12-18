import 'dart:math';

import 'package:flutter/scheduler.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../common_libs.dart';
import '../../../../../gen/assets.gen.dart';
import '../widgets/bottom_section.dart';

void useAnimationFrame(void Function(Duration) callback) {
  final savedCallback = useRef(callback);

  useEffect(() {
    savedCallback.value = callback;
    Duration? lastTimestamp;

    void tick(Duration timestamp) {
      if (lastTimestamp == null ||
          timestamp.inMilliseconds - lastTimestamp!.inMilliseconds >= 16) {
        savedCallback.value(timestamp);
        lastTimestamp = timestamp;
      }
      SchedulerBinding.instance.scheduleFrameCallback(tick);
    }

    SchedulerBinding.instance.scheduleFrameCallback(tick);
    return () {};
  }, []);
}

class WavePattern extends HookWidget {
  const WavePattern({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 10), // Faster base animation
    )..repeat();

    final mousePosition = useState(Offset.zero);
    final smoothMousePosition = useValueNotifier(Offset.zero);
    final mouseVelocity = useValueNotifier(0.0);
    final lastMousePosition = useState(Offset.zero);
    final isMouseActive = useState(false);

    useAnimationFrame((duration) {
      if (!isMouseActive.value && mouseVelocity.value < 0.01) return;

      final currentPosition = mousePosition.value;
      final factor = isMouseActive.value ? 0.25 : 0.15; // Faster response

      smoothMousePosition.value = Offset(
        smoothMousePosition.value.dx +
            (currentPosition.dx - smoothMousePosition.value.dx) * factor,
        smoothMousePosition.value.dy +
            (currentPosition.dy - smoothMousePosition.value.dy) * factor,
      );

      if (isMouseActive.value) {
        final dx = currentPosition.dx - lastMousePosition.value.dx;
        final dy = currentPosition.dy - lastMousePosition.value.dy;
        final newVelocity = sqrt(dx * dx + dy * dy);
        mouseVelocity.value += (newVelocity - mouseVelocity.value) *
            0.2; // Faster velocity changes
      } else {
        mouseVelocity.value *= 0.9; // Faster decay
      }

      lastMousePosition.value = currentPosition;
    });

    return Listener(
      onPointerHover: (event) {
        isMouseActive.value = true;
        mousePosition.value = event.localPosition;
      },
      onPointerMove: (event) {
        isMouseActive.value = true;
        mousePosition.value = event.localPosition;
      },
      onPointerCancel: (event) {
        isMouseActive.value = false;
      },
      onPointerDown: (event) {
        isMouseActive.value = true;
        mousePosition.value = event.localPosition;
      },
      child: ValueListenableBuilder<double>(
        valueListenable: controller,
        builder: (context, animation, _) {
          return CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height),
            painter: WavePainter(
              animation: animation,
              mousePosition: smoothMousePosition.value,
              mouseVelocity: mouseVelocity.value,
              isMouseActive: isMouseActive.value,
            ),
          );
        },
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final double animation;
  final Offset mousePosition;
  final double mouseVelocity;
  final bool isMouseActive;

  WavePainter({
    required this.animation,
    required this.mousePosition,
    required this.mouseVelocity,
    required this.isMouseActive,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..isAntiAlias = false; // Disable antialiasing for better performance

    const double spacing = 15; // Increased spacing for better performance
    final numLines = (size.width / spacing).ceil();
    final step = 2.0; // Increased step for better performance

    for (var i = 0; i < numLines; i++) {
      final path = Path();
      final x = i * spacing;
      final phaseOffset =
          i * 0.2; // Increased phase offset for more dynamic effect

      path.moveTo(x, 0);

      double lastY = 0;
      double lastOffset = x;

      for (double y = 0; y < size.height; y += step) {
        // Simplified wave calculation
        final baseWave =
            sin((y * 0.015) + phaseOffset + animation * pi * 4) * 12;
        final secondWave = cos((y * 0.02) - animation * pi * 3) * 8;

        double mouseWave = 0;
        if (isMouseActive) {
          final dx = x - mousePosition.dx;
          final dy = y - mousePosition.dy;
          final distance = sqrt(dx * dx + dy * dy);
          final maxDistance = 100.0 + (mouseVelocity * 2).clamp(0.0, 100.0);

          if (distance < maxDistance) {
            final factor =
                (1 - (distance / maxDistance)) * min(mouseVelocity * 0.4, 25.0);
            mouseWave = sin(distance * 0.03 + animation * pi * 2) * factor;
          }
        }

        final totalOffset = x + baseWave + secondWave + mouseWave;

        // Only add points if there's significant movement
        if (y == 0 ||
            (y - lastY) > step ||
            (totalOffset - lastOffset).abs() > 0.5) {
          path.lineTo(totalOffset, y);
          lastY = y;
          lastOffset = totalOffset;
        }
      }

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant WavePainter oldDelegate) =>
      oldDelegate.animation != animation ||
      (isMouseActive &&
          (oldDelegate.mousePosition != mousePosition ||
              oldDelegate.mouseVelocity != mouseVelocity));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      // body: Container(
      //   // color: Colors.red,
      //   color: const Color(0xFFF40C3F),
      //   child: const WavePattern(),
      // ),
      body: Stack(
        children: [
          Container(
            color: const Color(0xFFF40C3F),
            child: const WavePattern(),
          ),
          ScrollTransformView(
            children: [
              ScrollTransformItem(
                builder: (scrollOffset) {
                  final offScreenPercentage =
                      min(scrollOffset / screenSize.height, 1);
                  return Image.asset(
                    Assets.images.bg2.path,
                    height: screenSize.height -
                        (screenSize.height * 0.2 * offScreenPercentage),
                    width: screenSize.width -
                        (screenSize.width * 0.5 * offScreenPercentage),
                    fit: BoxFit.cover,
                  );
                },
                offsetBuilder: (scrollOffset) {
                  final offScreenPercentage =
                      min(scrollOffset / screenSize.height, 1);
                  final heightShrinkageAmount =
                      (screenSize.height * 0.2 * offScreenPercentage);
                  final bool startMovingImage =
                      scrollOffset >= screenSize.height * 0.8;
                  final onScreenOffset =
                      scrollOffset + heightShrinkageAmount / 2;
                  return Offset(
                    0,
                    !startMovingImage
                        ? onScreenOffset
                        : onScreenOffset -
                            (scrollOffset - screenSize.height * 0.8) * 0.2,
                  );
                },
              ),
              ScrollTransformItem(
                builder: (context) {
                  return const OverlayTextSection();
                },
                offsetBuilder: (scrollOffset) => Offset(0, -screenSize.height),
              ),
              ScrollTransformItem(
                builder: (context) {
                  return const BottomSection();
                },
              ),
              ScrollTransformItem(
                builder: (context) {
                  return const BottomSection(color: Colors.transparent);
                },
              ),
              ScrollTransformItem(
                builder: (context) {
                  return const BottomSection(color: Colors.transparent);
                },
              ),
              ScrollTransformItem(
                builder: (context) {
                  return const BottomSection(color: Colors.transparent);
                },
              ),
              ScrollTransformItem(
                builder: (context) {
                  return const BottomSection(color: Colors.transparent);
                },
              ),
              ScrollTransformItem(
                builder: (context) {
                  return const BottomSection(color: Colors.red);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
