part of '../widgets.g.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
    super.key,
    this.touchCallback,
    required this.touchedIndex,
    this.child,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.centerSpaceRadius = 50,
    this.aspectRatio = 1,
    required this.examSummery,
  });

  final Map<String, double> examSummery;
  final CrossAxisAlignment crossAxisAlignment;
  final Widget? child;
  final double aspectRatio;
  final double centerSpaceRadius;
  final int touchedIndex;
  final void Function(FlTouchEvent, PieTouchResponse?)? touchCallback;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        if (child != null) child!,
        Expanded(
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: PieChart(
              swapAnimationDuration: const Duration(milliseconds: 150), // Optional
              swapAnimationCurve: Curves.easeInOutCubicEmphasized, // Optiona
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: touchCallback,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: centerSpaceRadius,
                sections: List.generate(2, (i) {
                  final isTouched = i == touchedIndex;
                  final fontSize = isTouched
                      ? 20.0
                      : examSummery['incorrectPercentage']! >= 100 || examSummery['correctPercentage']! >= 100
                          ? 12.0
                          : 15.0;
                  final radius = isTouched ? 40.0 : 35.0;
                  const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
                  switch (i) {
                    case 0: // incorrect
                      return PieChartSectionData(
                        color: const Color(0xFFF59304),
                        value: examSummery['incorrectPercentage'],
                        title: '${examSummery['incorrectPercentage']?.toInt()}%',
                        borderSide: const BorderSide(width: 0),
                        radius: radius,
                        titleStyle: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: shadows,
                        ),
                      );
                    case 1: // correct
                      return PieChartSectionData(
                        color: const Color(0xFF4E74F9),
                        value: examSummery['correctPercentage'],
                        title: '${examSummery['correctPercentage']?.toInt()}%',
                        radius: radius,
                        borderSide: const BorderSide(width: 0),
                        titleStyle: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: shadows,
                        ),
                      );
                    default:
                      if (kDebugMode) {
                        print("showingSections $i");
                      }
                      return PieChartSectionData();
                  }
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
