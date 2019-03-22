import XCTest

import intervalIntersectionTests

var tests = [XCTestCaseEntry]()
tests += intervalIntersectionTests.allTests()
XCTMain(tests)