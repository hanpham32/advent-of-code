def find_numbers_in_string(s, mapping):
    words = []
    current_word = ''

    for i in range(len(s)):
        for j in range(len(s) - i):
            char = s[j + i]
            current_word += char
            print(current_word)
            if current_word in number_mapping:
                words.append(mapping[current_word])
                current_word = ''
                break
        current_word = ''

    # for char in s:
    #    current_word += char
    #   if current_word in mapping:
    #        words.append(mapping[current_word])
    #        print(current_word)
    #        current_word=''

    return words


def first_and_last_number(s, mapping):
    numbers = find_numbers_in_string(s, mapping)
    if not numbers:
        return None, None
    return numbers[0], numbers[-1]


# Example usage
number_mapping = {
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7,
    "eight": 8,
    "nine": 9,
}

input_string = "eightwothree"
first, last = first_and_last_number(input_string, number_mapping)

print("First number:", first)
print("Last number:", last)
