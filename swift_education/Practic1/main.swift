import Foundation


class ChatBot{
	static func sayHello(){
        print("Hello! My name is swift_bot")
        print("I was created in 2023.")
		print("Please, remind me your name.\n>", terminator: " ")
		let name: String = String(readLine()!)
		print("What a great name you have, \(name)!")
    }
	
	static func printAgeMenu(){
		print("Let me guess your age.")
		print("Enter remainders of dividing your age by 3, 5 and 7.")
	}
	
	static func guessAge(){
		print(">", terminator: " ")
		guard let remainder3: Int = Int(readLine()!) else {
			print("Wrong type of input value! Integers only!")
			guessAge()
			return
		}
		print(">", terminator: " ")
		guard let remainder5: Int = Int(readLine()!) else {
			print("Wrong type of input value! Integers only!")
			guessAge()
			return
		}
		print(">", terminator: " ")
		guard let remainder7: Int = Int(readLine()!) else {
			print("Wrong type of input value! Integers only!")
			guessAge()
			return
		}
		let age: Int = (remainder3 * 70) + (remainder5 * 21) + (remainder7 * 15) % 105
		print("Your age is \(age); that's a good time to start programming!")
	}
	
	static func printCountingMenu(){
		print("Now I will prove to you that I can count to any number you want.\n>", terminator: " ")
	}
	
	static func counting(){
		guard let number: Int = Int(readLine()!) else {
			print("You typed incorrect values!!!Integers only")
			counting()
			return
		}
		for i in 0...number {
			print("\(i)!")
		}
		print("Completed, have a nice day!")
	}
}

func ChatBotWork(){
	ChatBot.sayHello()
	ChatBot.printAgeMenu()
	ChatBot.guessAge()
	ChatBot.printCountingMenu()
	ChatBot.counting()
}


ChatBotWork()
