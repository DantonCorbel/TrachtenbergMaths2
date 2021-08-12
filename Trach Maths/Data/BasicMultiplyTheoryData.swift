//
//  BasicMultiplyTheoryData.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 15/06/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import Foundation

var data = Data(sixTheory.utf8)

// MARK: - Eleven
//Eleven: Add the neighbour
let elevenTheory = """
<html>
<head>
<style>
body {
font-family: Futura, Helvetica, sans-serif;
font-size: 14px
}
#orange {
color: Coral;
font-weight:bold
}
</style>
</head>

<body>
<h3>Hundreds, Tens and Units</h3>
<pre>

358 = (3 x 100) + (5 x 10) + 8
    = 300       + 50       + 8

We can put them in a table, to represent these values.
These are known as <em>'place values'</em>. We have Units (U), Tens (T), Hundreds(H), Thousands (Th), Ten Thousands (TTh) etc.
So 358 is made of 3 Hundreds (H), plus 5 Tens (T), plus 8 Units (U):

    <u>H T U</u>
    3 0 0
      5 0
        8 +
    -----
    <b>3 5 8</b>

      11 =   (1 x 10) +   (1 x 1)
  1 x 11 =   (1 x 10) +   (1 x 1)
  8 x 11 =   (8 x 10) +   (8 x 1)
358 x 11 = (358 x 10) + (358 x 1)

              <u>Th H T U</u>
    358 x 1 =    3 5 8
    358 x 10 = <u>3 5 8 0</u>  +
               <span id="orange">3 9 3 8</span>

If you look carefully at each place value column, can you see that you are adding the neighbour?

U column =  8 + 0 = <span id="orange">8</span>
T column =  5 + 8 = <span id="orange">3</span> carry 1 (13)
H column =  3 + 5 = 8, add the carried 1 = <span id="orange">9</span>
Th column = 0 + 3 = <span id="orange">3</span>
The orange digits, from bottom to top read: <span id="orange">3938</span>

</pre>
<h3>The Trachtenberg Method</h3>

<pre>
Using the 'add the neighbour' rule, from right to left:

<b>358 x 11 =</b>

8 + 0 = <span id="orange">8</span> (no neighbour)
5 + 8 = 13: <span id="orange">3</span> carry 1
3 + 5 = 8, add the carried 1 = <span id="orange">9</span>
0 + 3 = <span id="orange">3</span>
The orange digits, from bottom to top read: <span id="orange">3938</span>

</pre>
</body>
</html>
"""

// MARK: - Twelve
// Twelve: "Double the digit, add the neighbour"
let twelveTheory = """
<html>

<head>
<style>
body {
font-family: Futura, Helvetica, sans-serif;
font-size: 14px
}
#orange {
color: Coral;
font-weight:bold
}
</style>
</head>

<body>
<pre>
The long-hand for <b>358 x 12</b> is the same as adding '358 x 2' to '358 x 10' (1 Ten + 2 Unit = 12). Because there are 2 units rather than 1 in the '11' example, you can see that you are 'doubling' and then adding:

               <u>Th H T U</u>
    358 x 2 =     7 1 6
    358 x 10 =  <u>3 5 8 0</u>  +
                <span id="orange">4 2 9 6</span>

U column = 6 + 0 = <span id="orange">6</span>
T column = 1 + 8 = <span id="orange">9</span>
H column = 7 + 5 = 12: <span id="orange">2</span> carry 1
Th column = 0 + 3 + 1 = <span id="orange">4</span>
The orange digits, from bottom to top read: <span id="orange">4296</span>

Using the 'double the digit, add the neighbour' rule, from right to left:

<b>358 x 12 =</b>

(8 x 2) = 16 + 0 = 16: <span id="orange">6</span> carry 1 (no neighbour)
(5 x 2) = 10 + 8 + 1 = 19: <span id="orange">9</span> carry 1
(3 x 2) = 6 + 5 + 1 = 12: <span id="orange">2</span> carry 1
0 + 3 + 1 = <span id="orange">4</span>
The orange digits, from bottom to top read: <span id="orange">4296</span>

</pre>
</body>
</html>
"""

