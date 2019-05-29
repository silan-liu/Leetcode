import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(smallestRangeITests.allTests),
    ]
}
#endif
