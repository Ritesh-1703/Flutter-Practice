int factorial(int n) {
  if(n<=0){
    return 1;
  } else {
    return n * factorial(n - 1);
  }
}

//fibonacci series

List<int> fibonacci(int n) {
  // Your code here
  List<int> fib = [0, 1];
  for (int i = 2; i < n; i++) {
    fib.add(fib[i - 1] + fib[i - 2]);
  }
  return fib.sublist(0, n);
}

void main(){
  int number = 5;
print("Factorial of $number is ${factorial(number)}");

//fibonacci
print("6. Fibonacci (first 10): ${fibonacci(10)}");
}