//
//  resultViewController.swift
//  StressScanApp
//
//  Created by yoway Li on 2024/4/22.
//

import UIKit

class resultViewController: UIViewController {
    var result: Int!
    var language : String!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        switch language {
        case "JP":
            backButton.titleLabel?.text = "もう一度"
        case "TW":
            backButton.titleLabel?.text = "再做一次"
        default:
            backButton.titleLabel?.text = "もう一度"
        }
        
        updateResults(score: result, resultImage: resultImage, resultLabel: resultLabel, language: language)

        // Do any additional setup after loading the view.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
