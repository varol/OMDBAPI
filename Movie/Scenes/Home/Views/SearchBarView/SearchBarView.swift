//
//  SearchBarView.swift
//  Movie
//
//  Created by Varol on 13.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import UIKit

class SearchBarView: BaseComponentView {

    @IBOutlet weak var searchTextfield: UITextField!
    var textfieldChange: ( (String) -> Void )?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupUI(){
        searchTextfield.delegate = self
        searchTextfield.attributedPlaceholder = NSAttributedString(string: "Find your favorite movie...",
                                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "LoodosTextColor")!, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .bold)])
        setupTextfield()
    }
    
    func setupTextfield(){
        let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: .init(width: self.frame.size.width, height: 30)))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([flexSpace, doneButton], animated: false)
        toolbar.sizeToFit()
        searchTextfield.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonTapped(){
        self.textfieldChange?(searchTextfield.text ?? "")
        self.searchTextfield.resignFirstResponder()
    }
}

extension SearchBarView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textfieldChange?(searchTextfield.text ?? "")
        self.searchTextfield.resignFirstResponder()
        return true
    }
}
