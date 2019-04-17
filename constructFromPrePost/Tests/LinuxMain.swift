import XCTest

import constructFromPrePostTests

var tests = [XCTestCaseEntry]()
tests += constructFromPrePostTests.allTests()
XCTMain(tests)
