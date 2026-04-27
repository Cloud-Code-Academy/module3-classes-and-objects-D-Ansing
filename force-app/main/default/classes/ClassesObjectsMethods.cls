/**
 * The ClassesObjectsMethods class serves as an exploration into Object Oriented Programming in Apex.
 * It covers fundamental aspects such as class instantiation, method creation, encapsulation, and object interaction.
 *
 * This class introduces developers to the concept of creating and manipulating objects in Apex. It discusses
 * how to define classes, create methods, and use objects. This class uses two example classes - Person and Book.
 * 
 * Topics covered in this class include:
 * - Understanding how to define a class in Apex.
 * - Understanding how to create methods in Apex.
 * - Understanding how to instantiate objects of a class.
 * - Understanding encapsulation and the importance of getter and setter methods.
 *
 * Users of this class can expect to gain a strong understanding of Object Oriented Programming in Apex and
 * be prepared for more advanced topics in Salesforce development.
 * 
 * The Person class is a simple representation of a person with properties like name and age, and a method
 * that allows the person to introduce themselves.
 * 
 * The Book class is a simple representation of a book with properties like title and author, and methods
 * to read and close the book.
 * 
 * Resources:
 * String class: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_string.htm
 * Date class: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_date.htm
 * Math class: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_math.htm
 * Classes: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_understanding.htm
 *
 * @author Dirk-Jan Ansing
 */

