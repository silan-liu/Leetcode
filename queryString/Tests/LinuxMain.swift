import XCTest

import queryStringTests

var tests = [XCTestCaseEntry]()
tests += queryStringTests.allTests()
XCTMain(tests)
