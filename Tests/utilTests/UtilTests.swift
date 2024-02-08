import XCTest
@testable import Util

final class UtilTests: XCTestCase
{
    func testInt() throws
    {
        var values : [Int] = Util.getValues(from: "1 2 3", count: 3) ?? []
        XCTAssertEqual(values.count, 3)
        XCTAssertEqual(values, [1, 2, 3])

        values = Util.getValues(from: "123", count: 1) ?? []
        XCTAssertEqual(values.count, 1)
        XCTAssertEqual(values, [123])
    }

    func testDouble() throws
    {
        var values : [Double] = Util.getValues(from: "1 2 3", count: 3) ?? []
        XCTAssertEqual(values.count, 3)
        XCTAssertEqual(values, [1.0, 2.0, 3.0])

        values = Util.getValues(from: "1.2 2.3 3.4", count: 3) ?? []
        XCTAssertEqual(values.count, 3)
        XCTAssertEqual(values, [1.2, 2.3, 3.4])
    }

    func testFloat() throws
    {
        var values : [Float] = Util.getValues(from: "1 2 3", count: 3) ?? []
        XCTAssertEqual(values.count, 3)
        XCTAssertEqual(values, [1.0, 2.0, 3.0])

        values = Util.getValues(from: "1.2 2.3 3.4", count: 3) ?? []
        XCTAssertEqual(values.count, 3)
        XCTAssertEqual(values, [1.2, 2.3, 3.4])
    }

    func testString() throws
    {
        let values : [String] = Util.getValues(from: "1 2 3", count: 3) ?? []
        XCTAssertEqual(values.count, 3)
        XCTAssertEqual(values, ["1", "2", "3"])
    }

    func testIncorrectCount() throws
    {
        var values : [Int] = Util.getValues(from: "1 2 3", count: 1) ?? []
        XCTAssertEqual(values.count, 0)

        values = Util.getValues(from: "1 2 3", count: 4) ?? []
        XCTAssertEqual(values.count, 0)

        values = Util.getValues(from: "1 2 3", count: -1) ?? []
        XCTAssertEqual(values.count, 0)

        values = Util.getValues(from: "1 2 3", count: 0) ?? []
        XCTAssertEqual(values.count, 0)
    }

    func testIncorrectData() throws
    {
        var values : [Int] = Util.getValues(from: "1 2 3.4", count: 3) ?? []
        XCTAssertEqual(values.count, 0)

        values = Util.getValues(from: "1 2s 3", count: 3) ?? []
        XCTAssertEqual(values.count, 0)

        values = Util.getValues(from: "sdcf", count: 1) ?? []
        XCTAssertEqual(values.count, 0)
    }
}
