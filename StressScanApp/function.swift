//
//  function.swift
//  StressScanApp
//
//  Created by yoway Li on 2024/4/22.
//

import Foundation
import UIKit

func updateQuestion(language: String, count: Int, questionLabel: UILabel!, question: [Question]) {
    if count < 5 {
        switch language {
        case "JP":
            questionLabel.text = question[count].JP
            questionLabel.textAlignment = .left
        case "TW":
            questionLabel.text = question[count].TW
            questionLabel.textAlignment = .center
        default:
            questionLabel.text = question[count].JP
        }
    }
}

func updateAnswer(language: String, answer: [Answer], answerButton: [UIButton]!) {
    if language == "JP" {
        for i in 0...4 {
            answerButton[i].setTitle(answer[i].JP, for: .normal)
        }
    } else {
        for i in 0...4 {
            answerButton[i].setTitle(answer[i].TW, for: .normal)
        }
    }
}

func updateResults(score: Int, resultImage: UIImageView, resultLabel: UILabel, language: String) {
    let results = [
        Result(JP: "15-25点：仕事のストレスが非常に高く、ストレスを減らす方法を見つけるか、職場環境を変えることを検討する必要があります。", TW: "15-25分：你感受到的工作壓力非常高，可能需要尋找方法來減少壓力或考慮改變工作環境。", name: "result1"),
        Result(JP: "10-14点：ある程度の仕事のストレスがありますが、まだコントロールできる範囲内です。リラックスする方法を見つけたり、時間管理を行ったりすることを試みてください。", TW: "10-14分：你有一定的工作壓力，但還在可控制的範圍內。試著尋找放鬆的方式或進行時間管理。", name: "result2"),
        Result(JP: "5-9点：仕事のストレスを非常によくコントロールしています。現在の状態を維持し、仕事と生活のバランスを維持し続けてください。", TW: "5-9分：你對工作的壓力控制得很好，保持目前的狀態，繼續保持良好的工作和生活平衡。", name: "result3")
    ]

    if score <= 25 && score >= 15 {
        resultImage.image = UIImage(named: results[0].name)
        resultLabel.text = language == "JP" ? results[0].JP : results[0].TW
    } else if score < 15 && score >= 10 {
        resultImage.image = UIImage(named: results[1].name)
        resultLabel.text = language == "JP" ? results[1].JP : results[1].TW
    } else if score < 10 && score >= 5 {
        resultImage.image = UIImage(named: results[2].name)
        resultLabel.text = language == "JP" ? results[2].JP : results[2].TW
    } else {
        resultLabel.text = language == "JP" ? "スコアが範囲外です。" : "分數超出範圍。"
        resultImage.image = nil // 或設置一個預設圖片
    }
}
