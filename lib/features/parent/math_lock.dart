import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/candy_button.dart';

/// A simple "What is X + Y?" gate that keeps young children out of the
/// parent area by accident.
class MathLock extends StatefulWidget {
  const MathLock({super.key, required this.onUnlocked});

  final VoidCallback onUnlocked;

  @override
  State<MathLock> createState() => _MathLockState();
}

class _MathLockState extends State<MathLock> {
  late int _a;
  late int _b;
  final _controller = TextEditingController();
  String? _error;

  @override
  void initState() {
    super.initState();
    _newQuestion();
  }

  void _newQuestion() {
    final rng = Random();
    _a = 3 + rng.nextInt(7);
    _b = 3 + rng.nextInt(7);
    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _check() {
    final answer = int.tryParse(_controller.text.trim());
    if (answer == _a + _b) {
      widget.onUnlocked();
    } else {
      setState(() {
        _error = "That's not quite right, try again!";
        _newQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Parent Area')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('🔒', style: TextStyle(fontSize: 56)),
              const SizedBox(height: 16),
              Text(
                'Grown-ups only!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'What is $_a + $_b?',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 160,
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  autofocus: true,
                  onSubmitted: (_) => _check(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              if (_error != null) ...[
                const SizedBox(height: 8),
                Text(_error!, style: const TextStyle(color: AppColors.error)),
              ],
              const SizedBox(height: 20),
              CandyButton(onPressed: _check, child: const Text('Enter')),
            ],
          ),
        ),
      ),
    );
  }
}
