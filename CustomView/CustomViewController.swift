//
//  CustomViewController.swift
//  SeSSACWeek6
//
//  Created by 정경우 on 2023/08/24.
//

import UIKit
import SnapKit

class CustomViewController: UIViewController {
    //인스턴스 담아주고 속성을 바꿔주기
    // let titleField = UITextField()
    let idTextfield = {
        let view = BlackRadiusTextField()
        view.setupView()
        view.placeholder = "아이디를 입력해주세요"
        return view
    } ()
    
    let passwordTextfield = {
        let view = BlackRadiusTextField()
        view.placeholder = "비밀번호를 입력해주세요"
        return view
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        
        view.backgroundColor = .white
        view.addSubview(idTextfield)
        idTextfield.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        
        view.addSubview(passwordTextfield)
        passwordTextfield.snp.makeConstraints { make in
            make.top.equalTo(idTextfield.snp.bottom).offset(100)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        
        
    }
    

    

}









