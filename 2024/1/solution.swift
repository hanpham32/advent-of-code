import Foundation

// Solution
class Solution {
    let input: String
    
    init(input: String) {
        self.input = input
    }
    
    // Part 1
    func solvePart1() -> Int {
        return 0
    }
    
    //  Part 2
    func solvePart2() -> Int {
        return 0
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
    print("\nSolving puzzle...")
    let input = readInput(from: inputFile)
    let solution = Solution(input: input)
    
    let part1 = solution.solvePart1()
    print("Part 1 Solution: \(part1)")
    
    let part2 = solution.solvePart2()
    print("Part 2 Solution: \(part2)")
}

// run the program
main()

