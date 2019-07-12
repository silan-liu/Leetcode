import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(gcdOfStringsTests.allTests),
    ]
}
#endif
