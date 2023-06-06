class Hangman{
    lazy var word: String = chooseWord()
    lazy var wordsCollection: [String] = ["python", "java", "javascript", "php"]
    
    init(){}
    
    func chooseWord() -> String{
        return wordsCollection.randomElement()!
    }
    
    func compareWords(_ userInput: String) -> Bool{
        if word.lowercased() == userInput.lowercased(){
            return true
        }
        return false
    }
    
}

let hangman: Hangman = Hangman()
print(hangman.word)
print("> ", terminator: " ")
var userInput: String = String(readLine()!)
if hangman.compareWords(userInput) == true{
    print("You won!")
} else {
    print("You lost. Correct word was \(hangman.word)")
}
