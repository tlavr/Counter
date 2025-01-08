//
//  ViewController.swift
//  Counter
//
//  Created by Timur Lavrukhin on 8.1.2025.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet private weak var counterIncreaseByOneButton: UIButton!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var zeroButton: UIButton!
    @IBOutlet private weak var logTextView: UITextView!
    private var counterValue: UInt = 0
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterValue = 0
        updateCounterLabelValue()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        plusButton.tintColor = .red
        minusButton.tintColor = .blue
        zeroButton.tintColor = .orange
        counterIncreaseByOneButton.tintColor = .green
    }
    
    func updateCounterLabelValue() {
        counterLabel.text = "Значение счётчика: " + String(counterValue)
    }
    
    func updateLogTextView(with textValue: String) {
        logTextView.text.append("\n")
        let formattedDate = dateFormatter.string(from: Date())
        logTextView.text.append("[\(formattedDate)]: "+textValue)
    }

    @IBAction func counterButtonDidTap(_ sender: Any) {
        counterValue += 1
        updateCounterLabelValue()
            }
    
    @IBAction func plusButtonDidTap(_ sender: Any) {
        counterValue += 1
        updateCounterLabelValue()
        updateLogTextView(with:"значение изменено на +1")
    }
    
    @IBAction func minusButtonDidTap(_ sender: Any) {
        if (counterValue > 0) {
            counterValue -= 1
            updateCounterLabelValue()
            updateLogTextView(with:"значение изменено на -1")
        } else {
            updateLogTextView(with:"попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func zeroButtonDidTap(_ sender: Any) {
        counterValue = 0
        updateCounterLabelValue()
        updateLogTextView(with:"значение сброшено")
    }
}

