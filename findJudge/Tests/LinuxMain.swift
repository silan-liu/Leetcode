import XCTest

import findJudgeTests

var tests = [XCTestCaseEntry]()
tests += findJudgeTests.allTests()
XCTMain(tests)
