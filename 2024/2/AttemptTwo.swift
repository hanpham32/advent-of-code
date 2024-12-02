import Foundation

// MARK: - Solution Object

class Solution {
    let input: String
    var unsafePart1: Int
    var unsafePart2: Int

    init(input: String) {
        self.input = input
        unsafePart1 = 0
        unsafePart2 = 0
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
            if diff < 1 || diff > 3 {return false}
            if diff > 0 { isDecreasing = false }
            if diff < 0 { isIncreasing = false }
        }

        return isDecreasing || isIncreasing
    }

    func solvePart2() -> Int {
        let reports = input.split(separator: "\n").map(String.init)
        let reportsN = reports.count
        var safeCount = 0

        for report in reports {
            if isSafe(report) {
                safeCount += 1
                continue
            }
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
                            unsafePart2 += 1
                            break
                        }
                        problemDampenerUsed = true
                        continue
                    }
                    // if the level is both increasing and decreasing
                    // then it is not safe => break
                    if tracker[0] == true && tracker[1] == true {
                        if problemDampenerUsed {
                            unsafePart2 += 1
                            break
                        }
                        problemDampenerUsed = true
                        continue
                    } else {
                        // check if the abs difference is more than 3
                        let levelAbsDifference = abs(firstNum - secondNum)
                        if levelAbsDifference > 3 && problemDampenerUsed {
                            unsafePart2 += 1
                            break
                        } else if levelAbsDifference > 3 && !problemDampenerUsed {
                            problemDampenerUsed = true
                            continue
                        }
                    }
                }
            }
        }
        print("Safe: \(reportsN - unsafePart2)")
        return reportsN - unsafePart2
    }
}

// MARK: - File Reading

func readInput(isTest: Bool = false) -> String {
    let filename = isTest ? "test" : "input"
    let fileURL = URL(fileURLWithPath: filename + ".txt")

    do {
        return try String(contentsOf: fileURL, encoding: .utf8)
    } catch {
        print("Error reading file: \(error.localizedDescription)")
        return ""
    }
}

// MARK: - Testing

func runTests() {
    let testInput = readInput(isTest: true)
    let solution = Solution(input: testInput)

    // Add your test assertions here
    let part1Result = solution.solvePart1()
    print("Part 1 Test Result: \(part1Result)")
    // assert(part1Result == expectedPart1Result, "Part 1 test failed")

    let part2Result = solution.solvePart2()
    print("Part 2 Test Result: \(part2Result)")
    // assert(part2Result == expectedPart2Result, "Part 2 test failed")
}

// MARK: - Main

func main() {
    // First run tests
    print("Running tests...")
    runTests()
    print("Tests completed!")

    // Then solve actual puzzle
    print("\nSolving puzzle...")
    let input = readInput()
    let solution = Solution(input: input)

    let part1 = solution.solvePart1()
    print("Part 1 Solution: \(part1)")

    let part2 = solution.solvePart2()
    print("Part 2 Solution: \(part2)")
}

main()
