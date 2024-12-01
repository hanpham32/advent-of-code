# Advent of code Year 2023 Day 1 solution
# Author = ?
# Date = December 2023

numbers = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']

with open('input.txt', 'r') as input_file:
    input = input_file.readlines()
    sum = 0
    for line in input:
        digits = []
        for i, c in enumerate(line):
            if c.isdigit():
                digits.append(c)
            for j, d in enumerate(numbers):
                if line[i:].startswith(d):
                    digits.append(str(j + 1))
        score = int(digits[0] + digits[-1])
        sum += score
    print(sum)


def part_one_solution(input):
    sum = 0
    for line in input:
        first_digit = ''
        last_digit = ''
        num = 0
        for char in line:
            if char.isdigit():
                first_digit = char
                break
        for char in reversed(line):
            if char.isdigit():
                last_digit = char
                break
        if first_digit.isdigit() and last_digit.isdigit():
            num = int(first_digit + last_digit)
            sum += num
    print(sum)


# print("Part One : 55130" + str(None))


# print("Part Two : " + str(None))
