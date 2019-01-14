import XCTest

import robotSimTests

var tests = [XCTestCaseEntry]()
tests += robotSimTests.allTests()
XCTMain(tests)