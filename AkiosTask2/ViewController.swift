//
//  ViewController.swift
//  AkiosTask2
//
//  Created by Nekokichi on 2020/08/04.
//  Copyright © 2020 Nekokichi. All rights reserved.
//
/*
 入力値が数字？かを確認
 2つの入力欄に入力値があるかを確認
 ÷の計算時、いずれかの入力値が0ならエラーを起こす
 選択したセグメントで数値を計算
 */

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
     
    @IBAction func button(_ sender: Any) {
        
        guard textField1.text != "", textField2.text != "" else {
            label.text = "未入力の項目があります"
            return
        }
        
        guard let value1 = Int(textField1.text!), let value2 = Int(textField2.text!) else {
            label.text = "数字を入力してください"
            return
        }
        
        if segment.selectedSegmentIndex == 3 && (value1 == 0 || value2 == 0) {
            label.text = "割る数には0以外を入力してください"
            return
        }
        
        switch segment.selectedSegmentIndex {
        case 0:
            label.text = "\(value1 + value2)"
        case 1:
            label.text = "\(value1 - value2)"
        case 2:
            label.text = "\(value1 * value2)"
        case 3:
            label.text = "\(Double(value1) / Double(value2))"
        default: break
        }
        
    }
    
}

