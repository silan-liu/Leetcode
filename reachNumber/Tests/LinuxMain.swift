import XCTest

import reachNumberTests

var tests = [XCTestCaseEntry]()
tests += reachNumberTests.allTests()
XCTMain(tests)