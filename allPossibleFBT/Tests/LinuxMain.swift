import XCTest

import allPossibleFBTTests

var tests = [XCTestCaseEntry]()
tests += allPossibleFBTTests.allTests()
XCTMain(tests)