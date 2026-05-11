import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  Map<String, List<int>> weeklyData = {};
  List<String> selectedHabits = [];
  final List<String> _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  void initState() {
    super.initState();
    _loadWeeklyData();
  }

  Future<void> _loadWeeklyData() async {
    final prefs = await SharedPreferences.getInstance();
    final habitsStr = prefs.getString('selectedHabitsMap');
    if (habitsStr != null) {
      final map = jsonDecode(habitsStr) as Map<String, dynamic>;
      selectedHabits = map.keys.toList();
    } else {
      selectedHabits = [];
    }

    if (selectedHabits.isEmpty) {
      if (mounted) setState(() => weeklyData = {});
      return;
    }

    String? stored = prefs.getString('weeklyData');
    if (stored == null) {
      final rng = Random();
      final generated = {
        for (var h in selectedHabits)
          h: List.generate(7, (_) => rng.nextBool() ? 1 : 0)
      };
      await prefs.setString('weeklyData', jsonEncode(generated));
      stored = jsonEncode(generated);
    }

    if (!mounted) return;
    setState(() {
      final decoded = jsonDecode(stored!) as Map<String, dynamic>;
      weeklyData = decoded.map((k, v) => MapEntry(k, List<int>.from(v)));
    });
  }

  int _completedDays(String habit) =>
      weeklyData[habit]?.where((v) => v == 1).length ?? 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weekly Report')),
      body: weeklyData.isEmpty
          ? Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.bar_chart, size: 64, color: Colors.grey.shade300),
                const SizedBox(height: 12),
                Text('No habits to report yet.\nAdd some habits first!',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16, color: Colors.grey.shade400)),
              ]),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Summary cards
                  _buildSummaryRow(),
                  const SizedBox(height: 20),
                  const Text('Day-by-Day Breakdown',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF1565C0))),
                  const SizedBox(height: 12),
                  // Grid table
                  _buildGrid(),
                ],
              ),
            ),
    );
  }

  Widget _buildSummaryRow() {
    final totalEntries =
        selectedHabits.fold<int>(0, (sum, h) => sum + 7);
    final totalDone = weeklyData.values
        .fold<int>(0, (sum, list) => sum + list.where((v) => v == 1).length);
    final pct =
        totalEntries > 0 ? (totalDone / totalEntries * 100).round() : 0;

    return Row(children: [
      _summaryCard('Total Habits', '${selectedHabits.length}',
          Icons.list_alt, Colors.blue),
      const SizedBox(width: 12),
      _summaryCard('Completed', '$totalDone / $totalEntries',
          Icons.check_circle_outline, Colors.green),
      const SizedBox(width: 12),
      _summaryCard('Rate', '$pct%', Icons.trending_up, Colors.orange),
    ]);
  }

  Widget _summaryCard(
      String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Column(children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 6),
          Text(value,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16, color: color)),
          const SizedBox(height: 2),
          Text(label,
              style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
              textAlign: TextAlign.center),
        ]),
      ),
    );
  }

  Widget _buildGrid() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(children: [
            _cell('Habit', isHeader: true, width: 130),
            ..._days.map((d) => _cell(d, isHeader: true)),
            _cell('Score', isHeader: true, width: 60),
          ]),
          const SizedBox(height: 4),
          // Data rows
          ...selectedHabits.map((habit) {
            final data = weeklyData[habit] ?? List.filled(7, 0);
            final done = data.where((v) => v == 1).length;
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(children: [
                _cell(habit, width: 130, align: TextAlign.left),
                ...data.map((v) => _dayCell(v == 1)),
                _scoreCell(done),
              ]),
            );
          }),
        ],
      ),
    );
  }

  Widget _cell(String text,
      {bool isHeader = false,
      double width = 44,
      TextAlign align = TextAlign.center}) {
    return Container(
      width: width,
      height: 38,
      alignment: align == TextAlign.left
          ? Alignment.centerLeft
          : Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isHeader
            ? const Color(0xFF1565C0).withOpacity(0.08)
            : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: isHeader ? 12 : 13,
          color: isHeader ? const Color(0xFF1565C0) : Colors.black87,
        ),
      ),
    );
  }

  Widget _dayCell(bool done) {
    return Container(
      width: 44,
      height: 38,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: done
            ? Colors.green.withOpacity(0.1)
            : Colors.red.withOpacity(0.06),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        done ? Icons.check_circle_rounded : Icons.cancel_rounded,
        color: done ? Colors.green : Colors.red.shade300,
        size: 20,
      ),
    );
  }

  Widget _scoreCell(int done) {
    final color = done >= 5
        ? Colors.green
        : done >= 3
            ? Colors.orange
            : Colors.red;
    return Container(
      width: 60,
      height: 38,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text('$done/7',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: color, fontSize: 13)),
    );
  }
}