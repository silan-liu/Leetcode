import XCTest

import countAndSayTests

var tests = [XCTestCaseEntry]()
tests += countAndSayTests.allTests()
XCTMain(tests)