// MARK: - Six
//Six: If digit is odd, add 5, then add \'half\' the neighbour
let sixTheory = """
<html>
<head>
<style>
    body {
        font-family: Arial, sans-serif;

        font-size: 14px;
    }
    #orange {
        color: Coral;
        font-weight:bold
    }

</style>
</head>

<body>
<pre>
Knowing the Five rule, we can now add an extra step to derive the Six rule.

       If 6 = <span id="orange">5</span> + <span id="orange">1</span>
 Then 6 x 3 = (<span id="orange">5</span> x 3) + (<span id="orange">1</span> x 3)

We already know how the 'Five' rule works. Now we just have to add the (1 x digit), in this case (1 x 3). 1 x digit = digit, hence why we also add this to the answer. This extends the Five rule by one extra step of adding the digit.

6 x 3 = (5 x 3) + (1 x 3)
      = 15 + 3
      = 18

Lets put the last 2 rows into our Tens and Units columns:

    <u>T U</u>
    1 5     (From the 'Fives" rule)
      3 +   (From 1 x 3)
    <span id="orange">1 8</span>

In the U column, 3 is odd, and is added to 5.
In the T column, 'half' of 3 is 1.

Using a bigger (even) number:
6 x 24 = (5 x 24) + (1 x 24)

    <u>H T U</u>
    1 2 0     (From the 'Fives" rule)
      2 4 +   (From 1 x 24)
    <span id="orange">1 4 4</span>

Using a bigger (odd) number:
6 x 71 = (5 x 71) + (1 x 71)

    <u>H T U</u>
    3 5 5     (From the 'Fives" rule)
      7 1 +   (From 1 x 71)
    <span id="orange">4 2 6</span>

</pre>

</body>
</html>
"""

// MARK: - Seven
//Seven: "Double the digit, if digit is odd, add 5, then add \'half\' the neighbour"
let sevenTheory = """
<html>
<head>
<style>
body {
font-family: Futura, Helvetica, sans-serif;
font-size: 14px;
}
#orange {
color: Coral;
font-weight:bold
}
</style>
</head>

<body>
<pre>
Knowing the Five rule and Six rule, we can now derive the Seven rule.

If 7 = <span id="orange">5</span> + <span id="orange">2</span>
Then 7 x 3 = (<span id="orange">5</span> x 3) + (<span id="orange">2</span> x 3)

Now, instead of adding (1 x digit), we are adding (2 x digit). in other words, doubling the digit, then adding it to the Five rule.

    7 x 3 = (5 x 3) + (2 x 3)
          = 15 + 6
          = 21

Lets put the last 2 rows into our Tens and Units columns:

<u>T U</u>
1 5     (From the 'Fives" rule)
6 +   (From 1 x 3)
<span id="orange">2 1</span>

In the U column, 3 is doubled (to get 6), then, as 3 is odd, the answer is added to 5.
    (3 x 2) + 5 = 6 + 5 = 11: 1 carry 1
In the T column, 'half' of 3 is 1, plus the carried 1.

Using a bigger (even) number:
7 x 24 = (5 x 24) + (2 x 24)

    <u>H T U</u>
    1 2 0     (From the 'Fives" rule)
      4 8 +   (From 2 x 24)
    <span id="orange">1 6 8</span>

Using a bigger (odd) number:
7 x 71 = (5 x 71) + (2 x 71)

    <u>H T U</u>
    3 5 5     (From the 'Fives" rule)
    1 4 2 +   (From 1 x 71)
    <span id="orange">4 9 7</span>

Go ahead and check these using the Seven rule: "Double the digit, if digit is odd, add 5, then add \'half\' the neighbour".

</pre>
</body>
</html>
"""

