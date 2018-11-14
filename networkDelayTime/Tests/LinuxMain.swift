import XCTest

import networkDelayTimeTests

var tests = [XCTestCaseEntry]()
tests += networkDelayTimeTests.allTests()
XCTMain(tests)