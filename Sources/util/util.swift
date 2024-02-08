// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

func convert<T: Numeric>(_ data: String) -> T?
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

func readValues<T: Numeric>(count n: Int) -> [T]
{
    var result: [T] = []

    let inputs = readLine()?.components(separatedBy: CharacterSet.whitespaces) ?? []

    if (inputs.count != n)
    {
        print("Failed to read \(n) values")
        return result
    }

    for input in inputs
    {
        guard let value: T = convert(input) else
        {
            print("Incorrect input: \(input)")
            return result
        }

        result.append(value)
    }

    return result
}

func readValues(count n: Int) -> [String]
{
    let inputs = readLine()?.components(separatedBy: CharacterSet.whitespaces) ?? []

    if (inputs.count != n)
    {
        print("Failed to read \(n) values")
        return []
    }

    return inputs
}
