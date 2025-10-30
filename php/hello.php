<?php
/**
 * Hello World in PHP
 * 
 * This is a simple PHP script that demonstrates basic PHP syntax.
 * Run this file with: php hello.php
 */

// Simple Hello World
echo "Hello, World!\n";

// Hello World with HTML
echo "<h1>Hello, World from PHP!</h1>\n";

// Hello World with variables
$greeting = "Hello";
$name = "World";
echo "$greeting, $name!\n";

// Hello World with a function
function sayHello($name = "World") {
    return "Hello, " . $name . "!";
}

echo sayHello() . "\n";
echo sayHello("PHP Developer") . "\n";

// Hello World with a class
class Greeter {
    private $greeting;
    
    public function __construct($greeting = "Hello") {
        $this->greeting = $greeting;
    }
    
    public function greet($name = "World") {
        return $this->greeting . ", " . $name . "!";
    }
}

$greeter = new Greeter();
echo $greeter->greet() . "\n";
echo $greeter->greet("PHP Programmer") . "\n";

// Current date and time
echo "Current date and time: " . date("Y-m-d H:i:s") . "\n";

// Server information
echo "PHP Version: " . phpversion() . "\n";
?>
