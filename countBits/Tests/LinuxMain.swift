import XCTest

import countBitsTests

var tests = [XCTestCaseEntry]()
tests += countBitsTests.allTests()
XCTMain(tests)