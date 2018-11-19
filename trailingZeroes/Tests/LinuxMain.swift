import XCTest

import trailingZeroesTests

var tests = [XCTestCaseEntry]()
tests += trailingZeroesTests.allTests()
XCTMain(tests)