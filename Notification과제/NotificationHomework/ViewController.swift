//
//  ViewController.swift
//  NotificationHomework
//
//  Created by 이다영 on 8/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var koreaButton: UIButton!
    @IBOutlet weak var chinaButton: UIButton!
    @IBOutlet weak var japanButton: UIButton!
    @IBOutlet weak var medalInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setupNotifications()
    }

    func setupButtons() {
        koreaButton.setTitle("🇰🇷", for: .normal)
        chinaButton.setTitle("🇨🇳", for: .normal)
        japanButton.setTitle("🇯🇵", for: .normal)
    }
    
    func setupNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateMedalInfo(_:)), name: .medalInfoUpdated, object: nil)
    }

    @IBAction func countryButtonTapped(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        var country = ""
        var gold = 0
        var silver = 0
        var bronze = 0
        
        switch button {
        case koreaButton:
            country = "한국"
            gold = 5
            silver = 3
            bronze = 7
        case chinaButton:
            country = "중국"
            gold = 8
            silver = 6
            bronze = 4
        case japanButton:
            country = "일본"
            gold = 6
            silver = 4
            bronze = 5
        default:
            break
            
        }
        
        NotificationCenter.default.post(name: .medalInfoUpdated, object: nil, userInfo: ["country": country, "gold": gold, "silver": silver, "bronze": bronze])
        
    }

    @objc func updateMedalInfo(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let country = userInfo["country"] as? String,
              let gold = userInfo["gold"] as? Int,
              let silver = userInfo["silver"] as? Int,
              let bronze = userInfo["bronze"] as? Int else {
            print("정보가 없습니다.")
            return
        }
        medalInfoLabel.text = "\(country): 금\(gold)개,  은\(silver)개, 동\(bronze)개"}
}

extension Notification.Name {
    static let medalInfoUpdated = Notification.Name("medalInfoUpdated")
}
