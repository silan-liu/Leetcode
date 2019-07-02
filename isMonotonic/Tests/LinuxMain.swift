import XCTest

import isMonotonicTests

var tests = [XCTestCaseEntry]()
tests += isMonotonicTests.allTests()
XCTMain(tests)
