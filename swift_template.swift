import Foundation

// MARK: - Solution Object
class Solution {
    let input: String
    
    init(input: String) {
        self.input = input
    }
    
    // MARK: - Part 1
    func solvePart1() -> Int {
        // TODO: Implement part 1 solution
        return 0
    }
    
    // MARK: - Part 2
    func solvePart2() -> Int {
        // TODO: Implement part 2 solution
        return 0
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


