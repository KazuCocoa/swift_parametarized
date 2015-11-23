import XCTest

class xctestSampleTests: XCTestCase {
    // define for parameterized test
    struct ParameterizedStruct {
        var (one, two, expected): (Int, Int, Int)
    }
    func parameterized(params: [ParameterizedStruct], _ block: (ParameterizedStruct) -> Void) {
        for param in params {
            block(param);
        }
    }

    func testParameterizedTesting() {
        // define parameters
        let data: [ParameterizedStruct] = [
            ParameterizedStruct(one: 1, two: 2, expected: expectedMethod()),
            ParameterizedStruct(one: 3, two: EnumSample.Zero.rawValue, expected: 3)
        ]

        // Set test case as block case
        parameterized(data, {
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