// MARK: Five
//Five: Use \'half\' the neighbour, if odd add 5"
let fiveTheory = """
<html>
<head>
<style>
body {
font-family: Futura, Helvetica, sans-serif;
font-size: 14px;
}
#orange {
color: Coral;
font-weight:bold
}
</style>
</head>

<body>
<pre>
Ok, so we all know the 5x table is not difficult. However, being aware of this method can make the calculations faster for larger numbers.

To understand how the rule is derived, we need to manipulate the number 5 a little:
    5 = 10/2

Therefore:   5  x 3
           = <u>10</u> x 3
             2
           = <u>30</u>
             2
           = 15

This works out the same as:
          5 x 3 = 10 x 3/2
                = 10 x 1.5
                = 15

Because the is Trachtenberg, and he was looking for shortcuts, he saw that any 'odd' number divided by 2 would have a .5. He sees that 0.5 x 10 = 5, so knowing a number is 'odd' means he can put the 5 confidently in the Units column. He then looks at the rest of the answer of 'odd number'/2, in this case the '1' from 3/2 = 1.5, and he knows this '1' goes straight into the Tens column, but was derived by dividing the 3 by 2, thus 'half', ignoring the decimal point.

Another way to look at it is that:
    1.5 = 1 + 0.5 so:

          5 x 3 = 10 x 3/2
                = 10 x 1.5
                      <u>T</u>   <u>U</u>
                = (10 x 1) + (10 x 0.5)
                =    10    +     5
                =    1           5

Again, that '1' is derived from halving the 3 ( 3/2), the 5 is put in the Units column, the 1 in the Tens column. Thus we get the Fives Rule of: "Use \'half\' the neighbour, if odd add 5"

</pre>
</body>
</html>
"""

// MARK: - Nine

//Nine:
//First Step: Subtract from 10
//Middle Step: Subtract from 9, add the neighbour
//Last Step: Subtract 1 from left-most digit
let nineTheory = """
<html>
<head>
<style>
body {
font-family: Futura, Helvetica, sans-serif;
font-size: 14px;
}
#orange {
color: Coral;
font-weight:bold
}
</style>
</head>

<body>
<pre>

<h3>The first and last step</h3>

With 9 being so close to 10, there is an interesting pattern we see for the 9 x table:

 <u>N</u>       <u>T U</u>
 1 x 9 = 0 9
 2 x 9 = 1 8
 3 x 9 = 2 7
 4 x 9 = 3 6
 5 x 9 = 4 5
 6 x 9 = 5 4
 7 x 9 = 6 3
 8 x 9 = 7 2
 9 x 9 = 8 1
10 x 9 = 9 0

1) Look what happens as you read down the Units column. The numbers descend by from 9 to 0, 1 step at a time. Now subtract each number being multiplied(N) from 10:

    10 - 1 = 9
    10 - 2 = 8
    10 - 3 = 7
    etc.

    This is how the first part of the rule is derived - subtract the digit from 10.

2) Now look at the Tens column. Each number goes up by one, and each number is 1 less than the number being multiplied:

    1 - 1 = 0
    2 - 1 = 1
    3 - 1 = 2
    etc.

    And here we have the last part of the rule - subtract 1 fron the digit.

       <u>Last Step</u>  <u>First Step</u>
         TENS        UNITS
2x9 =  (2 - 1)     (10 - 2)
    =     1            8

7x9 =  (7 - 1)     (10 - 7)
    =     6            3


As a note of interest, if you add the digit in the Tens colum to the one in the Units column, it will always add to 9.

<h3>The middle steps</h3>

The middle step(s) is derived from a combination of these rules. We can apply this rule to each digit, but move them along the place value columns accordingly:

9 x 27 = <span id="orange">243</span>

   <u>Last Step</u> <u>Middle Step</u> <u>First Step</u>
    HUNDREDS     TENS      UNITS
2:  (2 - 1)    (10 - 2)
7:              (7 - 1)+  (10 - 7)
           (10 - 2 + 7 - 1)
           (10 - 1 - 2 + 7)
             (9 - 2 + 7)
             14 (4 carry 1)
       <span id="orange">2           4          3</span>

By rearrangung the (10 - 2 + 7 - 1) to (10 - 1 - 2 + 7), we get (9 - 2 + 7), which is where the middle rule originates: subtract from 9 then add the neighbour.

</pre>
</body>
</html>
"""

