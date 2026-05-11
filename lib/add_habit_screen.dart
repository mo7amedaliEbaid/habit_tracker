import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddHabitScreen extends StatefulWidget {
  const AddHabitScreen({super.key});

  @override
  State<AddHabitScreen> createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  final _habitController = TextEditingController();
  Map<String, String> selectedHabitsMap = {};
  Map<String, String> completedHabitsMap = {};
  String selectedColorName = 'Amber';

  final Map<String, Color> _habitColors = {
    'Amber': Colors.amber,
    'Red Accent': Colors.redAccent,
    'Light Blue': Colors.lightBlue,
    'Light Green': Colors.lightGreen,
    'Purple Accent': Colors.purpleAccent,
    'Orange': Colors.orange,
    'Teal': Colors.teal,
    'Deep Purple': Colors.deepPurple,
  };

  @override
  void initState() {
    super.initState();
    _loadHabits();
  }

  @override
  void dispose() {
    _habitController.dispose();
    super.dispose();
  }

  Future<void> _loadHabits() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      selectedHabitsMap = Map<String, String>.from(
          jsonDecode(prefs.getString('selectedHabitsMap') ?? '{}'));
      completedHabitsMap = Map<String, String>.from(
          jsonDecode(prefs.getString('completedHabitsMap') ?? '{}'));
    });
  }

  Future<void> _saveHabits() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedHabitsMap', jsonEncode(selectedHabitsMap));
    await prefs.setString('completedHabitsMap', jsonEncode(completedHabitsMap));
  }

  void _addHabit() {
    final name = _habitController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please enter a habit name'),
        backgroundColor: Colors.red,
      ));
      return;
    }
    if (selectedHabitsMap.containsKey(name) || completedHabitsMap.containsKey(name)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Habit already exists'),
        backgroundColor: Colors.orange,
      ));
      return;
    }
    setState(() {
      selectedHabitsMap[name] =
          _habitColors[selectedColorName]!.value.toRadixString(16);
      _habitController.clear();
      selectedColorName = 'Amber';
    });
    _saveHabits();
  }

  Color _colorFromHex(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse('0x$hex'));
  }

  @override
  Widget build(BuildContext context) {
    final allHabits = {...selectedHabitsMap, ...completedHabitsMap};
    return Scaffold(
      appBar: AppBar(title: const Text('Configure Habits')),
      body: Column(
        children: [
          // ── Input card ──────────────────────────────────────────
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey.shade50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Add New Habit',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF1565C0))),
                const SizedBox(height: 10),
                TextField(
                  controller: _habitController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    hintText: 'e.g. Read a Book',
                    prefixIcon: const Icon(Icons.add_circle_outline,
                        color: Color(0xFF1565C0)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                            color: Color(0xFF1565C0), width: 1.5)),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                  ),
                ),
                const SizedBox(height: 12),
                const Text('Pick a Color',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Colors.black54)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 10,
                  children: _habitColors.entries.map((e) {
                    final isSelected = e.key == selectedColorName;
                    return GestureDetector(
                      onTap: () => setState(() => selectedColorName = e.key),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: e.value,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: isSelected
                                  ? Colors.black54
                                  : Colors.transparent,
                              width: 3),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                      color: e.value.withOpacity(0.5),
                                      blurRadius: 8)
                                ]
                              : [],
                        ),
                        child: isSelected
                            ? const Icon(Icons.check,
                                color: Colors.white, size: 18)
                            : null,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _addHabit,
                    icon: const Icon(Icons.add),
                    label: const Text('Add Habit'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1565C0),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Habits list ─────────────────────────────────────────
          if (allHabits.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
              child: Row(children: [
                const Text('Your Habits',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(width: 8),
                Text('(${allHabits.length})',
                    style: const TextStyle(color: Colors.grey)),
              ]),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: allHabits.entries.map((entry) {
                  final isDone = completedHabitsMap.containsKey(entry.key);
                  final color = _colorFromHex(entry.value);
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 6,
                            offset: const Offset(0, 2))
                      ],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 8, backgroundColor: color),
                      title: Text(entry.key,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            decoration:
                                isDone ? TextDecoration.lineThrough : null,
                            color: isDone ? Colors.grey : Colors.black87,
                          )),
                      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                        if (isDone)
                          const Icon(Icons.check_circle,
                              color: Colors.green, size: 18),
                        IconButton(
                          icon: const Icon(Icons.delete_outline,
                              color: Colors.red),
                          onPressed: () {
                            setState(() {
                              selectedHabitsMap.remove(entry.key);
                              completedHabitsMap.remove(entry.key);
                            });
                            _saveHabits();
                          },
                        ),
                      ]),
                    ),
                  );
                }).toList(),
              ),
            ),
          ] else
            Expanded(
              child: Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.playlist_add,
                      size: 56, color: Colors.grey.shade300),
                  const SizedBox(height: 12),
                  Text('No habits yet',
                      style: TextStyle(
                          color: Colors.grey.shade400, fontSize: 16)),
                ]),
              ),
            ),
        ],
      ),
    );
  }
}