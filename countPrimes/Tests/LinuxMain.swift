import XCTest

import countPrimesTests

var tests = [XCTestCaseEntry]()
tests += countPrimesTests.allTests()
XCTMain(tests)