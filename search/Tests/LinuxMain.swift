import XCTest

import searchTests

var tests = [XCTestCaseEntry]()
tests += searchTests.allTests()
XCTMain(tests)