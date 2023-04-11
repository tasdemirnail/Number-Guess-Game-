//
//  ResultViewController.swift
//  GuessGame
//
//  Created by Nail on 10.04.23.
//

import UIKit

class ResultViewController: UIViewController {
    var result:Bool?
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var imageViewResult: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
       print(result!)
        
        if result! {
            labelResult.text = "You Are Win !"
            imageViewResult.image = UIImage(named: "happy")
        }else{
            labelResult.text = "You Are Lost !"
            imageViewResult.image = UIImage(named: "sad")
        }
    }
    

    @IBAction func againButton(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
}
