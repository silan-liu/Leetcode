import XCTest

import longestCommonPrefixTests

var tests = [XCTestCaseEntry]()
tests += longestCommonPrefixTests.allTests()
XCTMain(tests)