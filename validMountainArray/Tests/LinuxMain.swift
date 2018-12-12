import XCTest

import validMountainArrayTests

var tests = [XCTestCaseEntry]()
tests += validMountainArrayTests.allTests()
XCTMain(tests)