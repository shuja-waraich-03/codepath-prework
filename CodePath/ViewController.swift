//
//  ViewController.swift
//  CodePath
//
//  Created by Shuja Waraich on 8/13/25.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    private let petOptions = ["Dog", "Cat", "Bird", "Fish", "Hamster"]
    private var selectedPetIndex: Int = 0

    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var schooleNameTextField: UITextField!

    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    
    @IBOutlet weak var petPicker: UIPickerView!
    
    @IBAction func MorePetsStepper(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
    
    
    
//    functions for pet type picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return petOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return petOptions[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPetIndex = row
    }
    
    
//    Helper to build pet sentence based on info provided
    private func petsSentence() -> String {
        let countText = numberOfPetsLabel.text ?? "0"
        let count = Int(countText) ?? 0
        let type = petOptions[selectedPetIndex].lowercased()
        
        if count == 0 {
            if morePetsSwitch.isOn {
                return "I don’t have any pets yet. I’d love to have some in the future."
            } else {
                return "I don’t have any pets yet."
            }
        } else if count == 1 {
            if morePetsSwitch.isOn {
                return "I have 1 \(type). I’d love to have more."
            } else {
                return "I have 1 \(type)."
            }
        } else {
            if morePetsSwitch.isOn {
                return "I have \(count) \(type)s. I’d love to have more."
            } else {
                return "I have \(count) \(type)s."
            }
        }
    }
    
    
    @IBAction func IntroduceSelf(_ sender: UIButton) {
        
        // Lets us choose the title we have selected from the segmented control
        // In our example that is whether it is first, second, third or forth
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)

        // Creating a constant of type string that holds an introduction. The introduction receives the values from the outlet connections.
        let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I am currently in my \(year!) year" + petsSentence()

        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        
        alertController.addAction(action)

        present(alertController, animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        numberOfPetsLabel.text = "\(Int(morePetsStepper.value))"
    }


}

