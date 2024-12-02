import Foundation

// Solution
class Solution {
    let input: String
    var unsafePart1: Int
    var unsafePart2: Int

    // constructor
    init(input: String) {
        self.input = input
        self.unsafePart1 = 0
        self.unsafePart2 = 0
    }

    // Part 1
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
                        self.unsafePart1 += 1
                        break
                    }
                    // if the level is both increasing and decreasing
                    // then it is not safe => break
                    if tracker[0] == true && tracker[1] == true {
                        self.unsafePart1 += 1
                        break
                    } else {
                        // check if the abs difference is more than 3
                        let levelAbsDifference = abs(firstNum - secondNum)
                        if levelAbsDifference > 3 {
                            self.unsafePart1 += 1
                            break
                        }
                    }
                }
            }
        }
        print("Safe: \(reportsN - self.unsafePart1)")
        return reportsN - self.unsafePart1
    }

    //  Part 2
    func solvePart2() -> Int {
        let reports = input.split(separator: "\n").map(String.init)
        let reportsN = reports.count
        for report in reports {
            var tracker: [Bool] = [false, false, false]
            var problemDampenerUsed = false
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
                        if problemDampenerUsed {
                            self.unsafePart2 += 1
                            break
                        }
                        problemDampenerUsed = true
                    }
                    // if the level is both increasing and decreasing
                    // then it is not safe => break
                    if tracker[0] == true && tracker[1] == true {
                        if problemDampenerUsed {
                            self.unsafePart2 += 1
                            break
                        }
                        problemDampenerUsed = true
                    } else {
                        // check if the abs difference is more than 3
                        let levelAbsDifference = abs(firstNum - secondNum)
                        if levelAbsDifference > 3 && problemDampenerUsed {
                            self.unsafePart2 += 1
                            break
                        } else if levelAbsDifference > 3 && !problemDampenerUsed {
                            problemDampenerUsed = true
                        }
                    }
                }
            }
        }
        print("Safe: \(reportsN - self.unsafePart2)")
        return reportsN - self.unsafePart2
    }
}

/// Reads contents of a file
/// - Returns: Contents of the file as a string, or empty if reading fails
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

    let part1 = solution.solvePart1()
    print("Part 1 Solution: \(part1)")

    let part2 = solution.solvePart2()
    print("Part 2 Solution: \(part2)")
}

// run the program
main()
