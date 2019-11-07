//
//  HTTPJSONDataStringifierTests.swift
//  UBCoreTests
//
//  Created by Nikita Nikitsky on 07.11.2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//

import XCTest
@testable import UBCore

class HTTPJSONDataStringifierTests: XCTestCase {

    struct EmptyObject: Codable {}

    struct SimpleObject: Codable {
        var property: String
    }

    struct CompositeObject: Codable {
        var other: [CompositeObject]
    }

    struct SimpleObjectWithOptionalProperty: Codable {
        var property: String?
    }

}

// MARK: - Tests

extension HTTPJSONDataStringifierTests {

    func testEmptyArray() {
        let stringifier = HTTPJSONDataStringifier(writeOptions: .prettyPrinted)
        let object = [String]()

        guard let data = try? JSONEncoder().encode(object) else {
            XCTFail()
            return
        }

        guard let string = stringifier.string(with: data) else {
            XCTFail()
            return
        }

        XCTAssertEqual(string, "[\n\n]")
    }

    func testEmptyObject() {
        let stringifier = HTTPJSONDataStringifier(writeOptions: .prettyPrinted)
        let object = EmptyObject()

        guard let data = try? JSONEncoder().encode(object) else {
            XCTFail()
            return
        }

        guard let string = stringifier.string(with: data) else {
            XCTFail()
            return
        }

        XCTAssertEqual(string, "{\n\n}")
    }

    func testSimpleObject() {
        let stringifier = HTTPJSONDataStringifier(writeOptions: .prettyPrinted)
        let object = SimpleObject(property: "value")

        guard let data = try? JSONEncoder().encode(object) else {
            XCTFail()
            return
        }

        guard let string = stringifier.string(with: data) else {
            XCTFail()
            return
        }

        XCTAssertEqual(string, "{\n  \"property\" : \"value\"\n}")
    }

    func testCompositeObject() {
        let stringifier = HTTPJSONDataStringifier(writeOptions: .prettyPrinted)
        let object = CompositeObject(other: Array(repeating: CompositeObject(other: []), count: 10))

        guard let data = try? JSONEncoder().encode(object) else {
            XCTFail()
            return
        }

        guard let string = stringifier.string(with: data) else {
            XCTFail()
            return
        }

        XCTAssertEqual(string, "{\n  \"other\" : [\n    {\n      \"other\" : [\n\n      ]\n    },\n    {\n      \"other\" : [\n\n      ]\n    },\n    {\n      \"other\" : [\n\n      ]\n    },\n    {\n      \"other\" : [\n\n      ]\n    },\n    {\n      \"other\" : [\n\n      ]\n    },\n    {\n      \"other\" : [\n\n      ]\n    },\n    {\n      \"other\" : [\n\n      ]\n    },\n    {\n      \"other\" : [\n\n      ]\n    },\n    {\n      \"other\" : [\n\n      ]\n    },\n    {\n      \"other\" : [\n\n      ]\n    }\n  ]\n}")
    }

    func testSimpleObjectWithOptionalSomeProperty() {
        let stringifier = HTTPJSONDataStringifier(writeOptions: .prettyPrinted)
        let object = SimpleObjectWithOptionalProperty(property: "value")

        guard let data = try? JSONEncoder().encode(object) else {
            XCTFail()
            return
        }

        guard let string = stringifier.string(with: data) else {
            XCTFail()
            return
        }

        XCTAssertEqual(string, "{\n  \"property\" : \"value\"\n}")
    }

    func testSimpleObjectWithOptionalNoneProperty() {
        let stringifier = HTTPJSONDataStringifier(writeOptions: .prettyPrinted)
        let object = SimpleObjectWithOptionalProperty(property: nil)

        guard let data = try? JSONEncoder().encode(object) else {
            XCTFail()
            return
        }

        guard let string = stringifier.string(with: data) else {
            XCTFail()
            return
        }

        XCTAssertEqual(string, "{\n\n}")
    }

}
