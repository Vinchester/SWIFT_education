class Hangman{
    lazy var word: String = chooseWord()
    lazy var wordsCollection: [String] = ["python", "java", "javascript", "php"]
    lazy var word: String = chooseWord()
    lazy var guessedPart: String = String(repeating: "-", count: word.count)
    var tries: Int = 8

    init(){}

    func chooseWord() -> String{
        return wordsCollection.randomElement()!
    }

    func compareWords(_ userInput: String) -> Bool{
        if word.lowercased() == userInput.lowercased(){
    func compareWords() -> Bool{
        if word.lowercased() == guessedPart.lowercased(){
            return true
        }
        return false
    }

    func findEntries(_ letter: Character){
        if guessedPart.contains(letter){
            print("No improvements")
        } else if word.contains(letter){
            for i in 0..<word.count{
                let index = word.index(word.startIndex, offsetBy: i)
                if word[index] == letter{
                    guessedPart.replaceSubrange(index...index, with: String(letter))
                }
            }
        } else {
            print("That letter doesn't appear in the word")
            tries -= 1
        }
    }
}

let hangman: Hangman = Hangman()
print(hangman.word)
print("> ", terminator: " ")
var userInput: String = String(readLine()!)
if hangman.compareWords(userInput) == true{
//print(hangman.word)
print("HANGMAN")
while hangman.compareWords() == false{
    if hangman.tries == 0 {
        break
    }
    print("\(hangman.guessedPart), Left tries - \(hangman.tries)")
    print("> ", terminator: " ")
    let userLetter: Character = Character(readLine()!)
    hangman.findEntries(userLetter)

}

if hangman.compareWords() == true{
    print("You won!")
} else {
    print("You lost. Correct word was \(hangman.word)")
