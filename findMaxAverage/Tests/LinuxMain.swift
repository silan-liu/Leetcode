import XCTest

import findMaxAverageTests

var tests = [XCTestCaseEntry]()
tests += findMaxAverageTests.allTests()
XCTMain(tests)