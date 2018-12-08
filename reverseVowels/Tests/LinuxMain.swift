import XCTest

import reverseVowelsTests

var tests = [XCTestCaseEntry]()
tests += reverseVowelsTests.allTests()
XCTMain(tests)