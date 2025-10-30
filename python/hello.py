#!/usr/bin/env python3
"""
Hello World in Python

This script demonstrates various Python features including:
- Basic print statements
- Functions
- Classes
- List comprehensions
- Type hints (Python 3.5+)
- Decorators

To run:
python hello.py
or
python3 hello.py
"""

import sys
import platform
from datetime import datetime
from typing import List, Optional


def print_hello() -> None:
    """Prints a simple hello message."""
    print("Hello from a function!")


def print_hello_to(name: str) -> None:
    """
    Prints a personalized hello message.
    
    Args:
        name: The name to greet
    """
    print(f"Hello, {name}!")


def get_greeting(name: str = "World") -> str:
    """
    Returns a greeting message.
    
    Args:
        name: The name to greet (default: "World")
    
    Returns:
        A greeting string
    """
    return f"Hello, {name}!"


class Greeter:
    """A simple greeter class."""
    
    def __init__(self, greeting: str = "Hello"):
        """
        Initialize the Greeter.
        
        Args:
            greeting: The greeting to use (default: "Hello")
        """
        self._greeting = greeting
    
    def greet(self, name: str = "World") -> str:
        """
        Generate a greeting message.
        
        Args:
            name: The name to greet (default: "World")
        
        Returns:
            A greeting string
        """
        return f"{self._greeting}, {name}!"
    
    @property
    def greeting(self) -> str:
        """Get the current greeting."""
        return self._greeting
    
    @greeting.setter
    def greeting(self, value: str) -> None:
        """Set a new greeting."""
        self._greeting = value


class Person:
    """A person class demonstrating properties and methods."""
    
    def __init__(self, first_name: str, last_name: str):
        """
        Initialize a Person.
        
        Args:
            first_name: The person's first name
            last_name: The person's last name
        """
        self.first_name = first_name
        self.last_name = last_name
    
    def get_full_name(self) -> str:
        """Return the full name with a greeting."""
        return f"Hello, my name is {self.first_name} {self.last_name}!"
    
    def __str__(self) -> str:
        """String representation of the person."""
        return f"{self.first_name} {self.last_name}"
    
    def __repr__(self) -> str:
        """Official string representation of the person."""
        return f"Person('{self.first_name}', '{self.last_name}')"


def demonstrate_comprehensions() -> None:
    """Demonstrate list comprehensions and filtering."""
    greetings = ["Hello", "Hi", "Hey", "Greetings", "Howdy"]
    
    print("Different greetings:")
    for greet in greetings:
        print(f"- {greet}, World!")
    print()
    
    # List comprehension
    long_greetings = [g for g in greetings if len(g) > 3]
    print("Greetings longer than 3 characters:")
    for greet in long_greetings:
        print(f"- {greet}")
    print()
    
    # Using map and lambda
    uppercase_greetings = list(map(lambda x: x.upper(), greetings))
    print("Uppercase greetings:")
    for greet in uppercase_greetings:
        print(f"- {greet}")
    print()


def show_system_info() -> None:
    """Display system information."""
    print("System Information:")
    print(f"Current Date/Time: {datetime.now()}")
    print(f"Python Version: {sys.version}")
    print(f"Platform: {platform.platform()}")
    print(f"System: {platform.system()}")
    print(f"Machine: {platform.machine()}")
    print(f"Processor: {platform.processor()}")


def main() -> None:
    """Main function demonstrating all features."""
    # Simple Hello World
    print("Hello, World!")
    print()
    
    # Hello World with variables
    greeting = "Hello"
    name = "World"
    print(f"{greeting}, {name}!")
    print()
    
    # Using functions
    print_hello()
    print_hello_to("Python Developer")
    print(get_greeting())
    print(get_greeting("Python Programmer"))
    print()
    
    # Using classes
    greeter = Greeter()
    print(greeter.greet())
    print(greeter.greet("Python Expert"))
    
    greeter.greeting = "Hi"
    print(greeter.greet("Friend"))
    print()
    
    # Using Person class
    person = Person("John", "Doe")
    print(person.get_full_name())
    print(f"String representation: {str(person)}")
    print(f"Repr: {repr(person)}")
    print()
    
    # Demonstrate comprehensions
    demonstrate_comprehensions()
    
    # Display system information
    show_system_info()


if __name__ == "__main__":
    main()
