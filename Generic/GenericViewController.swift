//
//  GenericViewController.swift
//  SeSSACWeek6
//
//  Created by 정경우 on 2023/08/24.
//

import UIKit
import SnapKit

class GenericViewController: UIViewController {
    
    let sampleLabel = UILabel()
    let sampleButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        title = "타이틀"
        
        view.addSubview(sampleLabel)
        sampleLabel.backgroundColor = .yellow
        configureborder(view: sampleLabel)
        sampleLabel.text = "테스트"
        sampleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(50)
        }
        
        view.addSubview(sampleButton)
        sampleButton.backgroundColor = .green
        configureborder(view: sampleButton)
        sampleButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(sampleLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        
        
        let generic = sum(a: 3.5, b: 1)
        print(generic)
        let value = sumInt(a: 3, b: 7)
        print(value)
        
        
        let value2 = sumDouble(a: 3.5, b: 7.2)
        print(value2)
        
        
        
        
    }
    
    
    
    
}
