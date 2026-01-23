// ============================================
// DART VARIABLES & DATA TYPES
// ============================================

void main() {
  print("=== VARIABLE BASICS ===");
  
  // 1. VAR - Type is inferred
  var name = "John";  // Dart knows it's String
  print("var name = $name");  // Output: John
  
  // 2. DYNAMIC - Can change type
  dynamic dynamicVar = "Hello";
  dynamicVar = 100;  // Now it's int
  dynamicVar = true; // Now it's bool
  print("dynamicVar = $dynamicVar");
  
  // 3. Explicit Type Declaration
  String city = "New York";
  int age = 25;
  double price = 99.99;
  bool isStudent = true;
  
  print("City: $city, Age: $age, Price: $price, Student: $isStudent");
  
  // 4. FINAL - Assigned once at runtime
  final currentTime = DateTime.now();
  print("Final time: $currentTime");
  
  // 5. CONST - Compile-time constant
  const PI = 3.14159;
  const hoursInDay = 24;
  print("PI: $PI, Hours in day: $hoursInDay");
  
  // 6. LATE - Initialize later, but before use
  late String lateName;
  lateName = "Alice"; // Must initialize before using
  print("Late variable: $lateName");
  
  // 7. NULL SAFETY
  String? nullableString; // Can be null
  nullableString = null;
  print("Nullable string: $nullableString");
  
  // 8. Default Values
  int? uninitialized; // null by default
  print("Uninitialized int: $uninitialized");
  
  // 9. Type Inference with Collections
  var fruits = ['Apple', 'Banana', 'Orange']; // List<String>
  var scores = {'Math': 95, 'Science': 88};  // Map<String, int>
  
  print("Fruits: $fruits");
  print("Scores: $scores");
  
  // 10. Type Checking
  print("\n=== TYPE CHECKING ===");
  print("Type of name: ${name.runtimeType}");
  print("Type of age: ${age.runtimeType}");
  
  // 11. Type Conversion
  String numberString = "123";
  int convertedNumber = int.parse(numberString);
  print("Converted: $convertedNumber");
  
  // 12. String Interpolation
  String fullName = "$name Doe";
  String description = "My name is $fullName and I'm ${age + 5} years old in 5 years";
  print(description);
  
  // 13. Multiple Variables
  var (x, y, z) = (10, 20, 30); // Record pattern (Dart 3.0+)
  print("x=$x, y=$y, z=$z");
}