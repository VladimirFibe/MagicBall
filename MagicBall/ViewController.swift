//
//  ViewController.swift
//  MagicBall
//
//  Created by Vladimir Fibe on 24.01.2022.
//

import UIKit

class ViewController: UIViewController {
  private let balls =  [#imageLiteral(resourceName: "ball1.png"), #imageLiteral(resourceName: "ball2.png"), #imageLiteral(resourceName: "ball3.png"), #imageLiteral(resourceName: "ball4.png"), #imageLiteral(resourceName: "ball5.png")]
  
  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func askButtonPressed(_ sender: UIButton) {
    imageView.image = balls.randomElement()
  }
}

