#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <ctime>

/**
 * Hello World in C++
 * 
 * This program demonstrates various C++ features including:
 * - Basic I/O operations
 * - Functions
 * - Classes and objects
 * - STL containers and algorithms
 * - Namespaces
 * 
 * To compile and run:
 * g++ -std=c++11 hello.cpp -o hello && ./hello
 * or
 * clang++ -std=c++11 hello.cpp -o hello && ./hello
 */

using namespace std;

// Function declarations
void printHello();
void printHelloTo(const string& name);
string getGreeting(const string& name = "World");

// Class definitions
class Greeter {
private:
    string greeting;

public:
    // Constructor
    Greeter(const string& greet = "Hello") : greeting(greet) {}
    
    // Method to greet
    string greet(const string& name = "World") const {
        return greeting + ", " + name + "!";
    }
    
    // Setter and getter
    void setGreeting(const string& greet) {
        greeting = greet;
    }
    
    string getGreeting() const {
        return greeting;
    }
};

class Person {
private:
    string firstName;
    string lastName;

public:
    // Constructor
    Person(const string& first, const string& last) 
        : firstName(first), lastName(last) {}
    
    // Get full name
    string getFullName() const {
        return "Hello, my name is " + firstName + " " + lastName + "!";
    }
    
    // Getters
    string getFirstName() const { return firstName; }
    string getLastName() const { return lastName; }
};

int main() {
    // Simple Hello World
    cout << "Hello, World!" << endl;
    cout << endl;

    // Hello World with variables
    string greeting = "Hello";
    string name = "World";
    cout << greeting << ", " << name << "!" << endl;
    cout << endl;

    // Using functions
    printHello();
    printHelloTo("C++ Developer");
    cout << getGreeting() << endl;
    cout << getGreeting("C++ Programmer") << endl;
    cout << endl;

    // Using classes
    Greeter greeter("Hello");
    cout << greeter.greet() << endl;
    cout << greeter.greet("C++ Expert") << endl;
    
    greeter.setGreeting("Hi");
    cout << greeter.greet("Friend") << endl;
    cout << endl;

    // Using Person class
    Person person("John", "Doe");
    cout << person.getFullName() << endl;
    cout << endl;

    // Working with STL vectors
    vector<string> greetings = {
        "Hello",
        "Hi",
        "Hey",
        "Greetings",
        "Howdy"
    };

    cout << "Different greetings:" << endl;
    for (const auto& greet : greetings) {
        cout << "- " << greet << ", World!" << endl;
    }
    cout << endl;

    // Using STL algorithms
    cout << "Greetings in alphabetical order:" << endl;
    sort(greetings.begin(), greetings.end());
    for (const auto& greet : greetings) {
        cout << "- " << greet << endl;
    }
    cout << endl;

    // Display system information
    cout << "System Information:" << endl;
    
    // Get current date and time
    time_t now = time(0);
    char* dt = ctime(&now);
    cout << "Current Date/Time: " << dt;
    
    cout << "C++ Version: ";
    #if __cplusplus == 202002L
        cout << "C++20" << endl;
    #elif __cplusplus == 201703L
        cout << "C++17" << endl;
    #elif __cplusplus == 201402L
        cout << "C++14" << endl;
    #elif __cplusplus == 201103L
        cout << "C++11" << endl;
    #else
        cout << "Pre-C++11" << endl;
    #endif

    cout << "Compiler: ";
    #ifdef __GNUC__
        cout << "GCC " << __GNUC__ << "." << __GNUC_MINOR__ << endl;
    #elif defined(_MSC_VER)
        cout << "MSVC " << _MSC_VER << endl;
    #elif defined(__clang__)
        cout << "Clang " << __clang_major__ << "." << __clang_minor__ << endl;
    #else
        cout << "Unknown" << endl;
    #endif

    return 0;
}

// Function implementations
void printHello() {
    cout << "Hello from a function!" << endl;
}

void printHelloTo(const string& name) {
    cout << "Hello, " << name << "!" << endl;
}

string getGreeting(const string& name) {
    return "Hello, " + name + "!";
}
