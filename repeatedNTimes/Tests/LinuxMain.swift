import XCTest

import repeatedNTimesTests

var tests = [XCTestCaseEntry]()
tests += repeatedNTimesTests.allTests()
XCTMain(tests)
