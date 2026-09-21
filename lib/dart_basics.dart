void main() {
  // Largest of two numbers
  int a = 20;
  int b = 15;

  if (a > b) {
    print('Largest number: $a');
  } else {
    print('Largest number: $b');
  }

  // Rectangle area
  double length = 10;
  double width = 5;
  print('Rectangle area: ${length * width}');

  // Even or odd
  int number = 8;
  if (number % 2 == 0) {
    print('$number is Even');
  } else {
    print('$number is Odd');
  }

  // Factorial
  int n = 5;
  int factorial = 1;

  for (int i = 1; i <= n; i++) {
    factorial *= i;
  }

  print('Factorial of $n: $factorial');

  // Fibonacci series
  int first = 0;
  int second = 1;

  print('Fibonacci series:');

  for (int i = 0; i < 10; i++) {
    print(first);
    int next = first + second;
    first = second;
    second = next;
  }
}