public with sharing class ClassesObjectsMethods {
    
    /**
     * Question 1
     * It initializes a String to "Hello, Salesforce!" and demonstrates usage of
     * the length, substring, and toLowerCase methods of the String class.
     * Example: practiceStringMethods() should return a list like ["17", "Hello", "hello, salesforce!"].
     * @return A list containing the length of the string, a substring of the string, and the string in lower case.
     */
    public static List<String> practiceStringMethods() {
        list<string> returnValues = new list<string>();
        string sentence = 'Hello, Salesforce!';
        returnValues.add(string.valueOf(sentence.length()));
        returnValues.add(sentence.left(5));
        returnvalues.add(sentence.tolowercase());
        return returnValues;
    }

    /**
     * Question 2
     * Check if the input string starts with 'Sales', ends with 'Force', and contains 'Awesome'.
     * Example: checkStringContent('Salesforce is Awesome!') should return a list like [true, false, true].
     * @param input The input string.
     * @return A list of boolean values indicating whether the string starts with 'Sales', ends with 'Force', or contains 'Awesome'.
     */
    public static List<Boolean> checkStringContent(String input) {
        if(input == null || input == ''){
            return null;
        } else {
        list<boolean> returnValues = new list<boolean>();
        returnValues.add(input.startsWith('Sales'));
        returnValues.add(input.endswith('Force'));
        returnValues.add(input.contains('Awesome'));
        return returnValues;
        }
    }

    /**
     * Question 3
     * Take a sentence then remove any duplicate words, and return the sentence with only unique words.
     * Example: removeDuplicateWords('Hello Hello Salesforce Salesforce') should return 'Hello Salesforce'.
     * @param sentence The input sentence.
     * @return A string consisting of only unique words from the input sentence.
     */
    public static String removeDuplicateWords(String sentence) {
        if(sentence == null || sentence == ''){
          return null;
        } else {
            sentence = sentence.replaceAll('\\s+',' ').trim();
            set<string> wordsSet = new set<string>(sentence.split(' '));
            return string.join(wordsSet,' ');
        }
    }

    /**
     * Question 4
     * This method takes a string as a parameter, and calculates the number of vowels in the string.
     * For simplicity, we will consider only five vowels: 'a', 'e', 'i', 'o', 'u', and we will ignore case.
     * Example: countVowels("Hello World!") should return 3
     * @param str The string in which to count vowels.
     * @return The number of vowels in the string.
     */
    public static Integer countVowels(String str) {
        if(str == null || str == ''){
            return null;
        } else {
            Integer returnValue = 0;
            list<string> chars = new list<string>(str.deleteWhitespace().toLowerCase().split(''));
            set<string> vowels = new set<string>{'a','e','i','o','u'}; 
            for (string c : chars) {
                if(vowels.contains(c)){
                    returnValue++;
                }
            }
        return returnValue;
        }
    }

    /**
     * Question 5
     * Given a list of scientist names, combine their names together with a comma if it contains the letter 'g'.
     * The final string should not end with a comma.
     * Example: findTheScientist() should return "Alan Turing,Grace Hopper,Guido van Rossum,Stephen Hawking"
     * @return A string containing the names of scientists that contain the letter 'g'.
     */
    public static String findTheScientist() {
        List<string> scientistNames = new List<string>{'Tim Berners-Lee', 'Alan Turing', 'Grace Hopper', 'Donald Knuth', 'Guido van Rossum', 'Ken Thompson', 'Stephen Hawking'};
        list<string> selectedNames = new list<string>();
        for (string s : scientistNames) {
            if(s.contains('G') || s.contains('g')){
                selectedNames.add(s); 
            }
        }
        return string.join(selectedNames, ',');
    }

    /**
     * Question 6
     * This method calculates the absolute value of the difference between of two input numbers that are raised to the 2nd power.
     * Example: calculateDifferenceOfSquares(3, 4) should return 7.
     * @param a The first number.
     * @param b The second number.
     * @return The absolute value of the difference
     */
    public static Double calculateDifferenceOfSquares(Double a, Double b) {
        // Check for null values)
        if(a == null || b == null){
            return null;
        } else {
            return Math.abs(Math.pow(a, 2) - Math.pow(b, 2));
        }
    }

    /**
     * Question 7
     * Generate a random number between 50 and 100
     * Example: generateRandomNumber() should return a number like 75.
     * @return A integer between 50 and 100.
     */
    public static Integer generateRandomNumber() {
        return math.round((math.random()*50)+50); //Note: Define between? I've used 50 as minimum and 100 as maximum. Would be a question to ask stakeholders.
    }

    /**
     * Question 8
     * Format the current date in the current user locale format.
     * Example: getCurrentDate() should return a string like "3/21/2001" for US locale users. Locale/String may differ depending on your location.
     * @return The current date in the current user locale format.
     */
    public static String getCurrentDate() {
        return system.now().date().format();
    }

    /**
     * Question 9
     * Given a date time return the day of the week in number format
     * @param dt the current date and time
     * @return The number of the day of the week for the given date.
     */
    public static String getDayOfWeek(DateTime dt) {
        //create weekdays map
        map<string, string> weekdaysMap = new map<string, string>();
        weekdaysMap.put('Monday', '1');
        weekdaysMap.put('Tuesday', '2');
        weekdaysMap.put('Wednesday', '3');
        weekdaysMap.put('Thursday', '4');
        weekdaysMap.put('Friday', '5');
        weekdaysMap.put('Saturday', '6');
        weekdaysMap.put('Sunday', '7');
        //use map to generate weekday number
        string weekday = system.now().format('EEEE');
        return weekdaysMap.get(weekday);
        //return = system.now().format('u');    //Alternative-1 (Compact, but week numbering might start on sunday depending on region, less reliable)
        //return = string.valueof(math.mod(Date.newInstance(1900, 1, 7).daysBetween(system.now().date()),7));  //Alternative-2 (I'd prefer this one, it's clean, works anywhere, and only requires a single caracter change when changing the start of the week)
    }

    /**
     * Question 10
     * Calculate the difference between the years of two dates
     * For example, if the first date is 2023-01-01 and the second date is 2025-12-31, the method should return 2
     * If either of the dates is null, return null.
     * @param d1 The first date.
     * @param d2 The second date.
     * @return The a positive number years between the two dates, or null if either date is null.
     */
    public static Integer calculateYearDifference(Date d1, Date d2) {
        If(d1 == null || d2 == null){
            return null;
        }
        return math.abs(d1.year() - d2.year());
    }

    /**
     * Question 11
     * The Book class represents a book in a library. 
     * Each Book object has a title and an author, and methods to return these details.
     * This class can be used in the context of a library management system, bookstore, etc.
     * where you need to manipulate and manage book information.
     */
    public class Book {
        // Class variables
        public string title;
        public string author;
        public Integer pages;
        // Class constructor
        public Book(string title, string author) {
            this.title = title;
            this.author = author;
        }
        //class methods
        public String getBookDetails() {
            return ('Title: ' + this.title + ', Author: ' + this.author);
        }
    }
    

    /**
     * Question 12
     * Create a Book object and returns the details of the book.
     * For example, createAndGetBookDetails() should return a string like "Title: A Brief History of Time, Author: Stephen Hawking".
     * @return A string containing the details of the book.
     */
    public static String createAndGetBookDetails() {
        Book newBook = new Book('A Brief History of Time', 'Stephen Hawking');
        return newBook.getBookDetails();
    }

    /**
     * Question 13
     * Create and update two Book objects and returns the books.
     * For example, generateBookList(Book) should return a list like ["Title: Harry Potter and the Chamber of Secrets, Author: J.K. Rowling", "Title: A Brief History of Time, Author: Stephen Hawking"].
     * Update Book 1 values: title = "Harry Potter and the Chamber of Secrets", author = "J.K. Rowling", pages = 352
     * Book 2 values: title = "A Brief History of Time", author = "Stephen Hawking"
     * @param myBook1 The first book object.
     * @return return a list of books.
     */
    public static List<Book> generateBookList(Book myBook1) {
        IF(myBook1 == null || myBook1.title == null || myBook1.title == '' || myBook1.author == null || myBook1.author == ''){
            return null;
        } else {
            List<Book> bookList = new List<Book>{myBook1};
            bookList[0].title = 'Harry Potter and the Chamber of Secrets';
            bookList[0].author = 'J.K. Rowling';
            bookList[0].pages = 352;
            Book myBook2 = new Book('A Brief History of Time','Stephen Hawking');
            myBook2.pages = 256;
            bookList.add(myBook2);
            return bookList;
        }
    }


    /**
     * Question 14
     * The Person class represents a person.
     * Each Person object has a name and an age, and methods to return these details.
     * This class can be used in the context of a school, college, etc.
     * where you need to manipulate and manage person information.
     */
    public class Person {
        // Class Variables
        private string name;
        private integer age;
        // Class Constructor
        public Person (string name, integer age){
            this.name = name;
            this.age = age;    
        }
        // Class Methods
        public string introduceYourself(){
            return ('Hello, my name is ' + this.name + ' and I am ' + this.age + ' years old.');
        } 
        public void setName (string newName){
            this.name = newName;
        }
        public void setAge(Integer newAge){
            this.age = newAge;
        }
        public string getName(){
            return this.name;
        }
        public integer getAge(){
            return this.age;
        }
    }

    /**
     * Question 15
     * Create a Person object and returns the details of the person.
     * For example, personDetails() should return a list like ["Hello, my name is John Doe and I am 28 years old.", "John Doe", "28"].
     * @return A string containing the details of the person.
     */

    public static List<String> personDetails() {
        List<String> results = new List<String>();
        // Create a new instance of Person class
        Person crazyColleague = new person('John Doe', 28);
        //Set results variable
        results.add(crazyColleague.introduceYourself());
        results.add(crazyColleague.getName());
        results.add(crazyColleague.getAge().toString());
        return results;
    }

    /**
     * Question 16
     * Create a Person object with the provided name and age.
     * @param name The name of the person.
     * @param age The age of the person.
     * @return A new instance of the Person class.
     */
    public static Person createPerson(String name, Integer age) {
        IF(name == null || name == '' || age == null){
            return null;
        } else{
            Person newPerson = new Person (name, age);
            return newPerson;
        }
    }

    /**
     * Question 17
     * Create a method that constructs multiple Person objects.
     * You are to create a new Person object for each name in the provided List<String> of names,
     * using the same age for all Person objects. The method should return a List<Person> of all the Person objects created. 
     * @param names A list of names.
     * @param age The age to be set for all the Person objects.
     * @return A list of new Person objects.
     */
    public static List<Person> createMultiplePersons(List<String> names, Integer age) {
        IF(names == null || age == null){
            return null;
        } else {
            list<Person> personList = new list<Person>();
            for(string n : names){
                Person newPerson = new Person(n,age);
                personList.add(newPerson);
            }
            return personList;
        }
    }


    /**
     * Question 18
     * Compare two Person objects based on their ages.
     * If the first Person is older, the method should return the first Person. If the second Person is older, it should return the second Person.
     * If they are the same age, return either.
     *
     * @param person1 The first Person object.
     * @param person2 The second Person object.
     * @return The Person object of the older person.
     */
    public static Person getOlderPerson(Person person1, Person person2) {
        IF(person1 == null || person1.getAge() == null || person2 == null || person2.getAge() == null){
            return null;
        } else {
            return person1.getAge() > person2.getAge() ? person1 : person2;
        }
    }
    
}