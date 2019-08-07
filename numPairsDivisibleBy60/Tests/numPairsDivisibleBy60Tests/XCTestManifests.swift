import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(numPairsDivisibleBy60Tests.allTests),
    ]
}
#endif
