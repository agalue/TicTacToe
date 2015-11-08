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
    
    @IBAction func buttonAction(sender: UIButton) {
        sender.setTitle(getNext(), forState: .Normal)
        sender.enabled = false
    }
    
    func getNext() -> String {
        nextChar = nextChar == "X" ? "0" : "X"
        return nextChar
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

