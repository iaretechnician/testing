using System;
using System.Collections.Generic;
using System.Linq;

namespace HelloWorld
{
    /// <summary>
    /// Hello World in C#
    /// 
    /// This program demonstrates various C# features including:
    /// - Basic console output
    /// - Methods and functions
    /// - Classes and objects
    /// - Properties and constructors
    /// - Collections and LINQ
    /// 
    /// To compile and run:
    /// dotnet run (if using .NET SDK)
    /// or
    /// csc Hello.cs && Hello.exe (using C# compiler)
    /// or
    /// mcs Hello.cs && mono Hello.exe (using Mono)
    /// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            // Simple Hello World
            Console.WriteLine("Hello, World!");
            Console.WriteLine();

            // Hello World with variables
            string greeting = "Hello";
            string name = "World";
            Console.WriteLine($"{greeting}, {name}!");
            Console.WriteLine();

            // Using methods
            PrintHello();
            PrintHelloTo("C# Developer");
            Console.WriteLine();

            // Using classes
            Greeter greeter = new Greeter("Hello");
            Console.WriteLine(greeter.Greet());
            Console.WriteLine(greeter.Greet("C# Programmer"));
            Console.WriteLine();

            // Using properties
            Person person = new Person
            {
                FirstName = "John",
                LastName = "Doe"
            };
            Console.WriteLine(person.GetFullName());
            Console.WriteLine();

            // Working with collections
            List<string> greetings = new List<string>
            {
                "Hello",
                "Hi",
                "Hey",
                "Greetings",
                "Howdy"
            };

            Console.WriteLine("Different greetings:");
            foreach (var greet in greetings)
            {
                Console.WriteLine($"- {greet}, World!");
            }
            Console.WriteLine();

            // Using LINQ
            var longGreetings = greetings.Where(g => g.Length > 3).ToList();
            Console.WriteLine("Greetings longer than 3 characters:");
            longGreetings.ForEach(g => Console.WriteLine($"- {g}"));
            Console.WriteLine();

            // Display system information
            Console.WriteLine("System Information:");
            Console.WriteLine($"Current Date/Time: {DateTime.Now}");
            Console.WriteLine($"Operating System: {Environment.OSVersion}");
            Console.WriteLine($".NET Version: {Environment.Version}");
            Console.WriteLine($"Machine Name: {Environment.MachineName}");
            Console.WriteLine($"User Name: {Environment.UserName}");
        }

        /// <summary>
        /// Prints a simple hello message
        /// </summary>
        static void PrintHello()
        {
            Console.WriteLine("Hello from a method!");
        }

        /// <summary>
        /// Prints a personalized hello message
        /// </summary>
        /// <param name="name">The name to greet</param>
        static void PrintHelloTo(string name)
        {
            Console.WriteLine($"Hello, {name}!");
        }
    }

    /// <summary>
    /// A simple greeter class
    /// </summary>
    public class Greeter
    {
        private string greeting;

        public Greeter(string greeting = "Hello")
        {
            this.greeting = greeting;
        }

        public string Greet(string name = "World")
        {
            return $"{greeting}, {name}!";
        }
    }

    /// <summary>
    /// A person class demonstrating properties
    /// </summary>
    public class Person
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public string GetFullName()
        {
            return $"Hello, my name is {FirstName} {LastName}!";
        }
    }
}
