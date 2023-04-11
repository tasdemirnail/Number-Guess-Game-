//
//  GuessScreenViewController.swift
//  GuessGame
//
//  Created by Nail on 10.04.23.
//

import UIKit

class GuessScreenViewController: UIViewController {
    
    @IBOutlet weak var remainingGuess: UILabel!
    @IBOutlet weak var enterGuess: UITextField!
    @IBOutlet weak var helpLbl: UILabel!
    var randomNummer :Int?
    var reaminingRight = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomNummer = Int(arc4random_uniform(100))
        print("Random Nummer = \(randomNummer!)")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let data = sender as? Bool {
            let goToVc = segue.destination as! ResultViewController
            goToVc.result = data
            
        }
    }
   
    @IBAction func guess(_ sender: Any) {
        helpLbl.isHidden = false
        reaminingRight-=1
        
        if let data = enterGuess.text {
            
            if let yourGuess = Int(data) {
                
                if reaminingRight != 0 {
                    if yourGuess == randomNummer! {
                        print("You are win!")
                        let result = true
                        performSegue(withIdentifier: "Result", sender: result)
                    }
                    if yourGuess < randomNummer! {
                        helpLbl.text = "Up"
                        remainingGuess.text = "Remaining Guess Right : \(reaminingRight) "
                    }
                    if yourGuess > randomNummer! {
                        helpLbl.text = "Down"
                        remainingGuess.text = "Remaining Guess Right : \(reaminingRight) "
                    }
                    
                }else {
                    let result = false
                    performSegue(withIdentifier: "Result", sender: result)
                   
                }
                enterGuess.text = ""
                
            }
        }
    }
}
