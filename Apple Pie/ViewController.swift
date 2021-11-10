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
    
    var totalWins = 0
    var totalLosses = 0
    
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

    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining:incorrectMovesAllowed)
        updateUI()
    }

    func updateUI() {
    scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
    treeImageView.image = UIImage(named: "Tree  \(currentGame.incorrectMovesRemaining)")

    }

    @IBAction func ButtonTapped(_ sender: UIButton) {
        
        sender.isEnabled = false
    }
    
}

