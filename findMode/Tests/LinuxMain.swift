import XCTest

import findModeTests

var tests = [XCTestCaseEntry]()
tests += findModeTests.allTests()
XCTMain(tests)