// MARK: - Eight
//Eight:
//    First Step: Subtract from 10, then double
//    Middle Step: Subtract from 9, double, add the neighbour
//    Last Step: Subtract 2 from left-most digit
let eightTheory = """
<html>
<head>
<style>
body {
font-family: Futura, Helvetica, sans-serif;
font-size: 14px;
}
#orange {
color: Coral;
font-weight:bold
}
</style>
</head>

<body>
<pre>
<h3>The first and last step</h3>

The Eight rule is similar to the Nine rule, but a little harder to explain:

<u>N</u>       <u>T U</u>
1 x 8 = 0 8
2 x 8 = 1 6
3 x 8 = 2 4
4 x 8 = 3 2
5 x 8 = 4 0
6 x 8 = 4 8
7 x 8 = 5 6
8 x 8 = 6 3
9 x 8 = 7 2

Reading down the Units column, the numbers descend from 8 to 0 in steps of 2 and then repeats. In the Tens column, the digit is 1 less than the number being multiplied, until x 6 when it becomes 2 less. So there needs to be more number manipulation to see how the rule works. Lets see what happens when we subtract from 10 and then double (the first step):

     <u>N</u>            <u>T U</u>
10 - 1 = 9, x 2 = 1 8
10 - 2 = 8, x 2 = 1 6
10 - 3 = 7, x 2 = 1 4
10 - 4 = 6, x 2 = 1 2
10 - 5 = 5, x 2 = 1 0
10 - 6 = 4, x 2 =   8
10 - 7 = 3, x 2 =   6
10 - 8 = 2, x 2 =   4
10 - 9 = 1, x 2 =   2

The Units column matches that of the x 8 table above.
The Tens column, however, has a 1 in it until 10 - 6, and then it is empty.
By using the 'carried' digit from the first step, it can be seen that the last rule of subtract 2 works:

1 - 2 + 1 = 0
2 - 2 + 1 = 1
3 - 2 + 1 = 2
4 - 2 + 1 = 3
5 - 2 + 1 = 4
6 - 2     = 4
7 - 2     = 5
8 - 2     = 6
9 - 2     = 7

<h3>The middle step<h3>

The middle step is derived from the addition of both these rules, like in the Nine rule
(in algebra (10 - 3) x 2 is written as 2(10-3)):

8 x 53 = <span id="orange">424</span>

   <u>Last Step</u> <u>Middle Step</u> <u>First Step</u>
   HUNDREDS      TENS      UNITS
5:  (5 - 2)   2(10 - 5)
3:             (3 - 2)+   2(10 - 3)
            20 - 10 + 3 - 2
            20 - 10 - 2 + 3
            20 - 12 + 3
            2(10-6) + 3
            2(9-5)  + 3
       3         11          14
       <span id="orange">4          2           4</span>


</pre>
</body>
</html>
"""

// MARK: - Four
//Four:
//   First Step: Subtract from 10, if digit odd, add 5
//   Middle Step: Subtract from 9, add \'half\' the neighbour, then if digit odd add 5
//   Last Step: Take \'half\' of the left-most digit and subtract 1
//
let fourTheory = """
<html>
<head>
<style>
body {
font-family: Futura, Helvetica, sans-serif;
font-size: 14px;
}
#orange {
color: Coral;
font-weight:bold
}
</style>
</head>
<body>
<pre>

The Four rule is a combination of the Nine and Five rule, because:
4 = 9 - 5


</pre>
</body>
</html>
"""

