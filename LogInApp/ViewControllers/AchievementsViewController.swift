//
//  AchievementsViewController.swift
//  LogInApp
//
//  Created by Дмитрий Ивашинин on 01.09.2021.
//

import UIKit

class AchievementsViewController: UIViewController {

    @IBOutlet var achievementsLabel: UILabel!
    @IBOutlet var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.height / 2
        }
    }
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        achievementsLabel.text = user.person.aboutInfo.achievments
        imageView.image = UIImage(named: user.person.aboutInfo.image)
    }

}
