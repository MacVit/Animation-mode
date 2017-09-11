//
//  ViewController.swift
//  Animation mode
//
//  Created by Vitaliy Maksymlyuk on 9/10/17.
//  Copyright © 2017 Vitaliy Maksymlyuk. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocketImg: UIImageView!
    @IBOutlet weak var rocketStateLbl: UILabel!
    @IBOutlet weak var turnStateLbl: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = Bundle.main.path(forResource: "rocketOn", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

    @IBAction func powerBtnPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 3, animations: {
            
            self.rocketImg.frame = CGRect(x: 0, y: 280, width: 375, height: 125)
            
        }) { (finished) in
            
            self.rocketStateLbl.isHidden = false
            self.turnStateLbl.isHidden = false
        }
    }
    

}

