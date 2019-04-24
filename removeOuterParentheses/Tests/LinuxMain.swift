import XCTest

import removeOuterParenthesesTests

var tests = [XCTestCaseEntry]()
tests += removeOuterParenthesesTests.allTests()
XCTMain(tests)
