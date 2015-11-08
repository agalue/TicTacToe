//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alejandro Galue on 11/8/15.
//  Copyright © 2015 Street Dog Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var nextChar = "X"
    var board = Matrix(rows: 3, columns: 3)
    
    @IBAction func buttonAction(sender: UIButton) {
        let char = getNext()
        sender.setTitle(char, forState: .Normal)
        sender.enabled = false
        board[sender.tag - 1] = getValue(char)
        checkBoardStatus()
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
            alert(score > 0 ? "Noughts wins" : "Crosses wins")
        }
    }
    
    func getNext() -> String {
        nextChar = nextChar == "X" ? "0" : "X"
        return nextChar
    }
    
    func getValue(t : String) -> Int {
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
                btn.setTitle("", forState: .Normal)
                btn.enabled = true
            }
        }
    }

    func alert(message : String) {
        let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {(alert: UIAlertAction!) in self.cleanBoard() }))
        presentViewController(alert, animated: true, completion: nil)
    }
}

