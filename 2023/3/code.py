# Advent of code Year 2023 Day 3 solution
# Author = ?
# Date = December 2023

with open((__file__.rstrip("code.py") + "example.txt"), 'r') as input_file:
    input = [line.strip() for line in input_file.readlines()]
    print(input)
    nested_list = [[char for char in line] for line in input]
    for i in range(len(nested_list)):
        for j, item in enumerate(nested_list[i]):
            if item != '.' and not item.isdigit():
                up = [i - 1][j] if i > 0 else None
                down = [i + 1][j] if i < len(nested_list) - 1 else None
                left = [i][j - 1] if j > 0 else None
                right = [i][j + 1] if j < len(nested_list[i]) - 1 else None
                up_left = [i - 1][j - 1] if i > 0 and j > 0 else None
                up_right = [i - 1][j + 1] if i > 0 and j < len(nested_list[i]) - 1 else None
                down_left = [i + 1][j - 1] if i < len(nested_list[i]) - 1 and j > 0 else None
                down_right = [i + 1][j + 1] if i < len(nested_list[i]) - 1 and j < len(nested_list[i]) - 1 else None
                dir = [up, down, left, right, up_left, up_right, down_left, down_right]

                for i, x in enumerate(dir):
                    if nested_list[x[0]][x[1]].isdigit():


    # print(len(nested_list))
    # matrix = [[]]




# print("Part One : "+ str(None))
# print("Part Two : "+ str(None))
