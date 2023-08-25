//
//  BlackRadiusTextField.swift
//  SeSSACWeek6
//
//  Created by 정경우 on 2023/08/24.
//

import UIKit

class BlackRadiusTextField: UITextField {
    
    //Interface Builder를 사용하지 않고, UIview를 상속받은 custom class를 코드로 구성할 때 사용되는 초기화 구문 //코드
    override init(frame: CGRect) { // UIview
        
        super.init(frame: frame)
        setupView()
    }
    
    //NSCoding
    //XIB -> NIB 변환 과정에서 객체 생성시 필요한 init구문(storyboard) //스토리보드
    //Interface Builder에서 생성된 뷰들이 초기화될 떄 실행되는 구문
    required init?(coder: NSCoder) { //NSCoding
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        borderStyle = .none
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        textColor = .black
        textAlignment = .center
        font = .boldSystemFont(ofSize: 15)
        
    }
    
    
}


protocol ExampleProtocol {
    init(name: String)
}

class Mobile: ExampleProtocol {
    //required: 프로토콜에서 생성된 경우 사용되는 키워드
    //Required Initalize
    required init(name: String) {
        
    }
    
    
}
