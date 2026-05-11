import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool notificationsEnabled = false;
  List<String> selectedHabits = [];
  List<String> selectedTimes = [];
  Map<String, String> allHabitsMap = {};

  final List<String> _timeSlots = ['Morning', 'Afternoon', 'Evening'];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      notificationsEnabled = prefs.getBool('notificationsEnabled') ?? false;
      allHabitsMap = Map<String, String>.from(
          jsonDecode(prefs.getString('selectedHabitsMap') ?? '{}'));
      selectedHabits = prefs.getStringList('notificationHabits') ?? [];
      selectedTimes = prefs.getStringList('notificationTimes') ?? [];
    });
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notificationsEnabled', notificationsEnabled);
    await prefs.setStringList('notificationHabits', selectedHabits);
    await prefs.setStringList('notificationTimes', selectedTimes);
  }

  Color _colorFromHex(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse('0x$hex'));
  }

  void _sendTestNotification() {
    // Show in-app dialog as test notification (cross-platform safe)
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(children: const [
          Icon(Icons.notifications_active, color: Color(0xFF1565C0)),
          SizedBox(width: 8),
          Text('Habit Reminder'),
        ]),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text("It's time to work on your habits! 💪",
              style: TextStyle(fontSize: 15)),
          if (selectedHabits.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              'Selected habits:\n${selectedHabits.join(', ')}',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
          ],
          if (selectedTimes.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              'Reminder times: ${selectedTimes.join(', ')}',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
          ],
        ]),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Dismiss'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1565C0),
                foregroundColor: Colors.white),
            child: const Text('Got it!'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Enable toggle card
            Container(
              decoration: BoxDecoration(
                color: notificationsEnabled
                    ? const Color(0xFF1565C0).withOpacity(0.08)
                    : Colors.grey.shade50,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: notificationsEnabled
                      ? const Color(0xFF1565C0).withOpacity(0.3)
                      : Colors.grey.shade200,
                ),
              ),
              child: SwitchListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                title: const Text('Enable Notifications',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                subtitle: Text(
                  notificationsEnabled
                      ? 'You will receive habit reminders'
                      : 'Turn on to get habit reminders',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                secondary: Icon(
                  notificationsEnabled
                      ? Icons.notifications_active
                      : Icons.notifications_off_outlined,
                  color: notificationsEnabled
                      ? const Color(0xFF1565C0)
                      : Colors.grey,
                ),
                value: notificationsEnabled,
                activeColor: const Color(0xFF1565C0),
                onChanged: (v) {
                  setState(() => notificationsEnabled = v);
                  _save();
                },
              ),
            ),

            const SizedBox(height: 24),
            _sectionTitle('Select Habits to Track', Icons.track_changes),
            const SizedBox(height: 10),

            allHabitsMap.isEmpty
                ? Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(children: [
                      Icon(Icons.info_outline, color: Colors.grey.shade400),
                      const SizedBox(width: 8),
                      Text('No habits configured yet.',
                          style: TextStyle(color: Colors.grey.shade500)),
                    ]),
                  )
                : Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: allHabitsMap.entries.map((entry) {
                      final habit = entry.key;
                      final color = _colorFromHex(entry.value);
                      final isSelected = selectedHabits.contains(habit);
                      return FilterChip(
                        label: Text(habit),
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : color,
                          fontWeight: FontWeight.w600,
                        ),
                        selected: isSelected,
                        selectedColor: color,
                        backgroundColor: color.withOpacity(0.1),
                        side: BorderSide(
                            color: isSelected ? color : color.withOpacity(0.4),
                            width: 1.5),
                        checkmarkColor: Colors.white,
                        onSelected: (v) {
                          setState(() {
                            v
                                ? selectedHabits.add(habit)
                                : selectedHabits.remove(habit);
                          });
                          _save();
                        },
                      );
                    }).toList(),
                  ),

            const SizedBox(height: 24),
            _sectionTitle('Reminder Times', Icons.schedule),
            const SizedBox(height: 10),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _timeSlots.map((time) {
                final isSelected = selectedTimes.contains(time);
                final icons = {
                  'Morning': Icons.wb_sunny_outlined,
                  'Afternoon': Icons.wb_cloudy_outlined,
                  'Evening': Icons.nights_stay_outlined,
                };
                return FilterChip(
                  avatar: Icon(icons[time],
                      size: 18,
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFF1565C0)),
                  label: Text(time),
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFF1565C0),
                    fontWeight: FontWeight.w600,
                  ),
                  selected: isSelected,
                  selectedColor: const Color(0xFF1565C0),
                  backgroundColor:
                      const Color(0xFF1565C0).withOpacity(0.08),
                  side: BorderSide(
                      color: const Color(0xFF1565C0).withOpacity(0.3)),
                  checkmarkColor: Colors.white,
                  onSelected: (v) {
                    setState(() {
                      v
                          ? selectedTimes.add(time)
                          : selectedTimes.remove(time);
                    });
                    _save();
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 36),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: _sendTestNotification,
                icon: const Icon(Icons.send_outlined),
                label: const Text('Send Test Notification',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1565C0),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                kIsWeb
                    ? 'Running on web — showing in-app notification dialog'
                    : 'Tap the button above to test your notification',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, IconData icon) {
    return Row(children: [
      Icon(icon, color: const Color(0xFF1565C0), size: 20),
      const SizedBox(width: 6),
      Text(title,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color(0xFF1565C0))),
    ]);
  }
}