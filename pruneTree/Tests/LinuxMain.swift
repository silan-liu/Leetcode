import XCTest

import pruneTreeTests

var tests = [XCTestCaseEntry]()
tests += pruneTreeTests.allTests()
XCTMain(tests)