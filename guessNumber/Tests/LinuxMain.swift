import XCTest

import guessNumberTests

var tests = [XCTestCaseEntry]()
tests += guessNumberTests.allTests()
XCTMain(tests)