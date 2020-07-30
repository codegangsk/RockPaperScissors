//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Sophie Kim on 2020/07/11.
//  Copyright © 2020 Sophie Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var rockSign: UIButton!
    @IBOutlet weak var paperSign: UIButton!
    @IBOutlet weak var scissorSign: UIButton!
    @IBOutlet weak var playAgain: UIButton!
}

extension ViewController {
    func resetBoard(){
        appSign.text = "🤖"
        gameStatus.text = "Rock, Paper, Scissors?"
        rockSign.isHidden = false
        rockSign.isEnabled = true
        paperSign.isHidden = false
        paperSign.isEnabled = true
        scissorSign.isHidden = false
        scissorSign.isEnabled = true
    }
    
    func play(_ playerTurn: Sign) {
        rockSign.isEnabled = false
        paperSign.isEnabled = false
        scissorSign.isEnabled = false
        
        let opponent = randomSign()
        appSign.text = opponent.emoji
        let gameResult = playerTurn.takeTurn(opponent)
        
        switch gameResult {
        case .draw:
            gameStatus.text = "It's a draw."
        case.lose:
            gameStatus.text = "Sorry, you're the loser."
        case .win:
            gameStatus.text = "You're the winner!"
        case .start:
            gameStatus.text = "Rock, Paper, Scissors?"
            
        }
        
        switch playerTurn {
        case .rock:
            rockSign.isHidden = false
            paperSign.isHidden = true
            scissorSign.isHidden = true
        case .paper:
            rockSign.isHidden = true
            paperSign.isHidden = false
            scissorSign.isHidden = true
        case .scissors:
            rockSign.isHidden = true
            paperSign.isHidden = true
            scissorSign.isHidden = false
        }
    }
}

extension ViewController {
    @IBAction func rockSign(_ sender: Any) {
        play(Sign.rock)
    }
    
    @IBAction func paperSign(_ sender: Any) {
        play(Sign.paper)
    }
    
    @IBAction func scissorSign(_ sender: Any) {
        play(Sign.scissors)
    }
    
    @IBAction func playAgain(_ sender: Any) {
        resetBoard()
    }
}