// MARK: - Three
//First Step: Subtract from 10, double, if digit odd, add 5
//Middle Step: Subtract from 9, double, add \'half\' the neighbour, then if digit odd add 5
//Last Step: Take \'half\' of the left-most digit and subtract 2
let threeTheory = """
<html>
<head>
<style>
body {
font-family: Futura, Helvetica, sans-serif;
font-size: 14px;
}
#orange {
color: Coral;
font-weight:bold
}
</style>
</head>

<body>
<pre>

The Four rule is a combination of the Eight and Five rule, because:
3 = 8 - 5


</pre>
</body>
</html>
"""



let defaultTheory =  """
<html>
<body>

<p> Waiting for data </p>

</body>
</html>
"""






//
//Lets look at 27 x 5:
//
//<u>H T U</u>
//5 x 20 = 1 0 0
//5 x  7 = <u>  3 5</u> +
//<span id="orange">1 3 5</span>
//
//Using the Trachtenberg method:
//7 is odd, so the Unit answer is <span id="orange">5</span>
//2 is even, so the Tens answer is 0 + 3 = <span id="orange">3</span> ('half' of 7)
//Half of 2 is <span id="orange">1</span>
//Answer: <span id="orange">135</span>
//
//5 x an odd number will always give us '5' in the Units section:
//
//<u>T U</u>
//5 x 1 = 0 5
//5 x 3 = 1 5
//5 x 5 = 2 5
//5 x 7 = 3 5
//5 x 9 = 4 5
//
//This is why if the number is odd, we use '5'.
//
//5 x an even number will always give us '0' in the Units section:
//
//<u>T U</u>
//5 x 2 = 1 0
//5 x 4 = 2 0
//5 x 6 = 3 0
//5 x 8 = 4 0
//
//This is why if the number is even, we use '0'.
//
//So where does 'half' come from?


//To get that single digit '1', we need to divide by 10, knowing that the answer goes in the Tens column:
//
//<u>1 x 10</u> = <u>10</u> = 1
//10            10
//
//Any number divided by itself = 1
//
//Winding back to the first part of the 5 x 3 above, to get the 'single' digit for the Tens column:
//<u>(10 x 3)</u> / 2
//10
//= (1 x 3) / 2
//= 3/2 -> the 'half'!
//= 1.5
//(To convert this back to tens and units, we know we multiply by 10:
//1.5 x 10 = 15)
//
//We ignore the decimal point because we know we have already accounted for the '5' by placing it in the Units column. This leaves us with a '1' to place in the Tens column, which is 'half' of 3.
//<u>T U</u>
//5 x 3 = 1 5

// color: rgb(77, 30, 0);

//extension String {
//    func htmlAttributedString() -> NSAttributedString? {
//        guard let data = self.data(using: .utf8) else {
//            return nil
//        }
//
//        return try? NSAttributedString(
//            data: data,
//            options: [.documentType: NSAttributedString.DocumentType.html],
//            documentAttributes: nil
//        )
//    }
//}
//
//func htmlAttributedString() -> NSAttributedString? {
//    let htmlTemplate = """
//    <!doctype html>
//    <html>
//    <head>
//    <style>
//    body {
//    font-family: -apple-system;
//    font-size: 24px;
//    }
//    </style>
//    </head>
//    <body>
//    \(self)
//    </body>
//    </html>
//    """
//
//    guard let data = htmlTemplate.data(using: .utf8) else {
//        return nil
//    }
//
//    guard let attributedString = try? NSAttributedString(
//        data: data,
//        options: [.documentType: NSAttributedString.DocumentType.html],
//        documentAttributes: nil
//        ) else {
//            return nil
//    }
//
//    return attributedString
//}
//
//
//
////func attributedString(yourLabel: String) {
//    if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
//        yourLabel.attributedText = attributedString
//    }
//}


//let theoryArray = [elevenTheory, twelveTheory]

//<head>
//<style>
//#orange {
//    color: Coral;
//}
//</style>
//</head>


