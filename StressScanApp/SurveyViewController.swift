//
//  SurveyViewController.swift
//  StressScanApp
//
//  Created by yoway Li on 2024/4/22.
//

import UIKit

class SurveyViewController: UIViewController {
    let questions = [
        Question(JP: "私は毎日の仕事が非常に挑戦的だと感じます。", TW: "我覺得每天的工作都很有挑戰性。", name: "1"),
        Question(JP: "私はしばしば残業をして仕事を終える必要があります。", TW: "我經常需要加班來完成工作任務。", name: "2"),
        Question(JP: "私は仕事でのサポートが不足していると感じます。", TW: "我覺得自己在工作中缺乏支持。", name: "3"),
        Question(JP: "私はしばしば仕事によって疲れを感じます。", TW: "我常常因為工作感到疲憊。", name: "4"),
        Question(JP: "私は仕事のストレスを処理するのに十分な時間があります。", TW: "我有足夠的時間來處理工作壓力。", name: "5")
    ]
    let answers = [
    Answer(JP: "全く同意しない", TW: "非常不同意", point: 1),
    Answer(JP: "あまり同意しない", TW: "有點不同意", point: 2),
    Answer(JP: "普通", TW: "普通", point: 3),
    Answer(JP: "やや同意する", TW: "有點同意", point: 4),
    Answer(JP: "非常に同意する", TW: "非常同意", point: 5)
]
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet var answerButtonArray: [UIButton]!
    var language : String!
    var count = 0
    var score = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        count = 0
        score = 0
        self.navigationItem.hidesBackButton = true
        questionImage.image = UIImage(named: "\(count + 1)")
        updateQuestion(language: language, count: count, questionLabel: questionLabel, question: questions)
        updateAnswer(language: language, answer: answers, answerButton: answerButtonArray)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func choseAnswer(_ sender: UIButton) {
        let index = sender.tag
        score += answers[index].point
        print(score)
        if count < 5 {
            count += 1
            updateQuestion(language: language, count: count, questionLabel: questionLabel, question: questions)
            questionImage.image = UIImage(named: "\(count + 1)")
            if count == 5 {
                performSegue(withIdentifier: "resultSegue", sender: nil)
            }
        }
}
    
    
    @IBSegueAction func resultSegue(_ coder: NSCoder) -> resultViewController? {
        let controller =  resultViewController(coder: coder)
        controller?.result = score
        controller?.language = language
        return controller
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
