import XCTest

import mergeTests

var tests = [XCTestCaseEntry]()
tests += mergeTests.allTests()
XCTMain(tests)