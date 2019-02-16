import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(strWithout3a3bTests.allTests),
    ]
}
#endif