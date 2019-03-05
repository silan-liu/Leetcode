import XCTest

import distributeCoinsTests

var tests = [XCTestCaseEntry]()
tests += distributeCoinsTests.allTests()
XCTMain(tests)