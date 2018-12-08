import XCTest

import removeDuplicatesTests

var tests = [XCTestCaseEntry]()
tests += removeDuplicatesTests.allTests()
XCTMain(tests)