// ============================================
// DART OBJECT-ORIENTED PROGRAMMING
// ============================================

void main() {
  print("=== CLASSES & OBJECTS ===");
  
  // Creating objects
  Person person1 = Person("Alice", 25);
  person1.introduce();
  
  // Using named constructor
  Person student = Person.student("Bob", 20, "Computer Science");
  student.introduce();
  
  print("\n=== INHERITANCE ===");
  Student collegeStudent = Student("Charlie", 22, "MIT");
  collegeStudent.introduce();
  collegeStudent.study();
  
  print("\n=== ABSTRACT CLASS ===");
  Shape circle = Circle(5);
  print("Circle area: ${circle.calculateArea()}");
  
  print("\n=== INTERFACE ===");
  Phone iphone = SmartPhone();
  iphone.call("1234567890");
  iphone.sendMessage("Hello!");
  
  print("\n=== MIXINS ===");
  Developer dev = Developer("David", 30, "Flutter");
  dev.work();
  dev.code();
  debug();
  
  print("\n=== STATIC MEMBERS ===");
  print("Company name: ${Company.name}");
  Company.displayInfo();
  
  print("\n=== GETTERS & SETTERS ===");
  BankAccount account = BankAccount(1000);
  print("Balance: \$${account.balance}");
  account.balance = 1500; // Using setter
  print("New Balance: \$${account.balance}");
}

// ========== 1. BASIC CLASS ==========
class Person {
  // Properties
  String name;
  int age;
  
  // Constructor
  Person(this.name, this.age);
  
  // Named Constructor
  Person.student(this.name, this.age, String course) {
    print("$name is a $course student");
  }
  
  // Method
  void introduce() {
    print("Hello, I'm $name and I'm $age years old");
  }
}

// ========== 2. INHERITANCE ==========
class Student extends Person {
  String university;
  
  Student(String name, int age, this.university) : super(name, age);
  
  @override
  void introduce() {
    print("I'm $name, $age years old, studying at $university");
  }
  
  void study() {
    print("$name is studying hard!");
  }
}

// ========== 3. ABSTRACT CLASS ==========
abstract class Shape {
  double calculateArea();
}

class Circle implements Shape {
  double radius;
  
  Circle(this.radius);
  
  @override
  double calculateArea() {
    return 3.14159 * radius * radius;
  }
}

// ========== 4. INTERFACE ==========
abstract class Phone {
  void call(String number);
}

abstract class Messenger {
  void sendMessage(String text);
}

// Implementing multiple interfaces
class SmartPhone implements Phone, Messenger {
  @override
  void call(String number) {
    print("Calling $number...");
  }
  
  @override
  void sendMessage(String text) {
    print("Sending message: $text");
  }
}

// ========== 5. MIXINS ==========
mixin Coder {
  void code() {
    print("Writing code...");
  }
}

mixin Debugger {
  void debug() {
    print("Debugging...");
  }
}

class Developer extends Person with Coder, Debugger {
  String language;
  
  Developer(String name, int age, this.language) : super(name, age);
  
  void work() {
    print("$name is working with $language");
  }
}

// ========== 6. STATIC MEMBERS ==========
class Company {
  static String name = "TechCorp";
  static int employeeCount = 100;
  
  static void displayInfo() {
    print("Company: $name, Employees: $employeeCount");
  }
}

// ========== 7. GETTERS & SETTERS ==========
class BankAccount {
  double _balance; // Private variable
  
  BankAccount(this._balance);
  
  // Getter
  double get balance => _balance;
  
  // Setter with validation
  set balance(double value) {
    if (value >= 0) {
      _balance = value;
      print("Balance updated");
    } else {
      print("Invalid balance amount");
    }
  }
}

// ========== 8. ENUM ==========
enum Day { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday }