//
//  ViewController.swift
//  lionsAndTigers
//
//  Created by victor sanchez on 11/13/14.
//  Copyright (c) 2014 victor sanchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    
    // Properties go over here to have global Scope
    var myTigers:[Tiger] = []
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTiger = Tiger()
        var secondTiger = Tiger()
        var thirdTiger = Tiger()
        var fourthTiger = Tiger()

        myTiger.name = "Tony"
        myTiger.age = 27
        myTiger.breed = "bangle"
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTigers.append(myTiger)
        myTigers += [secondTiger, thirdTiger, fourthTiger]
    
        println("my tigers name is \(myTiger.name), its' age is \(myTiger.age), its breed is \(myTiger.breed), and this is what he looks like! \(myTiger.image) ")
        
//        myImageView.image = myTiger.image
//        nameLabel.text = myTiger.name
//        ageLabel.text = "\(myTiger.age)"
//        breedLabel.text = myTiger.breed
        
        secondTiger.name = "Eureka"
        secondTiger.breed = "IndochineseTiger"
        secondTiger.age = 26
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        
        thirdTiger.name = "Victor"
        thirdTiger.breed = "MalayanTiger"
        thirdTiger.age = 29
        thirdTiger.image = UIImage(named:"MalayanTiger.jpg")
        
        fourthTiger.name = "Steven"
        fourthTiger.breed = "SiberianTiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonPressed(sender: UIBarButtonItem) {
        
        var randomIndex:Int
        
        do{
            
            randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        
        } while currentIndex == randomIndex
        
        currentIndex = randomIndex
        
        let tiger = myTigers[randomIndex]
        
//        myImageView.image = tiger.image
//        nameLabel.text = tiger.name
//        ageLabel.text = "\(tiger.age)"
//        breedLabel.text = tiger.breed
        
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            self.myImageView.image = tiger.image
            self.nameLabel.text = tiger.name
            self.ageLabel.text = "\(tiger.age)"
            self.breedLabel.text = tiger.breed
            
            }, completion: {
                (finished: Bool) -> () in
                
        })
        
        

    
    }

}

