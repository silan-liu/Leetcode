import XCTest

import checkPerfectNumberTests

var tests = [XCTestCaseEntry]()
tests += checkPerfectNumberTests.allTests()
XCTMain(tests)