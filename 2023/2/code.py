# Advent of code Year 2023 Day 2 solution
# Author = ?
# Date = December 2023

with open((__file__.rstrip("code.py") + "input.txt"), 'r') as input_file:
    input = input_file.readlines()
    ans = 0
    for line in input:
        game_id = 0
        sub_str = line[5:]

        color_mapping = {}
        words = sub_str.split()
        words[0] = ''.join([char for char in words[0] if char.isdigit()])

        game_id = int(words[0])

        amount = 0
        color = ""

        # find the largest amount of cubesexample
        for i in range(1, len(words) - 1, 2):
            amount = int(words[i])
            color = words[i + 1]
            if color[0] == 'r':
                if "red" in color_mapping:
                    if color_mapping['red'] < amount:
                        color_mapping['red'] = amount
                else:
                    color_mapping['red'] = amount
            elif color[0] == 'g':
                if "green" in color_mapping:
                    if color_mapping['green'] < amount:
                        color_mapping['green'] = amount
                else:
                    color_mapping['green'] = amount
            elif color[0] == 'b':
                if "blue" in color_mapping:
                    if color_mapping['blue'] < amount:
                        color_mapping['blue'] = amount
                else:
                    color_mapping['blue'] = amount

        red = color_mapping['red']
        blue = color_mapping['blue']
        green = color_mapping['green']

        # if (int(red) <= 12 and int(blue) <= 14 and int(green) <= 13):
        power = red * green * blue
        ans += power
        print("red: {}, green: {}, blue: {}".format(red, green, blue))
        print("power: {}".format(power))
        # print("game " + str(game_id) + " is possible")
        print("current ans: {}".format(ans))

    # print("Part One: {}".format(ans))
    print("Part Two: {}".format(ans))


# print("Part One : "+ str(None))
# print("Part Two : "+ str(None))
