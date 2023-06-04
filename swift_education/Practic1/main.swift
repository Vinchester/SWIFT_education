import Foundation


class ChatBot{
	static func sayHello(){
        print("Hello! My name is swift_bot")
        print("I was created in 2023.")
		print("Please, remind me your name.")
		let name: String = String(readLine()!)
		print("What a great name you have, \(name)!")
    }
}


ChatBot.sayHello()
