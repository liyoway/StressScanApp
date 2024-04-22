//
//  HomePageViewController.swift
//  StressScanApp
//
//  Created by yoway Li on 2024/4/22.
//

import UIKit

class HomePageViewController: UIViewController {
    var language : String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func languageChosen(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "日本語" :
            language = "JP"
        case "中国語" :
            language = "TW"
        default :
            language = "JP"
        }
        
        performSegue(withIdentifier: "languageChosenSegue", sender: nil)
    }
    
    
    @IBSegueAction func performNext(_ coder: NSCoder) -> SurveyViewController? {
        let controller = SurveyViewController(coder: coder)
        controller?.language = language
        return controller
    }
    
    @IBAction func unwindToRootViewController(segue: UIStoryboardSegue) {
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
