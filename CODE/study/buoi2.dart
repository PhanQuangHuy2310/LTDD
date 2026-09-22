class Point {
  num x;
  num y;

  Point(this.x, this.y);
  Point.json({required this.x, required this.y});
}

bool test(int a, int b) {
  return a > b;
}

test2(a, b) => a > b;

bool? test3([int? a, int? b]) {
  if (a == null || b == null) {
    return null;
  }
  return a < b;
}

void main() {
  // ... your existing main code works perfectly ...
  print("lesson 3");
  print(test(5, 6));

  var p2 = Point.json(x: 21, y: 12);
  print("p2 coordinates: ${p2.x}, ${p2.y}");

  // Let's test your new Student class!
  var student1 = Student(101, "Alice", "Hanoi");

  // Using the setter
  student1.studentPoint = 95;

  // Calling your normal function
  student1.printPoint();
}

class Student {
  int? _SSID;
  String? _NameS;
  String? _Location;
  int? _Point;
  // Constructor
  Student(this._SSID, this._NameS, this._Location);
  // Getter for NameS
  String? get name => _NameS;
  // Getter for Point
  int? get studentPoint => _Point;
  // Setter for Point
  set studentPoint(int? value) {
    _Point = value;
  }
  // normal function
  void printPoint() {
    print("Student's point is: $_Point");
  }
}