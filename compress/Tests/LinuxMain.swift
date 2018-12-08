import XCTest

import compressTests

var tests = [XCTestCaseEntry]()
tests += compressTests.allTests()
XCTMain(tests)