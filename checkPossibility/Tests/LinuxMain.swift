import XCTest

import checkPossibilityTests

var tests = [XCTestCaseEntry]()
tests += checkPossibilityTests.allTests()
XCTMain(tests)