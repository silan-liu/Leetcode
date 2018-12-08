import XCTest

import repeatedSubstringPatternTests

var tests = [XCTestCaseEntry]()
tests += repeatedSubstringPatternTests.allTests()
XCTMain(tests)