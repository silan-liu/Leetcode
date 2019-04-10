import XCTest

import findDuplicatesTests

var tests = [XCTestCaseEntry]()
tests += findDuplicatesTests.allTests()
XCTMain(tests)
