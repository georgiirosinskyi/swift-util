// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct Util
{
    static func convert<T: Numeric>(_ data: String) -> T?
    {
        if (T.self == Int.self)
        {
            let result = Int(data)
            return result as! T?
        }
        else if (T.self == Double.self)
        {
            let result = Double(data)
            return result as! T?
        }
        else if (T.self == Float.self)
        {
            let result = Float(data)
            return result as! T?
        }

        return nil
    }

    public static func getValues<T: Numeric>(from str: String, count n: Int) -> [T]?
    {
        if (n <= 0)
        {
            return nil
        }

        var result: [T] = []

        let inputs = str.components(separatedBy: CharacterSet.whitespaces)

        if (inputs.count != n)
        {
            //print("Failed to read \(n) values")
            return nil
        }

        for input in inputs
        {
            guard let value: T = convert(input) else
            {
                //print("Incorrect input: \(input)")
                return nil
            }

            result.append(value)
        }

        return result
    }

    public static func getValues(from str: String, count n: Int) -> [String]?
    {
        if (n <= 0)
        {
            return nil
        }

        let inputs = str.components(separatedBy: CharacterSet.whitespaces)

        if (inputs.count != n)
        {
            //print("Failed to read \(n) values")
            return nil
        }

        return inputs
    }
}
