//
//  NetflixTextField.swift
//  SeSSACWeek6
//
//  Created by 정경우 on 2023/08/24.
//

import UIKit

class NetflixTextField: UITextField {
    
    
    
    override init(frame: CGRect) {

        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        borderStyle = .none
        layer.backgroundColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 8 
        textColor = .white
        textAlignment = .center
        font = .systemFont(ofSize: 15)
    
        
    }
   
    
}
