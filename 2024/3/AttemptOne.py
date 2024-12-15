import sys
import re


class Solution:
    def __init__(self, input_data: str):
        self.input_data = input_data

    def solve_part1(self) -> int:
        corrupted_mem = self.input_data
        # TODO: Implement part 1 solution
        pattern = re.compile(r"mul\((\d{1,3}),(\d{1,3})\)")
        total = 0

        for match in pattern.finditer(corrupted_mem):
            x_str, y_str = match.groups()
            x, y = int(x_str), int(y_str)
            total += x * y

        return total

    def solve_part2(self) -> int:
        # TODO: Implement part 2 solution
        return 0


def read_input(file_name: str) -> str:
    try:
        with open(file_name, "r", encoding="utf-8") as file:
            return file.read()
    except Exception as e:
        print(f"Error reading file: {e}")
        return ""


def main():
    # args
    if len(sys.argv) <= 1:
        print("Usage: python solution.py <input_file>")
        return

    input_file = sys.argv[1]
    print(f"Using input file: {input_file}")

    # run solutions
    input_data = read_input(input_file)
    solution = Solution(input_data)

    part1 = solution.solve_part1()
    print(f"Part 1 Solution: {part1}")

    part2 = solution.solve_part2()
    print(f"Part 2 Solution: {part2}")


if __name__ == "__main__":
    main()


"""
MISTAKES:
    Strict Pattern:
        No extra spaces, characters, or missing parentheses
    Index Inbound:
        arg for mul can be in the 100 so "m"+9, a fixed offset, is not ideal
NEW:
    Regex (regular expression)
        patterns used to match sequences of characters within strings
        a tool for searching, parsing, and manipulating texts given criteria
"""
