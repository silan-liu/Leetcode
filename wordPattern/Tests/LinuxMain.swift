import XCTest

import wordPatternTests

var tests = [XCTestCaseEntry]()
tests += wordPatternTests.allTests()
XCTMain(tests)