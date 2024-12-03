import Foundation

// MARK: - Solution Object

class Solution {
    let input: String
    var unsafePart1: Int

    init(input: String) {
        self.input = input
        unsafePart1 = 0
    }

    // MARK: - Part 1
    func solvePart1() -> Int {
        let reports = input.split(separator: "\n").map(String.init)
        let reportsN = reports.count
        for report in reports {
            var tracker: [Bool] = [false, false, false]
            let levels: [Substring] = report.split(separator: " ")
            for i in 0 ..< levels.count - 1 {
                if let firstNum = Int(levels[i]), let secondNum = Int(levels[i + 1]) {
                    // check if increasing or decreasing
                    let levelDifference = firstNum - secondNum
                    if levelDifference > 0 {
                        tracker[0] = true
                    } else if levelDifference < 0 {
                        tracker[1] = true
                    } else {
                        unsafePart1 += 1
                        break
                    }
                    // if the level is both increasing and decreasing
                    // then it is not safe => break
                    if tracker[0] == true && tracker[1] == true {
                        unsafePart1 += 1
                        break
                    } else {
                        // check if the abs difference is more than 3
                        let levelAbsDifference = abs(firstNum - secondNum)
                        if levelAbsDifference > 3 {
                            unsafePart1 += 1
                            break
                        }
                    }
                }
            }
        }
        print("Safe: \(reportsN - unsafePart1)")
        return reportsN - unsafePart1
    }

    // MARK: - Part 2
    func isSafe(_ levels: [Int]) -> Bool {
        var isIncreasing = true
        var isDecreasing = true

        for i in 0..<levels.count - 1 {
            let diff = levels[i + 1] - levels[i]
            let absDiff = abs(levels[i + 1] - levels[i])
            if absDiff < 1 || absDiff > 3 {return false}
            if diff > 0 { isDecreasing = false }
            if diff < 0 { isIncreasing = false }
        }

        return isDecreasing || isIncreasing
    }

    func solvePart2() -> Int {
        let reports = input.split(separator: "\n").map{$0.split(separator: " ").compactMap {Int($0)}}
        // compactMap
        // * converts each substring to an Int
        // * numbers that couldn't be converted are omitted

        var safeCount = 0

        for report in reports {
            print(report)
            // check if the report is safe
            if isSafe(report) {
                print("I'm safe")
                safeCount += 1
                continue
            }

            var isSafeWithDampener = false
            for i in 0 ..< report.count {
                var modifiedReport = report
                modifiedReport.remove(at: i)
                print("Removed \(i)")
                if isSafe(modifiedReport) {
                    isSafeWithDampener = true
                    break
                }
            }

            if isSafeWithDampener {
                print("I'm safe. I'm the special level")
                safeCount += 1
            }
        }
        print("Safe: \(safeCount)")
        return  safeCount
        }
}

// MARK: - File Reading
func readInput(from fileName: String) -> String {
    let fileURL = URL(fileURLWithPath: fileName)

    do {
        return try String(contentsOf: fileURL, encoding: .utf8)
    } catch {
        print("Error reading file: \(error.localizedDescription)")
        return ""
    }
}


func main() {
    // get command line args
    let args = CommandLine.arguments
    guard args.count > 1 else {
        print("Usage: swift solution.swift <input_file>")
        return
    }

    let inputFile = args[1]
    print("Using input file: \(inputFile)")

    // run solutions
    let input = readInput(from: inputFile)
    let solution = Solution(input: input)

    // let part1 = solution.solvePart1()
    // print("Part 1 Solution: \(part1)")

    let part2 = solution.solvePart2()
    print("Part 2 Solution: \(part2)")
}

main()
