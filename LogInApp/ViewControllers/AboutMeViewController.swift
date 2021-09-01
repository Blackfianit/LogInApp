//
//  AboutMeViewController.swift
//  LogInApp
//
//  Created by Дмитрий Ивашинин on 30.08.2021.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var hobbyLabel: UILabel!
    
    
    var user: User!
    override func viewDidLoad() {
        super.viewDidLoad()
        heightLabel.text = String(user.person.aboutInfo.height)
        weightLabel.text = String(user.person.aboutInfo.weight)
        hobbyLabel.text = String(user.person.aboutInfo.interests)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let achieveVC = segue.destination as? AchievementsViewController else { return }
        achieveVC.user = user
    }
  
}
