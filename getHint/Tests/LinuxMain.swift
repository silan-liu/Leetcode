import XCTest

import getHintTests

var tests = [XCTestCaseEntry]()
tests += getHintTests.allTests()
XCTMain(tests)
