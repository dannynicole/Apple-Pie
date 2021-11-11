//
//  ViewController.swift
//  Apple Pie
//
//  Created by Dana Lucas on 11/9/21.
//

import UIKit

class ViewController: UIViewController {
var listOfWords = ["script", "java", "python","javascript","mali","ruby"]
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0{
        didSet{
            newRound()
        }
    }
    var totalLosses = 0{
        didSet{
            newRound()
        }
}
    
    @IBOutlet var LetterButton: [UIButton]!
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var correctWordLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view.
    }
   
    var currentGame: Game!


    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
        letters.append(String(letter))
        }
    
    let wordWithSpacing = letters.joined(separator: " ")
     correctWordLabel.text = wordWithSpacing

    scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
    treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")

    }

    

func updateGameState() {
if currentGame.incorrectMovesRemaining == 0 {
totalLosses += 1
    }
else if currentGame.word == currentGame.formattedWord {
totalWins += 1
    }
else {
updateUI()
    }
     }

    @IBAction func ButtonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateUI()
        updateGameState()


    }
    
    func enableLetterButton(_ enable: Bool) {
    for button in LetterButton {
    button.isEnabled = enable
    }
    }
    
    func newRound() {
    if !listOfWords.isEmpty {
    let newWord = listOfWords.removeFirst()
    currentGame = Game(word: newWord, incorrectMovesRemaining:
    incorrectMovesAllowed, guessedLetters: [])
    enableLetterButton(true)
    updateUI()
    }
    else {
    enableLetterButton(false)
    }
    }

   

    
}

