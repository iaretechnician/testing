#!/usr/bin/env node

/**
 * Hello World in JavaScript (Node.js)
 * 
 * This script demonstrates various JavaScript features including:
 * - Basic console output
 * - Functions (regular and arrow)
 * - Classes (ES6+)
 * - Template literals
 * - Array methods (map, filter, forEach)
 * - Promises and async/await
 * 
 * To run:
 * node hello.js
 */

// Simple Hello World
console.log("Hello, World!");
console.log();

// Hello World with variables
const greeting = "Hello";
const name = "World";
console.log(`${greeting}, ${name}!`);
console.log();

// Function declarations
function printHello() {
    console.log("Hello from a function!");
}

function printHelloTo(name) {
    console.log(`Hello, ${name}!`);
}

function getGreeting(name = "World") {
    return `Hello, ${name}!`;
}

// Arrow functions
const getGreetingArrow = (name = "World") => `Hello, ${name}!`;

// Class definition
class Greeter {
    constructor(greeting = "Hello") {
        this._greeting = greeting;
    }
    
    greet(name = "World") {
        return `${this._greeting}, ${name}!`;
    }
    
    get greeting() {
        return this._greeting;
    }
    
    set greeting(value) {
        this._greeting = value;
    }
}

// Person class
class Person {
    constructor(firstName, lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }
    
    getFullName() {
        return `Hello, my name is ${this.firstName} ${this.lastName}!`;
    }
    
    toString() {
        return `${this.firstName} ${this.lastName}`;
    }
}

// Async function example
async function asyncGreeting(name = "World", delay = 1000) {
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve(`Hello (after ${delay}ms), ${name}!`);
        }, delay);
    });
}

// Main execution
(async function main() {
    // Using functions
    printHello();
    printHelloTo("JavaScript Developer");
    console.log(getGreeting());
    console.log(getGreeting("JavaScript Programmer"));
    console.log(getGreetingArrow("JS Coder"));
    console.log();
    
    // Using classes
    const greeter = new Greeter();
    console.log(greeter.greet());
    console.log(greeter.greet("JavaScript Expert"));
    
    greeter.greeting = "Hi";
    console.log(greeter.greet("Friend"));
    console.log();
    
    // Using Person class
    const person = new Person("John", "Doe");
    console.log(person.getFullName());
    console.log(`String representation: ${person.toString()}`);
    console.log();
    
    // Working with arrays
    const greetings = ["Hello", "Hi", "Hey", "Greetings", "Howdy"];
    
    console.log("Different greetings:");
    greetings.forEach(greet => {
        console.log(`- ${greet}, World!`);
    });
    console.log();
    
    // Using array methods
    const longGreetings = greetings.filter(g => g.length > 3);
    console.log("Greetings longer than 3 characters:");
    longGreetings.forEach(greet => {
        console.log(`- ${greet}`);
    });
    console.log();
    
    // Using map
    const uppercaseGreetings = greetings.map(g => g.toUpperCase());
    console.log("Uppercase greetings:");
    uppercaseGreetings.forEach(greet => {
        console.log(`- ${greet}`);
    });
    console.log();
    
    // Async/await example
    console.log("Waiting for async greeting...");
    const asyncResult = await asyncGreeting("Async World", 500);
    console.log(asyncResult);
    console.log();
    
    // Display system information
    console.log("System Information:");
    console.log(`Current Date/Time: ${new Date().toString()}`);
    console.log(`Node.js Version: ${process.version}`);
    console.log(`Platform: ${process.platform}`);
    console.log(`Architecture: ${process.arch}`);
    console.log(`Process ID: ${process.pid}`);
    console.log(`Working Directory: ${process.cwd()}`);
    
    // Memory usage
    const memUsage = process.memoryUsage();
    console.log("\nMemory Usage:");
    console.log(`- RSS: ${(memUsage.rss / 1024 / 1024).toFixed(2)} MB`);
    console.log(`- Heap Total: ${(memUsage.heapTotal / 1024 / 1024).toFixed(2)} MB`);
    console.log(`- Heap Used: ${(memUsage.heapUsed / 1024 / 1024).toFixed(2)} MB`);
    console.log(`- External: ${(memUsage.external / 1024 / 1024).toFixed(2)} MB`);
})();
