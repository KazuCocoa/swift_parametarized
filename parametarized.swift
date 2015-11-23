import XCTest

class xctestSampleTests: XCTestCase {
    // define for parametarized test
    struct ParametarizedStruct {
        var (one, two, expected): (Int, Int, Int)
    }
    func parametarized(params: [ParametarizedStruct], _ block: (ParametarizedStruct) -> Void) {
        for param in params {
            block(param);
        }
    }

    func testParametarizedTesting() {
        // define parameters
        let data: [ParametarizedStruct] = [
            ParametarizedStruct(one: 1, two: 2, expected: expectedMethod()),
            ParametarizedStruct(one: 3, two: EnumSample.Zero.rawValue, expected: 3)
        ]

        // Set test case as block case
        parametarized(data, {
            (paramStruct) in

            // describe test cases
            let item: Int? = paramStruct.one + paramStruct.two
            XCTAssert(item == paramStruct.expected)
        })
    }

    // Method which is used in parameters
    func expectedMethod() -> Int {
        return 3
    }

    // Enum which is used in parameters
    enum EnumSample: Int {
        case Zero, One, Two, Three
    }
}
