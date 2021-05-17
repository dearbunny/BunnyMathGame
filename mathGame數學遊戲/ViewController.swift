//
//  ViewController.swift
//  mathGame數學遊戲
//
//  Created by Rose on 2021/5/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var itemNumber: UILabel!
    @IBOutlet weak var num1Label: UILabel!
    @IBOutlet weak var num2Label: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    
    //選擇鈕
    @IBOutlet var multiChoiceBtns: [UIButton]!
    @IBOutlet weak var multiChoiceView: UIView!
    
    //結果
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultScoreLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    
    
    
    var num1 = 0
    var num2 = 0
    var doubleNum = 0 //避免餘數
    // 運算符號
    var symbolsArray = ["➕", "➖", "✖️", "➗"]
    var options:[Int] = []
    var option1 = 0
    var option2 = 0
    var ans = 0
    var index = 1
    var score = 0
    var highestScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomQuestion()
        itemNumber.text = "\(index)"
        resultView.isHidden = true
        
    }
    
    //選擇按鈕
    @IBAction func selectAnswer(_ sender: UIButton) {
        index += 1
        itemNumber.text = "\(index)"
        if sender.currentTitle == String(ans){
            score = score + 10
        }
        
        //已答題滿十題 隱藏選擇區，顯示分數區
        if index == 11 {
            index = 10
            multiChoiceView.isHidden = true
            resultView.isHidden = false
            resultScoreLabel.text = "\(score)"
            itemNumber.text = ""
            if score <= 50 {
                resultDescriptionLabel.text = "💪 請繼續努力！"
            }else if score <= 70 {
                resultDescriptionLabel.text = "👍 做得很好！"
            }else if score <= 90 {
                resultDescriptionLabel.text = "💎 你真是太棒了！"
            }else{
                resultDescriptionLabel.text = "👑 你實在是太強了"
            }
        }
        
        randomQuestion()
        
        scoreLabel.text = "\(score)"
        
        print(num1,symbolLabel.text!,num2,ans)
    }
    
    //再玩一次
    @IBAction func playAgain(_ sender: Any) {
        index = 1
        score = 0
        randomQuestion()
        resultView.isHidden = true
        multiChoiceView.isHidden = false
        itemNumber.text = "\(index)"
        scoreLabel.text = "分數"
    }
    
    
    // 隨機出題的 function
    func randomQuestion() {
        //運算符號隨機
        symbolsArray.shuffle()
        
        option1 = Int.random(in: 1...99)
        option2 = Int.random(in: 1...99)
        options = [option1,option2]
        
        //一位數 加 兩位數
        if symbolsArray[0] == "➕" {
            symbolLabel.text = symbolsArray[0]
            num1 = Int.random(in: 1...9)
            num2 = Int.random(in: 1...90)
            ans = num1 + num2
        }else if symbolsArray[1] == "➖" {
            symbolLabel.text = symbolsArray[1]
            num1 = Int.random(in: 10...99)
            num2 = Int.random(in: 1...9)
            ans = num1 - num2
        }else if symbolsArray[2] == "✖️" {
            symbolLabel.text = symbolsArray[2]
            num1 = Int.random(in: 1...9)
            num2 = Int.random(in: 1...9)
            ans = num1 * num2
        }else if symbolsArray[3] == "➗" {
            symbolLabel.text = symbolsArray[3]
            num2 = Int.random(in: 1...9)
            //避免有餘數
            doubleNum = Int.random(in: 1...9)
            num1 = num2 * doubleNum
            ans = num1 / num2
        }
        
        options.append(ans)
        options.shuffle()
        //顯示選擇題選項
        for i in 0...2 {
            multiChoiceBtns[i].setTitle(String(options[i]), for: .normal)
        }
        num1Label.text = "\(num1)"
        num2Label.text = "\(num2)"
    }
    


}

