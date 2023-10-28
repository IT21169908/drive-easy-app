part of '../widgets.g.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
    super.key,
    this.touchCallback,
    required this.touchedIndex,
    this.sections,
    this.child,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.centerSpaceRadius = 50,
    this.aspectRatio = 1,
  });

  final CrossAxisAlignment crossAxisAlignment;
  final Widget? child;
  final double aspectRatio;
  final double centerSpaceRadius;
  final int touchedIndex;
  final void Function(FlTouchEvent, PieTouchResponse?)? touchCallback;
  final List<PieChartSectionData>? sections;

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
                sections: sections,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
