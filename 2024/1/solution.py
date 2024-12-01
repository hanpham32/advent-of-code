from collections import defaultdict


first_list = []
second_list = []
occurences = defaultdict(int)

with open("input.txt", "r") as input_file:
    input = input_file.readlines()
    for line in input:
        numbers = line.split()
        first_list.append(numbers[0])
        second_list.append(numbers[1])
        occurences[numbers[1]] += 1
    print(first_list)
    print(second_list)


def part_one():
    sum = 0
    first_list.sort()
    second_list.sort()
    for i in range(len(first_list)):
        sum += abs(int(second_list[i]) - int(first_list[i]))
    return sum


def part_two():
    similarity_score = 0
    for n in first_list:
        freq = occurences[n]
        score = int(n) * freq
        similarity_score += score
    return similarity_score


# sum = part_one()
part_two = part_two()
print(part_two)
