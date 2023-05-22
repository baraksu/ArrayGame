# Assembly Project - `Array Game`
## By [Yehonatan Gurfinkel](https://github.com/yehogdev)  -  יהונתן גורפינקל
⠀
* Yeshivat bnei akiva givat shmuel, 10th Grade **(י'2)**.⠀
* **Teacher**: My amazing teacher Barak suberri.⠀
* **Year of submission**: 2023.  
⠀
>The purpose of the program is to find the missing number from a list of numbers.
>The program removes a random element from an array with k elements and then finds it.
>Afterwards, the program displays to the user whether the missing number is prime or composite.

⠀
⠀
⠀    
  
⠀    
  
## Table of Contents

* ##### [Start](#assembly-project---array-game)
   
* #####  [How does the algorithm work?](#how-does-the-algorithm-work-)
    
* #####  [Run example](#run-example-1)
   
* #####  [Variables](#variables-1)
   
* #####  [Procedures](#procedures-1)
   
* #####  [Run images](#run-images-1)
   
* #####  [Personal experience](#personal-experience-1)
  

⠀
⠀    
  
  ⠀
⠀    
  
## `How does the algorithm work? ` 
⠀
   
At first, the program creates an array called Array1 with a length of k elements and an array called Array2 with a length of k-1 elements.  

In the code I have provided, k=15, but in reality, the code works for any natural number where 1 < k < 20.  
  
The first thing the code does is to define the Array1.  
  
The array will look like this:

⠀
|⠀ 1 ⠀|⠀ 2 ⠀| ⠀3 ⠀ |⠀4⠀|⠀5⠀|⠀...⠀|⠀k⠀|
| - | - | - | - | - | - | - | 



⠀

After Array1 is definded, it will print the message:
```
Here is Array2: 
```

⠀
#### Afterwards, the program will perform the following steps:  
  
⠀
   
1. It will generate a random number in the range of 0-15.  
⠀
   
2. It will add the number to the offset of Array1. Now it has the memory location of a random element in Array1. It will store it's value in the AH register.  
⠀
   
3. It will copy the value of the chosen random element into the AL register.  
⠀
   
4. It will enter the value of the random element into the last empty element of array2.  
⠀
   
5. It will take the last element in Array1 and copy its value to the position (in Array1) where the random element is.  
⠀
   
6. It will print the random number to the console.  
⠀
   
7. It will add the value of the random element to the variable sum.  
⠀
   
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
  
⠀
   
   
## `Run example`  
  
⠀
   
Here is an example of the algorithm for **k = 4**:

| Array1: |⠀⠀⠀|⠀⠀⠀|⠀⠀⠀|⠀⠀⠀|
| :-----: | :-----: | :-----: | :-----: | :-----: |
| **Array2:** |⠀  ⠀|⠀ ⠀| ⠀

  
⠀
   

The first thing the algorithm does is to set Array1:

| Array1: |⠀1⠀|⠀2⠀|⠀3⠀|⠀4⠀|
| :-----: | :-----: | :-----: | :-----: | :-----: |
| **Array2:** |⠀  ⠀|⠀ ⠀| ⠀

  
⠀
   

Then it chooses a random number from Array1. The chosen number is 3.
Now it copies the last element of Array1 and replaces the chosen number (3) with this element:

| Array1: |⠀1⠀|⠀2⠀|⠀4⠀|⠀4⠀|
| :-----: | :-----: | :-----: | :-----: | :-----: |
| **Array2:** |⠀  ⠀|⠀ ⠀| ⠀

  
⠀
   

Now it puts the chosen random element (3) at the last empty element of Array2:

| Array1: |⠀1⠀|⠀2⠀|⠀4⠀|⠀4⠀|
| :-----: | :-----: | :-----: | :-----: | :-----: |
| **Array2:** | | | 3|

  
⠀
   

Now it prints "3" and adds 3 to sum (now "sum" = 3). Then it shortens Array1 by 1 element.
Then it chooses a random number from Array1. The chosen number is 1.
Now it copies the last element of Array1 and replaces the chosen number (1) with this element:

| Array1: |⠀4⠀|⠀2⠀|⠀4⠀| ⠀⠀⠀|
| :-----: | :-----: | :-----: | :-----: | :-----: |
| **Array2:** | | | 3|

  
⠀
   

Now it puts the chosen random element (1) at the last empty element of Array2:

| Array1: |⠀4⠀|⠀2⠀|⠀4⠀| ⠀⠀⠀|
| :-----: | :-----: | :-----: | :-----: | :-----: |
| **Array2:** | | 1|3 |

  
⠀
   

Now it prints "1" and adds 1 to sum (now "sum" = 4). Then it shortens Array1 by 1 element.
Then it chooses a random number from Array1. The chosen number is 4.
Now it copies the last element of Array1 and replaces the chosen number (4) with this element:

| Array1: |⠀2⠀|⠀2⠀|⠀  ⠀⠀| ⠀⠀⠀|
| :-----: | :-----: | :-----: | :-----: | :-----: |
| **Array2:** | | 1|3 |

  
⠀
   

Now it puts the chosen random element (4) at the last empty element of Array2:

| Array1: |⠀2⠀|⠀2⠀|⠀⠀⠀|⠀ ⠀⠀
| :-----: | :-----: | :-----: | :-----: | :-----: |
| **Array2:** |4 | 1|3|

  
⠀
   

Now it prints "4" and adds 4 to sum (now "sum" = 8). Then it shortens Array1 by 1 element.

| Array1: |⠀2⠀|⠀⠀⠀|⠀⠀⠀| ⠀⠀⠀|   
| :-----: | :-----: | :-----: | :-----: | :-----: |
| **Array2:** |4 | 1|3 |

  
⠀
   

Now it calculates the sum of Array1 (using the formula mentioned above):
```
1 + 2 + 3 + 4 = 10
```

The missing number is 10 minus sum which is:
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
  
⠀
   
##### [click here](#run-images-1) to jump into run images.

⠀
⠀    
  
⠀
 
 
   
## `Variables`

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
  
⠀
 

    
## `Procedures`


Here are all the procedures in the code, their parameters, their processes, and their return values:

  
⠀
   

### SetArray1
* **Input:** The offset of the array, and the size of the array.
* **Proccess:** The procedure goes in every element of the array one by one and sets their values: 1,2,3,4..     
* **Output:** Array1 will now be: { 1,2,3,4,5...k }

  
⠀
   

### Random
* **Input:** No input.
* **Proccess:** This procedure uses the function we have learnt to generate a random number between 0-15.        
* **Output:** The register dl will hold a random value between 0-15.

  
⠀
   

### PrintNumber
* **Input:** A two digit decimal value.
* **Proccess:** The procedure compares the number to 10. If it is lower then 10 (0-9) it prints the digit. If it is higher or equal two 10, the procedure prints "1" and then subtract 10 from it and prints the digit.
* **Output:** The value of the input number is printed to the screen.

  
⠀
   
### PrintDigit
* **Input:** A decimal value between 0-9.
* **Proccess:** The procedure adds 30h to the digit and prints the ascii digit of the new value.
* **Output:** The input digit will be printed to the screen (Instead of the ascii character that has it's value). 

  
⠀
   

### IsPrime:
* **Input:** A decimal number.
* **Proccess:** The procedure loops throguh every integer that is smaller then the number and check if the number is divisble by it. If it is - it is not prime. If the procedure goed through all the numbers except "1" and none of them were divisble - it is a prime.    
* **Output:** Prints "And it is a prime number!" if it is prime or "And it is a composite number!" if it is not.  

  
⠀
   

   
⠀
   
## `Run images`  

  
⠀
   
Here is an image that shows the vars k, sum and the arrays 1 and 2 **before running** the code.

![Before Run](https://raw.githubusercontent.com/baraksu/ArrayGame/main/Run%20images/BeforeRun.png)

  
⠀
   
Here is an image that shows Array1 after putting it's values.

![After Setting Array1](https://raw.githubusercontent.com/baraksu/ArrayGame/main/Run%20images/AfterSettingArray1.PNG)

  
⠀
   
Here is an image that shows Array1 and Array2 **after the first number** is being added.  
Notice how the value "6" in Array1 turned into "15".

![Generating First Number](https://raw.githubusercontent.com/baraksu/ArrayGame/main/Run%20images/GeneratingFirstNumber.PNG)

  
⠀
   
Here is an image that shows the output in the **middle of the run**.  
The code hasn't finished so this is not the full Array2.

![Mid Run Output Capture](https://raw.githubusercontent.com/baraksu/ArrayGame/main/Run%20images/MidRunOutputCapture.PNG)

  
⠀
   
Here is an image that shows sum, Array1 and Array2 in the **middle of the run**.  
The value of sum doesn't include the last added number, 9, because the capture was taken before 9 was added to sum.

![Mid Run Capture](https://raw.githubusercontent.com/baraksu/ArrayGame/main/Run%20images/MidRunCapture.PNG)

  
⠀
   
Here is an image that shows sum and the two arrays **after the program is done**.

![After Run](https://raw.githubusercontent.com/baraksu/ArrayGame/main/Run%20images/AfterRun.PNG)

  
⠀
   
Here is an image that shows the output **before the prime check**.

![After Run Output1](https://raw.githubusercontent.com/baraksu/ArrayGame/main/Run%20images/AfterRunOutput1.PNG)


  
⠀
   
Here is an image that shows the program checking if the number is prime or not.  
The number is at dl, and the capture was taken right **after the line** "div cl".  
The reminder has been stored at AH and the quotient at AL.

![Prime Check](https://raw.githubusercontent.com/baraksu/ArrayGame/main/Run%20images/PrimeCheck.PNG)


  
⠀
   
Here is an image that shows the final output - **after the program is all finished**.

![After Run Output2](https://raw.githubusercontent.com/baraksu/ArrayGame/main/Run%20images/AfterRunOutput2.PNG)


  
⠀
   
And finally, here is an image that shows an example run for a different value of k. Here **k = 7**.

![Different K Run Example](https://raw.githubusercontent.com/baraksu/ArrayGame/main/Run%20images/DifferentKRunExample.PNG)

  
⠀
   

  
    
## `Personal experience`

  
⠀

את התוכנה פיתחתי בכמה שלבים.
  
בשלב הראשון, עוד לפני שפתחתי את המחשב, תכננתי את האלגוריתם.
  
הגדרתי במילים שלי מה אני אעשה בכל שלב, לכמה משתנים אני אזדקק ובאיזה קשיים אני עלול להיתקל.
  
אחרי שידעתי מה אני מתכוון לעשות, פתחתי את האימולטור והתחלתי לקודד.
  
הדבר הראשון שעשיתי היה לכתוב את הפרוצדורה random ולהשתמש בה בצורה כזו שאני אבחר איבר אקראי ממערך נתון.
  

אחרי שצלחתי לעשות זאת ללא בעיות, עברתי ללב העבודה - ווידאתי שאני מסוגל לבצע את שני הפעולות הפשוטות הבאות:  
   * החלפת האיבר האחרון במערך עם האיבר האקראי שנבחר.
   * העתקת האיבר האקראי שנבחר למקום הריק האחרון במערך 2.  
  
  
לאחר כמה תיקוני באגים קטע הקוד עבד. לכן עברתי לטפל בפרטים השוליים יותר:
   * הוספתי את הפונקציה שמגדירה את מערך 1.
   * הוספתי את השורה שמוסיפה בכל פעם את האיבר שהעברנו למערך 2, לתוך sum.
   * הוספתי את השורות שמחשבות את סכום המערך, ומחשבות את האיבר החסר ע"י חיסור הסכום שקיבלנו והמשתנה sum.
לא הסתבכתי עם חלק זה, ולא היו לי כמעט שגיאות לתקן.
  
  
אחרי שהאלגוריתם כולו עבד, עברתי לטיפול בקונסול.
  
ידעתי שאני אצטרך להדפיס כמה פעמים מספרים, ולכן הוספתי פרוצדורה ייעודית להדפסת מספרים.
  
אבל אז נתקלתי בבעייה: לא יכולתי להדפיס מספרים גדולים מ9 כיוון שאין להם ייצוג בתור סימן אסקיי אחד.
  
אחרי קצת מחשבה החלטתי לפצל את הפונקציה לשני פונקציות שונות:
  
פונקצייה שמקבלת ערך דצימלי של ספרה ומדפיסה אותו בתור אות אסקיי.
  
פונקצייה שמקבלת ערך דצימלי של מספר ואם הוא גדול מ0 היא מדפיסה "1" ואז מדפיסה את ספרת האחדות של המספר.
  
  
אחרי שטיפלתי בבעייה הזו, הוספתי קריאות לפונקצייה כשאני צריך להדפיס את המספר החסר בסוף ההרצה, וכשאני צריך להדפיס את הערכים של איברי מערך 2.
  
  
אחרי זה, הוספתי את ההודעות שעלי להדפיס למשתמש. הוספתי הודעה בתחילת הפונקציה שמסבירה למשתמש שעכשיו היא תציג לו את מערך 2, והודעה נוספת בסוף הפונקצייה שמסבירה למשתמש שעכשיו תציג לו את המספר החסר.
  
בנוסף, כתבתי שתי הודעות שאותן אני אדפיס אחרי בדיקה האם המספר ראשוני או פריק.

 
אחרי שגמרתי עם כל זה, הוספתי לכל פרוצדורה וחלק קוד הערות. סידרתי את הקוד והרצתי עליו בדיקות שווידאו שהוא עובד בצורה תקינה, ושהוא עובד עבור ערכים נוספים של k מלבד ערך הדוגמא שהשתמשתי בו.
  
בעייה אחת שנתקלתי בה בזמן הבדיקות היא שבטעות, כשהפונקציה בחרה מספר אקראי מהמערך היא בחרה מספר כלשהו ואחרי כמה לופים היא בחרה את אותו מספר שוב. הבעייה נבעה מקיצור לא נכון של אורך המערך, ולקח לי קצת זמן לעלות עליה ולתקן אותה.
  
אחרי שהקוד כולו עבד, עשיתי לו קומיט בגיטהאב.  
  
  
אחרי זה, התחלתי לעבוד על המציאה האם המספר החסר ראשוני או פריק. פתחתי פרוייקט חדש והתחלתי מייד לעבוד. מכיוון שמדובר בשיטה ידועה, לא היה לי צורך לשבת ולתכנן את האלגוריתם אלא ידעתי כבר מראש מה הוא יעשה. כתבתי את הפונקציה שעוברת על כל מספר טבעי הקטן מהמספר הנתון (לא כולל 1) ובודקת האם הם מתחלקים ללא שארית 0. האלגוריתם עבד כמו שצריך, אז הרצתי עליו בדיקות עבור מקרי קצה, כגון המספר 2 (שבניגוד לכל שאר המספרים, אין לו שום מספר טבעי קטן ממנו שאינו 1).  
  
    
האלגוריתם עבד מצויין, ולען הוספתי אותו לפרוייקט והוספתי לו הערות וקריאות. עשיתי בדיקות אחרונות לפרוייקט כולו, והוא עבד כיאות.
עשיתי קומיט לפרוייקט, ועברתי לטפל ברידמי. לקח לי הרבה זמן לכתוב אותו כי רציתי שהוא יהיה מושקע ומעוצב. לא היה לי נסיון ברידמי בעבר, אבל כמה חיפושי גוגל וכבר ידעתי בדיוק מה לעשות. הרידמי היה השלב האחרון בפרוייקט.
  
  
דבר שהייתי מוסיף לתוכנית בעתיד הוא אולי האפשרות לקבל מהיוזר את ערך הk שהוא רוצה, במקום שהוא ישנה בעצמו את הערך בקוד. הבעיה ברעיון זה היא שהמערך נוצר לפני תחילת הפקודות עצמן, ואי אפשר ליצור מערך בלי לדעת את גודלו, ואי אפשר לדעת את גודלו כי היוזר יכניס אותו רק אחרי שהמערך ייווצר.
  
    
דבר נוסף שהייתי רוצה להוסיף לתוכנית בעתיד הוא תמיכה בערכי k גדולים מ19. בשביל זה יהיה צורך להשתמש בפונקצייה שמגרילה מספרים גדולים יותר, להוסיף תמיכה בהדפסה של מספרים שאינם בטווח 1-19 ואולי אפילו התאמת הקוד לאלמנטים במערך שערכם עולה על 8 סיביות ולכן אי אפשר לשמור אותם ברגיסטר כמו al. החיסרון של אלגוריתם כזה הוא שהוא יהיה הרבה יותר איטי.

  
באופן כללי נהניתי מהפרוייקט. אומנם יש לי הרבה נסיון בתכנות של פרוייקטים גדולים: מאלגוריתמים מסובכים בפייתון, תכנות בוטים לווטסאפ בJavascript ועד [אפליקציית אנדרואיד שלמה בשפת Java](https://play.google.com/store/apps/details?id=com.gurfi.GradeApp&hl=he&gl=US) הנמצאת בשימוש בשכבה כבר מעל לשנה, אבל מעולם לא היה לי נסיון בשפת האסמבלי והפרוייקט נתן לי הזדמנות להתעמק באלגוריתם מעניין גם בשפה הנמוכה הזו שאותה אני פחות מכיר.        
    
----
    
  
Ⓒ  Yehonatan Gurfinkel - יהונתן גורפינקל  
School: ישיבת בני עקיבא גבעת שמואל, כיתה י'2  
Github account: [YG](https://github.com/yehogdev)  
Assembly project "Array Game"  
Language: Assembly x86  
  
  
----
