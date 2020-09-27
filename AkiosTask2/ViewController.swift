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
 選択したセグメントで数値を計算3
 */

import UIKit

class ViewController: UIViewController {

    /// 演算を表す型を定義
    enum Operation: Int {
        case addition
        case subtraction
        case multiplication
        case division
        init?(selectedSegmentIndex: Int) {
            switch selectedSegmentIndex {
            case 0:
                self = .addition
            case 1:
                self = .subtraction
            case 2:
                self = .multiplication
            case 3:
                self = .division
            default:
                return nil
            }
        }
    }

    @IBOutlet private weak var textField1: UITextField!
    @IBOutlet private weak var textField2: UITextField!
    @IBOutlet private weak var segment: UISegmentedControl!
    @IBOutlet private weak var label: UILabel!

    @IBAction private func button(_ sender: Any) {

        guard let operation = Operation(rawValue: segment.selectedSegmentIndex) else {
            print("segment.selectedSegmentIndex is invalid.")
            return
        }

        // isEmpty を使うと意図がより明確になります
        guard !textField1.text!.isEmpty, !textField2.text!.isEmpty else {
            label.text = "未入力の項目があります"
            return
        }

        /*
         もしくは
         let value1 = Int(textField1.text!) ?? 0
         let value2 = Int(textField2.text!) ?? 0
         */
        guard let value1 = Int(textField1.text!), let value2 = Int(textField2.text!) else {
            label.text = "数字を入力してください"
            return
        }

        switch operation {
        case .addition:
            label.text = "\(value1 + value2)"
        case .subtraction:
            label.text = "\(value1 - value2)"
        case .multiplication:
            label.text = "\(value1 * value2)"
        case .division:
            guard value1 != 0 && value2 != 0 else {
                label.text = "割る数には0以外を入力してください"
                return
            }
            label.text = "\(Double(value1) / Double(value2))"
        }

        //        guard textField1.text != "", textField2.text != "" else {
        //            label.text = "未入力の項目があります"
        //            return
        //        }
        //
        //        guard let value1 = Int(textField1.text!), let value2 = Int(textField2.text!) else {
        //            label.text = "数字を入力してください"
        //            return
        //        }
        //
        //        if segment.selectedSegmentIndex == 3 && (value1 == 0 || value2 == 0) {
        //            label.text = "割る数には0以外を入力してください"
        //            return
        //        }
        //
        //        switch segment.selectedSegmentIndex {
        //        case 0:
        //            label.text = "\(value1 + value2)"
        //        case 1:
        //            label.text = "\(value1 - value2)"
        //        case 2:
        //            label.text = "\(value1 * value2)"
        //        case 3:
        //            label.text = "\(Double(value1) / Double(value2))"
        //        default: break
        //        }

    }

}
