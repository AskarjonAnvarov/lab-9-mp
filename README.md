# Lab 9: Advanced UI Design Techniques

## Author
Asqarjon Anvarov (220050)

## Project Structure
```
lab-9/
├── lib/
│   └── main.dart          # Main application file with all tasks
├── pubspec.yaml           # Dependencies configuration
└── README.md              # This file
```

## Tasks Implementation

### Task 1: Understanding Widgets (5 points)
- ✅ Uses Container, Row, Column, and Wrap widgets
- ✅ Displays at least 4 colored boxes arranged using these widgets
- Shows examples of each layout widget with colored containers

### Task 2: Custom Stateless Widget (5 points)
- ✅ Created reusable `CustomTitle` widget
- ✅ Displays text in bold, size 24
- ✅ Accepts text and color parameters
- ✅ Used in multiple places throughout the app

### Task 3: Custom Stateful Widget (10 points)
- ✅ Created `CustomCounter` widget
- ✅ Displays a counter with + and - buttons
- ✅ Uses internal state (setState) to update the counter

### Task 4: Combining Custom Widgets (7 points)
- ✅ Created simple homepage
- ✅ Uses both CustomTitle and CustomCounter
- ✅ Arranged using Column and Center widgets

### Task 5: Implicit Animation (10 points)
- ✅ Created AnimatedContainer
- ✅ Changes color, size, and border radius when tapped
- ✅ Smooth animations with duration and curves

### Task 6: Explicit Animation (12 points)
- ✅ Built widget that moves Flutter logo across the screen
- ✅ Uses AnimationController and Tween
- ✅ Runs animation on button press
- ✅ Can reverse and replay animation

### Task 7: GestureDetector Practice (8 points)
- ✅ Uses GestureDetector to detect:
  - Single tap → Changes background to blue
  - Double tap → Changes background to green
  - Long press → Changes background to orange
- ✅ Changes background color based on gesture type

### Task 8: Themed App (10 points)
- ✅ Created light and dark themes using ThemeData
- ✅ Added toggle Switch to switch between modes
- ✅ Theme persists across the app

### Task 9: AnimatedList Practice (10 points)
- ✅ Implemented AnimatedList
- ✅ Adds new item when button is pressed
- ✅ Animates the insertion with smooth transitions
- ✅ Can remove items with animation

### Task 10: Mini Project - Themed Interactive UI (20 points)
- ✅ Combined everything:
  - Custom widgets (CustomTitle, CustomCounter)
  - Gesture animations
  - App themes
  - AnimatedContainer
  - Explicit animations
- ✅ Created visually appealing home screen

## Features

### Custom Widgets
- **CustomTitle**: Reusable stateless widget for styled titles
- **CustomCounter**: Stateful widget with increment/decrement functionality

### Animations
- **Implicit**: AnimatedContainer with smooth transitions
- **Explicit**: AnimationController with Tween for logo movement
- **List**: AnimatedList for smooth insertions/deletions

### Gestures
- Single tap detection
- Double tap detection
- Long press detection

### Themes
- Light theme
- Dark theme
- Toggle switch to switch between themes

## How to Run

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Run the app:
   ```bash
   flutter run
   ```

## Navigation

The app includes a home screen that navigates to each task:
- Task 1: Understanding Widgets
- Task 2: Custom Stateless Widget
- Task 3: Custom Stateful Widget
- Task 4: Combining Custom Widgets
- Task 5: Implicit Animation
- Task 6: Explicit Animation
- Task 7: GestureDetector Practice
- Task 8: Themed App
- Task 9: AnimatedList Practice
- Task 10: Mini Project

## Code Highlights

### Custom Widget Example
```dart
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
```

### Animation Example
```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 500),
  width: _isTapped ? 250 : 150,
  height: _isTapped ? 250 : 150,
  decoration: BoxDecoration(
    color: _isTapped ? Colors.purple : Colors.blue,
    borderRadius: BorderRadius.circular(_isTapped ? 50 : 12),
  ),
)
```

