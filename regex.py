"""
Author: Jorge Nieto
Date: March 23, 2026
Project: Regular Expression Test for Root Detection
Purpose: Lexical analysis parser using regex to detect "bene" or "scend"
"""

import re


def matches_regex(input_string):
    """
    Matches strings in the language Σ* (bene | scend) Σ* using an explicit regex equivalent.
    """

    if len(input_string) == 0:
        return False

    if not input_string.isalpha() or not input_string.islower():
        return False

    pattern = r".*(bene|scend).*"
    return re.fullmatch(pattern, input_string) is not None


def parse_word(word):
    """
    Prints whether the word is accepted or rejected.
    """
    if matches_regex(word):
        print(f"{word} -> ACCEPTED")
    else:
        print(f"{word} -> REJECTED")


def menu():
    """
    Displays menu options.
    """
    print("\n--- REGEX ROOT DETECTOR ---")
    print("1. Test a word")
    print("2. Exit")


def main():
    """
    Main program with menu.
    """
    while True:
        menu()
        option = input("Choose an option: ")

        if option == "1":
            word = input("Enter a word (lowercase letters only): ")
            parse_word(word)

        elif option == "2":
            print("Exiting program...")
            break

        else:
            print("Invalid option. Try again.")


if __name__ == "__main__":
    main()