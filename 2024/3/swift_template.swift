import Foundation

// MARK: - Solution Object
class Solution {
    let input: String
    
    init(input: String) {
        self.input = input
    }

    func isGoodFormat(str: String) -> Bool {
        let standard = "mul(_,_)"
        for i in 0..<standard.count {
            let index = standard.index(standard.startIndex, offsetBy: i)
            if standard[index] == "_"{
                continue
            }
            if str[index] != standard[index] {
                return false
            }
        }

        return true
    }
    
    // MARK: - Part 1
    func solvePart1() -> Int {
        for i in 0..<self.input.count{
            let index = self.input.index(self.input.startIndex, offsetBy: i)
        }
        return 0
    }
    
    // MARK: - Part 2
    func solvePart2() -> Int {
        // TODO: Implement part 2 solution
        return 0
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

// MARK: - Main
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

main()


