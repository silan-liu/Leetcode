import XCTest

import allPathsSourceTargetTests

var tests = [XCTestCaseEntry]()
tests += allPathsSourceTargetTests.allTests()
XCTMain(tests)