#  What is Quick and Nimble?

Quick and Nimble are a set of frameworks to assist with BBD (Behaviour-Driven-Development). Whilst they are separate frameworks, they are often used together for BBD.

# Quick 
The Quick framework focuses on structuring tests in an 'easy-to-read' and organised way.

Each test suite using the Quick framework inherits from 'QuickSpec'. This test suite can then override the 'spec' method to provide a set of tests.

Here, we can call the beforeEach and afterEach methods, passing a block of code to run before and after each test respectfully.

A Quick and Nimble test is setup with 3 stages:
- Describe
- Context
- It

'Describe' is used to group together tests in a similar category.
'Context' is used to break this group down into a more specific category
'It' describes the actual test

To prepare a test using Quick, "AAA" is commonly used. This stands for Arrange, Act and Assert. Any preparation of the object being tested happening in "Arrange", "Act" is when logic is triggered and "Assert" is when we check the output.

With this system, it is easier to sync up tests with expected user behaviours. Additionally, tests are not only organised well, but become extremely readable. 

# Nimble

The Nimble framework provides a range of matching functionality, used for the actual unit testing. An example of this is the 'expect' method, where we can state a condition we expect to be true.

The matching logic provided by Nimble can make async testing easier, proving methods such toEventually. This takes an expected value and a timeout.

When working with Quick and Nimble, then the matching logic provided by Nimble is often found in the 'It' section, provided by Quick.
