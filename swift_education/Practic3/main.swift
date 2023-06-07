class TicTacToe {
    var field: [[Character]] = Array(repeating: Array(repeating: "_", count: 3), count: 3)
    lazy var status: String = decideStartStatus()
    var moves: [Int] = []
    var (line, column): (Int, Int) = (0, 0)
    
    func printBoard(){
        print("_____")
        for i in 0...2{
            for j in 0...2{
                print(field[i][j], terminator: " ")
            }
            print("\n")
        }
        print("‾‾‾‾‾‾")
    }
    
    func decideStartStatus() -> String{
        let statuses = ["Computer", "Player"]
        return statuses.randomElement()!
    }
    
    func computerMove() -> Void{
        func generateCoordinates(){
            (line, column) = (Int.random(in: 0...2), Int.random(in: 0...2))
        }
        
        generateCoordinates()
        while field[line][column] != "_"{
            generateCoordinates()
        }
        field[line][column] = "X"
        
    }
    
    func playerMove() {
        print("It's your move")

        func lineRead() -> Int {
            print("Input line coordinate:\n>", terminator: " ")
            if let line = Int(readLine()!) {
                if line > 0 && line <= 3 {
                    return line
                }
            }
            print("Invalid input. Please enter an integer between 1 and 3 for the line coordinate.")
            return lineRead()
        }

        func columnRead() -> Int {
            print("Input column coordinate:\n>", terminator: " ")
            if let column = Int(readLine()!) {
                if column > 0 && column <= 3 {
                    return column
                }
            }
            print("Invalid input. Please enter an integer between 1 and 3 for the column coordinate.")
            return columnRead()
        }

        let line = lineRead() - 1
        let column = columnRead() - 1

        if field[line][column] != "_" {
            print("That field is not free. Please choose another move.")
            playerMove()
        } else {
            field[line][column] = "O"
        }
    }

    func checkDiagonals() -> Bool {
        if field[0][0] == field[1][1] && field[1][1] == field[2][2] && field[0][0] != "_" {
            return true
        } else if field[0][2] == field[1][1] && field[1][1] == field[2][0] && field[0][2] != "_" {
            return true
        } else {
            return false
        }
    }
    
    func checkLines() -> Bool{
        for i in 0...2 {
            if field[i][0] == field[i][1] && field[i][1] == field[i][2] && field[i][0] != "_" {
                return true
            }
        }
        return false
    }
    
    func checkColumns() -> Bool {
        for i in 0...2 {
            if field[0][i] == field[1][i] && field[1][i] == field[2][i] && field[0][i] != "_" {
                return true
            }
        }
        return false
    }
    
    func game() -> Void {
        if checkDiagonals() || checkLines() || checkColumns() {
            print("\(status) won!")
            fatalError()
        } else if !field.joined().contains("_") {
            print("That`s a draw!")
            fatalError()
        }
        
        switch status{
        case "Computer":
            computerMove()
            status="Player"
        case "Player":
            playerMove()
            status="Computer"
        default:
            print("Error")
        }
        printBoard()
        
    }
    
}

var ticTacToe = TicTacToe()
ticTacToe.printBoard()

while ticTacToe.status != "End"{
    ticTacToe.game()
}
