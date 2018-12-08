import XCTest

import addBinaryTests

var tests = [XCTestCaseEntry]()
tests += addBinaryTests.allTests()
XCTMain(tests)