**This readme is not yet finished**

# Assembly Project - `Array Game`
## By [Yehonatan Gurfinkel](https://github.com/yehogdev)
⠀
* Yeshivat bnei akiva givat shmuel, 10th Grade **(י'2)**.⠀
* **Teacher**: My amazing teacher Barak suberri.⠀
* **Year of submission**: 2023.  
⠀
>The purpose of the program is to find the missing number from a list of numbers.
>The program removes a random element from an array with k elements and then finds it.
>Afterwards, the program displays to the user whether the missing number is prime or composite.

⠀
## How does the algorithm work?  
  
  
At first, the program, creates an array called Array1 with a length of k elements and an array called Array2 with a length of k-1 elements.  

In the code I have provided, k=15, but in reality, the code works for any natural number where 1 < k < 20.  
  
The first thing the code does is to define the Array1.  
  
The array will look like this:
⠀
|⠀ 1 ⠀|⠀ 2 ⠀| ⠀3 ⠀ |⠀4⠀|⠀5⠀|⠀...⠀|⠀k⠀|
| - | - | - | - | - | - | - |  
  
  
After Array1 is definded, it will print the message:
```
Here is Array2: 
```

⠀
#### Afterwards, the program will perform the following steps:  
  
1. It will generate a random number in the range of 0-15.  
  
  
2. It will add the number to the offset of Array1. Now it has the memory location of a random element in Array1. It will store it's value in the AH register.  
  
  
3. It will copy the value of the chosen random element into the AL register.  
  
  
4. It will enter the value of the random element into the last empty element of array2.  
  
  
5. It will take the last element in Array1 and copy its value to the position (in Array1) where the random element is.  
  
  
6. It will print the random number to the console.  
  
  
7. It will add the value of the random element to the variable sum.  
  
  
8. Once it finish, it will shorten Array1 by one element and repeat steps 1-8 until only one element remains in Array1.  
  
⠀
  
> **Note:** I'm not actually shortening the array. Instead, I simply decrease by one the register that holds the length of the array, effectively ignoring all elements beyond the boundary.  
⠀
  
After the program finishes with Array2, it calculates the sum of Array1 using the formula for an arithmetic sequence with a first element of 1 and a common difference of 1, where the number of elements is k:  
  
```
( 2 * 1 + (k - 1) ) * 0.5k = ( ( k + 1 ) * k ) / 0.5
```  
⠀
   
Then the program subtracts the value of the variable "sum" from the calculated sum. The difference is the missing element, which the program prints.  
  
```sh
The missing number is: 
```  
⠀
  
Next, the program checks whether the result is prime or composite and prints the conclusion.  
More details about the printing functions and the function that checks if a number is prime can be found below.  
⠀
⠀
## Run example
⠀
Here is an example of the algorithm for **k = 4**:

| Array1: |⠀⠀⠀|⠀⠀⠀|⠀⠀⠀|⠀⠀⠀|
| :-----: | :-----: | :-----: | :-----: | :-----: |
| **Array2:** |⠀  ⠀|⠀ ⠀| ⠀

The first thing the algorithm does is to set Array1:

| Array1: |⠀1⠀|⠀2⠀|⠀3⠀|⠀4⠀|
| :-----: | :-----: | :-----: | :-----: | :-----: |
| **Array2:** |⠀  ⠀|⠀ ⠀| ⠀

Then it chooses a random number from Array1. The chosen number is 3.
Now it copies the last element of Array1 and replaces the chosen number (3) with this element:

| Array1: |⠀1⠀|⠀2⠀|⠀4⠀|⠀4⠀|
| :-----: | :-----: | :-----: | :-----: | :-----: |
| **Array2:** |⠀  ⠀|⠀ ⠀| ⠀

Now it puts the chosen random element (3) at the last empty element of Array2:

| Array1: |⠀1⠀|⠀2⠀|⠀4⠀|⠀4⠀|
| :-----: | :-----: | :-----: | :-----: | :-----: |
| **Array2:** | | | 3|

Now it prints "3" and adds 3 to sum (now "sum" = 3). Then it shortens Array1 by 1 element.
Then it chooses a random number from Array1. The chosen number is 1.
Now it copies the last element of Array1 and replaces the chosen number (1) with this element:

| Array1: |⠀4⠀|⠀2⠀|⠀4⠀| ⠀⠀⠀|
| :-----: | :-----: | :-----: | :-----: | :-----: |
| **Array2:** | | | 3|

Now it puts the chosen random element (1) at the last empty element of Array2:

| Array1: |⠀4⠀|⠀2⠀|⠀4⠀| ⠀⠀⠀|
| :-----: | :-----: | :-----: | :-----: | :-----: |
| **Array2:** | | 1|3 |

Now it prints "1" and adds 1 to sum (now "sum" = 4). Then it shortens Array1 by 1 element.
Then it chooses a random number from Array1. The chosen number is 4.
Now it copies the last element of Array1 and replaces the chosen number (4) with this element:

| Array1: |⠀2⠀|⠀2⠀|⠀  ⠀⠀| ⠀⠀⠀|
| :-----: | :-----: | :-----: | :-----: | :-----: |
| **Array2:** | | 1|3 |

Now it puts the chosen random element (4) at the last empty element of Array2:

| Array1: |⠀4⠀|⠀2⠀|⠀⠀⠀|⠀ ⠀⠀
| :-----: | :-----: | :-----: | :-----: | :-----: |
| **Array2:** |4 | 1|3|

Now it prints "4" and adds 4 to sum (now "sum" = 8). Then it shortens Array1 by 1 element.

| Array1: |⠀2⠀|⠀⠀⠀|⠀⠀⠀| ⠀⠀⠀|   
| :-----: | :-----: | :-----: | :-----: | :-----: |
| **Array2:** |4 | 1|3 |

Now it calculates the sum of Array1:
```
1 + 2 + 3 + 4 = 10
```

The missing number is 10-sum which is:
```
10 - 8 = 2
```

It will print:
```
The missing number is: 2.
```
Last thing we do is to loop all the natural numbers that are lower then the missing number and check if the number is divisivle by them with the reminder of zero.
2 doesn't have such numbers therefore it is **prime**.
```
And it is a prime number!
```

##### click here to jump into run images.
⠀
⠀
## Variables

Here are all the variables in the code, their names, their values, and their goal in the code:

| Variable | Value | Goal |
| :-----: | :-----: | :-----: |
| k | 15d (or any other natural value between 1 and 20 excluding) | The number of elements in Array1. |
| array2 | k-1 elements	| The array without the missing element. |
| array1 | k elements | The array with the missing element. |
| sum | Initial value: 0 | This variable stores the sum of Array2. |
| arrMsg | 'Here is Array2: ', '$' | The message displayed before displaying Array2. |
| eleMsg | ', ', '$' | The comma between each number when displaying Array2. |
| endMsg | 13,10,'The missing number is: ', '$' | The message displaying the missing number. |
| primeMsg | 13,10,'And it is a prime number!', '$' | A message if the number is prime.|
| compMsg | 13,10,'And it is a composite number!', '$'   | A Message if the number is composite. |
⠀
⠀
## Procedures
Here are all the procedures in the code, their parameters, their processes, and their return values:

### SetArray1
* **Input:** The offset of the array, and the size of the array.
* **Proccess:** The procedure goes in every element of the array one by one and sets their values: 1,2,3,4..     
* **Output:** Array1 will now be: { 1,2,3,4,5...k }

### Random
* **Input:** No input.
* **Proccess:** This procedure uses the function we have learnt to generate a random number between 0-15.        
* **Output:** The register dl will hold a random value between 0-15.

### PrintNumber
* **Input:** A two digit decimal value.
* **Proccess:** The procedure compares the number to 10. If it is lower then 10 (0-9) it prints the digit. If it is higher or equal two 10, the procedure prints "1" and then subtract 10 from it and prints the digit.
* **Output:** The value of the input number is printed to the screen.

### IsPrime:
* **Input:** A decimal number.
* **Proccess:** The procedure loops throguh every integer that is smaller then the number and check if the number is divisble by it. If it is - it is not prime. If the procedure goed through all the numbers except "1" and none of them were divisble - it is a prime.    
* **Output:** Prints "And it is a prime number!" if it is prime or "And it is a composite number!" if it is not.  
⠀
⠀
## Run images

