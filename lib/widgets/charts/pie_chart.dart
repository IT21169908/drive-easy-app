part of '../widgets.g.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
    super.key,
    this.touchCallback,
    required this.touchedIndex,
    this.sections,
    required this.child,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final CrossAxisAlignment crossAxisAlignment;
  final Widget child;
  final int touchedIndex;
  final void Function(FlTouchEvent, PieTouchResponse?)? touchCallback;
  final List<PieChartSectionData>? sections;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        child,
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
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
                centerSpaceRadius: 50,
                sections: sections,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
