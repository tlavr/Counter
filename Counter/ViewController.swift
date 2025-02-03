//
//  ViewController.swift
//  Counter
//
//  Created by Timur Lavrukhin on 8.1.2025.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var counterIncreaseByOneButton: UIButton!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var zeroButton: UIButton!
    @IBOutlet private weak var logTextView: UITextView!
    
    // MARK: - Private properties
    private var counterValue: Int = 0
    private let dateFormatter = DateFormatter()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        plusButton.tintColor = .red
        minusButton.tintColor = .blue
        zeroButton.tintColor = .orange
        counterIncreaseByOneButton.tintColor = .green
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        counterValue = UserDefaults.standard.integer(forKey: "counterValue")
        updateCounterLabelValue()
        guard let logText = UserDefaults.standard.string(forKey: "logText") else {return}
        logTextView.text = logText
    }
    
    // MARK: - IBActions
    @IBAction private func counterButtonDidTap(_ sender: Any) {
        counterValue += 1
        updateCounterLabelValue()
    }
    @IBAction private func plusButtonDidTap(_ sender: Any) {
        counterValue += 1
        updateCounterLabelValue()
        updateLogTextView(with:"значение изменено на +1")
    }
    @IBAction private func minusButtonDidTap(_ sender: Any) {
        if counterValue > 0 {
            counterValue -= 1
            updateCounterLabelValue()
            updateLogTextView(with:"значение изменено на -1")
        } else {
            updateLogTextView(with:"попытка уменьшить значение счётчика ниже 0")
        }
    }
    @IBAction private func zeroButtonDidTap(_ sender: Any) {
        counterValue = 0
        updateCounterLabelValue()
        updateLogTextView(with:"значение сброшено")
    }
    
    // MARK: - Private methods
    private func updateCounterLabelValue() {
        counterLabel.text = "Значение счётчика: " + String(counterValue)
        UserDefaults.standard.set(counterValue, forKey: "counterValue")
    }
    
    private func updateLogTextView(with textValue: String) {
        logTextView.text.append("\n")
        let formattedDate = dateFormatter.string(from: Date())
        logTextView.text.append("[\(formattedDate)]: "+textValue)
        UserDefaults.standard.set(logTextView.text, forKey: "logText")
    }
}

