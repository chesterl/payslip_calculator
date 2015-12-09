# Employee Payslip Processor

## Overview:

This is a coding exercise to create a monthly payslip for employees. Originally given as a code test I have modified some of the README to preserve the privacy.

Goal: When you input the employee's details: first name, last name, annual salary(positive integer) and super rate(0% - 50% inclusive), payment start date, the program should generate payslip information with name, pay period,  gross income, income tax, net income and super.

## Description

The calculation details are performed as follows

- pay period = per calendar month
- gross income = annual salary / 12 months
- income tax = based on the tax table provide below
- net income = gross income - income tax
- super = gross income x super rate

Notes: All calculation results should be rounded to the whole dollar. If >= 50 cents round up to the next dollar increment, otherwise round down.

The following rates for 2012-13 apply from 1 July 2012.

Taxable income   Tax on this income
* 0 - $18,200     Nil
* $18,201 - $37,000       19c for each $1 over $18,200
* $37,001 - $80,000       $3,572 plus 32.5c for each $1 over $37,000
* $80,001 - $180,000      $17,547 plus 37c for each $1 over $80,000
* $180,001 and over       $54,547 plus 45c for each $1 over $180,000

The tax table is from ATO: http://www.ato.gov.au/content/12333.htm

### Example Data

Employee annual salary is 60,050, super rate is 9%, how much will this employee be paid for the month of March ?

- pay period = Month of March (01 March to 31 March)
- gross income = 60,050 / 12 = 5,004.16666667 (round down) = 5,004
- income tax = (3,572 + (60,050 - 37,000) x 0.325) / 12  = 921.9375 (round up) = 922
- net income = 5,004 - 922 = 4,082
- super = 5,004 x 9% = 450.36 (round down) = 450

Input and output may be in a format of your choice.

As part of your solution:
- List any assumptions that you have made in order to solve this problem.
- Provide instruction on how to run the application
- Provide a test harness to validate your solution.


## Dependencies

```
bundler

ruby => 2.2.2

rspec
```

##Usage

In the root directory, run `bundle install`

This program processes any CSV files in the `csv/` folder and outputs the results into your terminal.

Run `ruby bin/run.rb` to run the program.

The processor assumes valid csv formatting. Invalid data will be skipped.

An example of valid CSV is in the following format without any symbols such as $ or %

First Name, Last Name, Salary, Super Rate, Pay Period
e.g.

```
David,Smith,50000,6,May 1 - May 31
```

CSV headers are required for the file to be processed. You MUST include this on your first line of your CSV file to process correctly.

```
first_name,last_name,annual_salary,super_rate,pay_period
```

See `csv/sample.csv` for further examples of valid and invalid data.


## Development Environment

Created with ruby version 2.2.2p95 on OS X Mavericks 10.9.5

## Specs

Run `rspec spec/` from main directory.

## Discussion

** Assumptions / Design Choices **

I've made two major assumptions in this exercise. Firstly that most of the CSV data is valid and organized in a specific format. I handled some possible invalid types or scenarios within my `Validator` class to ensure that the `Employee` class receives valid data to handle the calculations.

However I did not go through the process of validating attributes like `pay_period` which would require extensive validation depending on the interpretation of the exercise. Based on the examples and instructions, I have assumed that regardless of the pay period, a monthly calculation is required.

For many cases, invalid data is simply ignored during the processing.

For processing, I've retained the requirement of having csv headers. This helps others understand the data in the csv file that will be processed.

** Things I'm happy with **

I find my classes to be focused and mostly concerning one purpose. There are a few oddities tucked away in private methods mostly but at this point, it would be a bit overkill to separate it into another class. Compared to an earlier version of this code test, the classes are less coupled and can be extended or changed more easily.

I'm also fairly happy with the test coverage and various levels of testing. I opted not to do extensive integration testing but did add a sanity check in the `PayslipProcessor` class to test the potential output.

** Areas of Change/Improvement **

As mentioned above, I have left some methods in `PaySlip` which probably shouldn't remain there if the class expanded in functionality. I didn't feel certain about my choice on making `IncomeTax` handle the calculations on an instance object level. Most of the other calculations are handled by class methods since there is little need to hold onto state. It could be argued that the same could be said for `IncomeTax` but writing it this way felt a bit cleaner in organization.

In `Payslip`, I did extensive mocking on the `generate` method which arguably doesn't provide much information. Since I'm only calling methods to assign to the instance variables, there might not be a lot of value in testing this method.

In `PayslipProcessor`, I included tests that are dependent on the sample csv data. This couples the test, but provides a more “real life” test example. Alternatively, I can also set up a mock file to test, which requires more setup but creates less dependent tests.

In this version, I ultimately ended up outputting the results to the terminal rather than writing a new csv file. I'm okay with both approaches but my chosen approach is a bit simpler.

## License

MIT License

## Contributing

If you have any input on design or code considerations, please feel free to reach out to me.
