//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alejandro Galue on 11/8/15.
//  Copyright © 2015 Street Dog Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = "X"
    var board = Matrix(rows: 3, columns: 3)
    
    @IBAction func buttonAction(sender: UIButton) {
        let player = getNextPlayer()
        sender.enabled = false
        sender.setTitle(player, forState: .Normal)
        sender.alpha = 0
        UIView.animateWithDuration(0.5) { () -> Void in
            sender.alpha = 1
            self.board[sender.tag - 1] = self.getPlayerValue(player)
            self.checkBoardStatus()
        }
    }
    
    func checkBoardStatus() {
        // Check rows
        for var i = 0; i < 3; i++ {
            let row = board[i,0] + board[i,1] + board[i,2]
            if row == -3 || row == 3 {
                endGame(row)
                return;
            }
        }
        // Check columns
        for var i = 0; i < 3; i++ {
            let row = board[0,i] + board[1,i] + board[2,i]
            if row == -3 || row == 3 {
                endGame(row)
                return;
            }
        }
        // Check diagonals
        let d1 = board[0,0] + board[1,1] + board[2,2]
        if (d1 == -3 || d1 == 3) {
            endGame(d1)
            return;
        }
        let d2 = board[2,0] + board[1,1] + board[0,2]
        if (d2 == -3 || d2 == 3) {
            endGame(d2)
            return;
        }
        // Check full
        if (isFull()) {
            endGame(0)
        }
    }
    
    func isFull() -> Bool {
        for var i=0; i<3; i++ {
            for var j=0; j<3; j++ {
                if board[i,j] == 0 {
                    return false
                }
            }
        }
        return true
    }

    func endGame(score : Int) {
        if score == 0 {
            alert("It's a draw!")
        } else {
            alert((score > 0 ? "Noughts" : "Crosses") + " have won!")
        }
    }
    
    func getNextPlayer() -> String {
        activePlayer = activePlayer == "X" ? "0" : "X"
        return activePlayer
    }
    
    func getPlayerValue(t : String) -> Int {
        return t == "X" ? -1 : 1
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func cleanBoard() {
        board = Matrix(rows: 3, columns: 3)
        for var i = 1; i <= 9; i++ {
            if let btn = self.view.viewWithTag(i) as? UIButton {
                btn.enabled = true;
                btn.setTitle("", forState: .Normal)
            }
        }
    }

    func alert(message : String) {
        let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {(alert: UIAlertAction!) in self.cleanBoard() }))
        presentViewController(alert, animated: true, completion: nil)
    }
}

