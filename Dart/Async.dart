// ============================================
// DART ASYNCHRONOUS PROGRAMMING
// ============================================

import 'dart:async';

void main() async {
  print("=== ASYNC/AWAIT BASICS ===");
  
  // 1. Basic async/await
  await fetchUserData();
  
  print("\n=== FUTURES ===");
  
  // 2. Handling Futures
  getOrder()
    .then((value) => print("Order received: $value"))
    .catchError((error) => print("Error: $error"))
    .whenComplete(() => print("Order process completed"));
  
  // 3. Multiple async operations
  await processMultipleTasks();
  
  print("\n=== STREAMS ===");
  
  // 4. Working with Streams
  await countNumbers();
  
  print("\n=== REAL-WORLD EXAMPLE ===");
  
  // 5. API Call Simulation
  try {
    var user = await fetchUserFromAPI();
    print("User fetched: ${user.name}, ${user.email}");
    
    var posts = await fetchUserPosts(user.id);
    print("User has ${posts.length} posts");
    
  } catch (e) {
    print("Error: $e");
  }
}

// ========== 1. BASIC ASYNC FUNCTION ==========
Future<void> fetchUserData() async {
  print("Fetching user data...");
  
  // Simulate network delay
  await Future.delayed(Duration(seconds: 1));
  
  print("User data fetched successfully!");
}

// ========== 2. FUTURE WITH RETURN VALUE ==========
Future<String> getOrder() async {
  await Future.delayed(Duration(seconds: 2));
  
  // Simulate random success/failure
  bool isSuccess = DateTime.now().second % 2 == 0;
  
  if (isSuccess) {
    return "Pizza Order #123";
  } else {
    throw Exception("Order failed: Out of stock");
  }
}

// ========== 3. MULTIPLE ASYNC OPERATIONS ==========
Future<void> processMultipleTasks() async {
  print("Starting multiple tasks...");
  
  // Sequential execution
  var task1 = await doTask("Task 1", 1);
  var task2 = await doTask("Task 2", 2);
  
  print("Sequential result: $task1, $task2");
  
  // Parallel execution
  var future1 = doTask("Parallel Task 1", 2);
  var future2 = doTask("Parallel Task 2", 3);
  var future3 = doTask("Parallel Task 3", 1);
  
  var results = await Future.wait([future1, future2, future3]);
  print("Parallel results: $results");
  
  // Error handling in parallel
  try {
    await Future.wait([
      doTask("Task A", 1),
      Future.error("Simulated error"),
      doTask("Task C", 1),
    ]);
  } catch (e) {
    print("Caught error in parallel: $e");
  }
}

Future<String> doTask(String taskName, int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
  return "$taskName completed in ${seconds}s";
}

// ========== 4. STREAMS ==========
Future<void> countNumbers() async {
  // Create a stream
  Stream<int> numberStream = countStream(5);
  
  // Listen to stream
  numberStream.listen(
    (number) => print("Stream received: $number"),
    onError: (error) => print("Stream error: $error"),
    onDone: () => print("Stream completed!"),
    cancelOnError: false,
  );
  
  // Using await for with streams
  await for (var number in generateNumbers(3)) {
    print("Await for received: $number");
  }
}

// Function that returns a stream
Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(milliseconds: 500));
    
    if (i == 3) {
      // yield* for nested streams
      yield* Stream.fromIterable([30, 31, 32]);
    } else {
      yield i;
    }
  }
}

// Alternative using async* generator
Stream<int> generateNumbers(int count) async* {
  for (int i = 0; i < count; i++) {
    await Future.delayed(Duration(milliseconds: 300));
    yield i * 10;
  }
}

// ========== 5. REAL-WORLD API EXAMPLE ==========
class User {
  final int id;
  final String name;
  final String email;
  
  User(this.id, this.name, this.email);
}

class Post {
  final int id;
  final String title;
  
  Post(this.id, this.title);
}

Future<User> fetchUserFromAPI() async {
  print("Fetching user from API...");
  await Future.delayed(Duration(seconds: 2));
  
  // Simulate API response
  return User(1, "John Doe", "john@example.com");
}

Future<List<Post>> fetchUserPosts(int userId) async {
  print("Fetching posts for user $userId...");
  await Future.delayed(Duration(seconds: 3));
  
  // Simulate API response
  return [
    Post(1, "My First Post"),
    Post(2, "Flutter is Awesome"),
    Post(3, "Dart Tips & Tricks"),
  ];
}

// ========== 6. FUTURE COMPLETERS ==========
Future<String> createCustomFuture() {
  var completer = Completer<String>();
  
  // Simulate some async operation
  Timer(Duration(seconds: 1), () {
    completer.complete("Custom future completed!");
  });
  
  return completer.future;
}

// ========== 7. ERROR HANDLING PATTERNS ==========
Future<String> safeApiCall() async {
  try {
    var data = await fetchData();
    return "Success: $data";
  } on TimeoutException {
    return "Error: Request timed out";
  } on FormatException {
    return "Error: Invalid data format";
  } catch (e) {
    return "Error: $e";
  } finally {
    print("API call attempted");
  }
}

Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return "Data from server";
}
