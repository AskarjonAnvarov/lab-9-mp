// Lab 9: Advanced UI Design Techniques
// Abdusamad Nigmatov
// 220063

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 9 - Advanced UI Design',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        '/widgets': (context) => const WidgetsDemoScreen(),
        '/custom-title': (context) => const CustomTitleScreen(),
        '/custom-counter': (context) => const CustomCounterScreen(),
        '/combined': (context) => const CombinedWidgetsScreen(),
        '/animated-container': (context) => const AnimatedContainerScreen(),
        '/explicit-animation': (context) => const ExplicitAnimationScreen(),
        '/gestures': (context) => const GestureDetectorScreen(),
        '/themed': (context) => const ThemedAppScreen(),
        '/animated-list': (context) => const AnimatedListScreen(),
        '/mini-project': (context) => const MiniProjectScreen(),
      },
    );
  }
}

// ============================================================================
// HOME SCREEN - Navigation to all tasks
// ============================================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 9 - Advanced UI Design'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const CustomTitle(text: 'Lab 9 Tasks', color: Colors.blue),
          const SizedBox(height: 20),
          _buildTaskButton(context, 'Task 1: Understanding Widgets', '/widgets'),
          _buildTaskButton(context, 'Task 2: Custom Stateless Widget', '/custom-title'),
          _buildTaskButton(context, 'Task 3: Custom Stateful Widget', '/custom-counter'),
          _buildTaskButton(context, 'Task 4: Combining Custom Widgets', '/combined'),
          _buildTaskButton(context, 'Task 5: Implicit Animation', '/animated-container'),
          _buildTaskButton(context, 'Task 6: Explicit Animation', '/explicit-animation'),
          _buildTaskButton(context, 'Task 7: GestureDetector Practice', '/gestures'),
          _buildTaskButton(context, 'Task 8: Themed App', '/themed'),
          _buildTaskButton(context, 'Task 9: AnimatedList Practice', '/animated-list'),
          _buildTaskButton(context, 'Task 10: Mini Project', '/mini-project'),
        ],
      ),
    );
  }

  Widget _buildTaskButton(BuildContext context, String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, route),
        child: Text(title),
      ),
    );
  }
}

// ============================================================================
// TASK 2: Custom Stateless Widget - CustomTitle
// ============================================================================

class CustomTitle extends StatelessWidget {
  final String text;
  final Color color;

