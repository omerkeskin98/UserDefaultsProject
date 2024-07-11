//
//  ViewController.swift
//  UserDefaultsProject
//
//  Created by Omer Keskin on 5.07.2024.
//

import UIKit

class ViewController: UIViewController {
  
    let outputLabel = UILabel()
    let boolLabel = UILabel()
    let cityTextField = UITextField()
    let visitNumber = UITextField()
    let saveButton = UIButton(type: .system)
    
    let stringKey = "stringKey"
    let intKey = "intKey"
    let boolKey = "boolKey"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupUI()
        loadSavedData()
        
        
    }
    
    func setupUI() {

        
        outputLabel.text = ""
        outputLabel.translatesAutoresizingMaskIntoConstraints = false
        outputLabel.numberOfLines = 0
        outputLabel.textAlignment = .center
        view.addSubview(outputLabel)
        
        boolLabel.text = "false"
        boolLabel.translatesAutoresizingMaskIntoConstraints = false
        boolLabel.font = UIFont.systemFont(ofSize: 19)
        view.addSubview(boolLabel)
        
        cityTextField.placeholder = "What city would you like to visit?"
        cityTextField.borderStyle = .roundedRect
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cityTextField)
        
        visitNumber.placeholder = "How many times did you visit the city?"
        visitNumber.borderStyle = .roundedRect
        visitNumber.keyboardType = .numberPad
        visitNumber.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(visitNumber)
        
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.tintColor = .white
        saveButton.backgroundColor = .blue
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 23)
        saveButton.layer.cornerRadius = 10
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        
        NSLayoutConstraint.activate([
            outputLabel.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 100),
            outputLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            outputLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            outputLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            boolLabel.topAnchor.constraint(equalTo: visitNumber.bottomAnchor, constant: 50),
            boolLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cityTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            cityTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            cityTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            cityTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityTextField.widthAnchor.constraint(equalToConstant: 200),
            
            visitNumber.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 30),
            visitNumber.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            visitNumber.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            visitNumber.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            visitNumber.widthAnchor.constraint(equalToConstant: 200),
            
            saveButton.topAnchor.constraint(equalTo: boolLabel.bottomAnchor, constant: 70),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -130),
            saveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 130),
            saveButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func saveButtonTapped() {
        guard let stringText = cityTextField.text, !stringText.isEmpty,
              let intText = visitNumber.text, !intText.isEmpty,
              let intValue = Int(intText) else { return }
        
        UserDefaults.standard.set(stringText, forKey: stringKey)
        UserDefaults.standard.set(intValue, forKey: intKey)
        
        // Set bool value based on int input
        if intValue == 0 {
            UserDefaults.standard.set(false, forKey: boolKey)
        } else {
            UserDefaults.standard.set(true, forKey: boolKey)
        }
        
        updateUI()
    }
    
    func loadSavedData() {
        let savedString = UserDefaults.standard.string(forKey: stringKey) ?? ""
        let savedInt = UserDefaults.standard.integer(forKey: intKey)
        let savedBool = UserDefaults.standard.bool(forKey: boolKey)
        
        outputLabel.text = "\(savedString) has been visited \(savedInt) time(s)"
        boolLabel.text = "Visited before: \(savedBool)"
    }
    
    func updateUI() {
        let updatedString = UserDefaults.standard.string(forKey: stringKey) ?? ""
        let updatedInt = UserDefaults.standard.integer(forKey: intKey)
        let updatedBool = UserDefaults.standard.bool(forKey: boolKey)
        
        outputLabel.text = "\(updatedString) has been visited \(updatedInt) time(s)"
        boolLabel.text = "Visited before: \(updatedBool)"
    }
}


