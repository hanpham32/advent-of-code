def length_of_longest_substring(s):
    char_set = set()
    left = 0
    max_length = 0

    for right in range(len(s)):
        while s[right] in char_set:
            print(s[left])
            char_set.remove(s[left])
            left += 1
        char_set.add(s[right])
        max_length = max(max_length, right - left + 1)

    return max_length


# Example usage
input_string = "abcabcbb"
print(
    length_of_longest_substring(input_string)
)  # Outputs 3, as "abc" is the longest substring without repeating characters
