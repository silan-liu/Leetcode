import XCTest

import isBalancedTests

var tests = [XCTestCaseEntry]()
tests += isBalancedTests.allTests()
XCTMain(tests)