  const CustomTitle({
    super.key,
    required this.text,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

// ============================================================================
// TASK 3: Custom Stateful Widget - CustomCounter
// ============================================================================

class CustomCounter extends StatefulWidget {
  const CustomCounter({super.key});

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Counter',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            '$_counter',
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: _decrement,
                heroTag: 'decrement',
                child: const Icon(Icons.remove),
              ),
              const SizedBox(width: 20),
              FloatingActionButton(
                onPressed: _increment,
                heroTag: 'increment',
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// TASK 1: Understanding Widgets Screen
// ============================================================================

class WidgetsDemoScreen extends StatelessWidget {
  const WidgetsDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 1: Understanding Widgets'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTitle(text: 'Container Widget', color: Colors.blue),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'This is a Container',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const CustomTitle(text: 'Row Widget', color: Colors.green),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildColoredBox(Colors.red, 'Box 1'),
                _buildColoredBox(Colors.green, 'Box 2'),
                _buildColoredBox(Colors.blue, 'Box 3'),
                _buildColoredBox(Colors.orange, 'Box 4'),
              ],
            ),
            const SizedBox(height: 30),
            const CustomTitle(text: 'Column Widget', color: Colors.orange),
            const SizedBox(height: 10),
            Column(
              children: [
                _buildColoredBox(Colors.purple, 'Box 1'),
                const SizedBox(height: 10),
                _buildColoredBox(Colors.teal, 'Box 2'),
                const SizedBox(height: 10),
                _buildColoredBox(Colors.pink, 'Box 3'),
                const SizedBox(height: 10),
                _buildColoredBox(Colors.indigo, 'Box 4'),
              ],
            ),
            const SizedBox(height: 30),
            const CustomTitle(text: 'Wrap Widget', color: Colors.purple),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildColoredBox(Colors.amber, '1'),
                _buildColoredBox(Colors.cyan, '2'),
                _buildColoredBox(Colors.deepOrange, '3'),
                _buildColoredBox(Colors.lime, '4'),
                _buildColoredBox(Colors.brown, '5'),
                _buildColoredBox(Colors.grey, '6'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColoredBox(Color color, String label) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// TASK 2: Custom Title Screen
// ============================================================================

class CustomTitleScreen extends StatelessWidget {
  const CustomTitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 2: Custom Stateless Widget'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Using CustomTitle widget in multiple places:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const CustomTitle(text: 'This is a Blue Title', color: Colors.blue),
            const SizedBox(height: 20),
            const CustomTitle(text: 'This is a Red Title', color: Colors.red),
            const SizedBox(height: 20),
            const CustomTitle(text: 'This is a Green Title', color: Colors.green),
            const SizedBox(height: 20),
            const CustomTitle(text: 'This is a Purple Title', color: Colors.purple),
            const SizedBox(height: 30),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTitle(text: 'Inside a Card', color: Colors.orange),
                    const SizedBox(height: 10),
                    const Text('The CustomTitle widget is reusable and accepts text and color parameters.'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// TASK 3: Custom Counter Screen
// ============================================================================

class CustomCounterScreen extends StatelessWidget {
  const CustomCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 3: Custom Stateful Widget'),
      ),
      body: const Center(
        child: CustomCounter(),
      ),
    );
  }
}

// ============================================================================
// TASK 4: Combining Custom Widgets Screen
// ============================================================================

class CombinedWidgetsScreen extends StatelessWidget {
  const CombinedWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 4: Combining Custom Widgets'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTitle(text: 'Welcome to the Homepage', color: Colors.blue),
            const SizedBox(height: 40),
            const CustomCounter(),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// TASK 5: AnimatedContainer Screen
// ============================================================================

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() => _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  bool _isTapped = false;

  void _toggleAnimation() {
    setState(() {
      _isTapped = !_isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 5: Implicit Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTitle(text: 'Tap the container to animate!', color: Colors.purple),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: _toggleAnimation,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                width: _isTapped ? 250 : 150,
                height: _isTapped ? 250 : 150,
                decoration: BoxDecoration(
                  color: _isTapped ? Colors.purple : Colors.blue,
                  borderRadius: BorderRadius.circular(_isTapped ? 50 : 12),
                  boxShadow: [
                    BoxShadow(
                      color: (_isTapped ? Colors.purple : Colors.blue).withOpacity(0.5),
                      blurRadius: _isTapped ? 20 : 10,
                      spreadRadius: _isTapped ? 5 : 2,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Tap Me!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _toggleAnimation,
              child: const Text('Or Click Button to Animate'),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// TASK 6: Explicit Animation Screen
// ============================================================================

class ExplicitAnimationScreen extends StatefulWidget {
  const ExplicitAnimationScreen({super.key});

  @override
  State<ExplicitAnimationScreen> createState() => _ExplicitAnimationScreenState();
}

class _ExplicitAnimationScreenState extends State<ExplicitAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(1.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void _startAnimation() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 6: Explicit Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTitle(text: 'Moving Flutter Logo', color: Colors.blue),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: SlideTransition(
                position: _animation,
                child: const Center(
                  child: FlutterLogo(size: 100),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: _startAnimation,
              icon: const Icon(Icons.play_arrow),
              label: const Text('Run Animation'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// TASK 7: GestureDetector Screen
// ============================================================================

class GestureDetectorScreen extends StatefulWidget {
  const GestureDetectorScreen({super.key});

  @override
  State<GestureDetectorScreen> createState() => _GestureDetectorScreenState();
}

class _GestureDetectorScreenState extends State<GestureDetectorScreen> {
  Color _backgroundColor = Colors.white;
  String _lastGesture = 'No gesture detected';

  void _onSingleTap() {
    setState(() {
      _backgroundColor = Colors.blue;
      _lastGesture = 'Single Tap';
    });
  }

  void _onDoubleTap() {
    setState(() {
      _backgroundColor = Colors.green;
      _lastGesture = 'Double Tap';
    });
  }

  void _onLongPress() {
    setState(() {
      _backgroundColor = Colors.orange;
      _lastGesture = 'Long Press';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 7: GestureDetector Practice'),
      ),
      body: GestureDetector(
        onTap: _onSingleTap,
        onDoubleTap: _onDoubleTap,
        onLongPress: _onLongPress,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          height: double.infinity,
          color: _backgroundColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomTitle(
                  text: 'Gesture Detection',
                  color: Colors.black87,
                ),
                const SizedBox(height: 30),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Icon(
                          _lastGesture == 'Single Tap'
                              ? Icons.touch_app
                              : _lastGesture == 'Double Tap'
                                  ? Icons.touch_app_outlined
                                  : _lastGesture == 'Long Press'
                                      ? Icons.touch_app_rounded
                                      : Icons.gesture,
                          size: 60,
                          color: _backgroundColor,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Last Gesture: $_lastGesture',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Try these gestures:',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text('• Single Tap → Blue'),
                        Text('• Double Tap → Green'),
                        Text('• Long Press → Orange'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// TASK 8: Themed App Screen
// ============================================================================

class ThemedAppScreen extends StatefulWidget {
  const ThemedAppScreen({super.key});

  @override
  State<ThemedAppScreen> createState() => _ThemedAppScreenState();
}

class _ThemedAppScreenState extends State<ThemedAppScreen> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Themed App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Task 8: Themed App'),
          actions: [
            Switch(
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _isDarkMode ? Icons.dark_mode : Icons.light_mode,
                size: 100,
                color: _isDarkMode ? Colors.amber : Colors.orange,
              ),
              const SizedBox(height: 30),
              Text(
                _isDarkMode ? 'Dark Mode' : 'Light Mode',
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        'Theme Toggle',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      SwitchListTile(
                        title: Text(_isDarkMode ? 'Dark Mode ON' : 'Light Mode ON'),
                        value: _isDarkMode,
                        onChanged: (value) {
                          setState(() {
                            _isDarkMode = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// TASK 9: AnimatedList Screen
// ============================================================================

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({super.key});

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _items = [];
  int _counter = 0;

  void _addItem() {
    final index = _items.length;
    final item = 'Item ${++_counter}';
    _items.add(item);
    _listKey.currentState?.insertItem(
      index,
      duration: const Duration(milliseconds: 500),
    );
  }

  void _removeItem(int index) {
    if (index < _items.length) {
      final item = _items.removeAt(index);
      _listKey.currentState?.removeItem(
        index,
        (context, animation) => _buildRemovedItem(item, animation),
        duration: const Duration(milliseconds: 500),
      );
    }
  }

  Widget _buildRemovedItem(String item, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: SizeTransition(
        sizeFactor: animation,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text(item),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 9: AnimatedList Practice'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTitle(text: 'Animated List', color: Colors.blue),
                ElevatedButton.icon(
                  onPressed: _addItem,
                  icon: const Icon(Icons.add),
                  label: const Text('Add Item'),
                ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _items.length,
              itemBuilder: (context, index, animation) {
                return _buildItem(_items[index], index, animation);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String item, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListTile(
          title: Text(item),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => _removeItem(index),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// TASK 10: Mini Project - Themed Interactive UI
// ============================================================================

class MiniProjectScreen extends StatefulWidget {
  const MiniProjectScreen({super.key});

  @override
  State<MiniProjectScreen> createState() => _MiniProjectScreenState();
}

class _MiniProjectScreenState extends State<MiniProjectScreen>
    with SingleTickerProviderStateMixin {
  bool _isDarkMode = false;
  bool _isContainerTapped = false;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  Color _gestureColor = Colors.blue;
  String _gestureText = 'Tap to change color';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-0.5, 0.0),
      end: const Offset(0.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  void _toggleContainer() {
    setState(() {
      _isContainerTapped = !_isContainerTapped;
    });
  }

  void _onGesture(Color color, String text) {
    setState(() {
      _gestureColor = color;
      _gestureText = text;
    });
  }

  void _startLogoAnimation() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: const CustomTitle(
            text: 'Mini Project',
            color: Colors.white,
          ),
          actions: [
            Switch(
              value: _isDarkMode,
              onChanged: (_) => _toggleTheme(),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomTitle(
                text: 'Themed Interactive UI',
                color: Colors.blue,
              ),
              const SizedBox(height: 30),
              // Custom Counter
              const CustomCounter(),
              const SizedBox(height: 30),
              // Animated Container
              GestureDetector(
                onTap: _toggleContainer,
                onDoubleTap: () => _onGesture(Colors.green, 'Double Tap'),
                onLongPress: () => _onGesture(Colors.orange, 'Long Press'),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: 150,
                  decoration: BoxDecoration(
                    color: _gestureColor,
                    borderRadius: BorderRadius.circular(_isContainerTapped ? 30 : 12),
                  ),
                  child: Center(
                    child: Text(
                      _gestureText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Explicit Animation
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SlideTransition(
                  position: _slideAnimation,
                  child: const Center(
                    child: FlutterLogo(size: 80),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _startLogoAnimation,
                icon: const Icon(Icons.play_arrow),
                label: const Text('Animate Logo'),
              ),
              const SizedBox(height: 30),
              // Theme Info Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const CustomTitle(
                        text: 'Features',
                        color: Colors.purple,
                      ),
                      const SizedBox(height: 10),
                      const Text('✓ Custom Title Widget'),
                      const Text('✓ Custom Counter Widget'),
                      const Text('✓ AnimatedContainer'),
                      const Text('✓ Explicit Animation'),
                      const Text('✓ Gesture Detection'),
                      const Text('✓ Theme Toggle'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

