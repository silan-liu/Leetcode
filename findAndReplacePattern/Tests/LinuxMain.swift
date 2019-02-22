import XCTest

import findAndReplacePatternTests

var tests = [XCTestCaseEntry]()
tests += findAndReplacePatternTests.allTests()
XCTMain(tests)