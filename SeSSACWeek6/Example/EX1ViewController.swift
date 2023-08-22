//
//  EX1ViewController.swift
//  SeSSACWeek6
//
//  Created by 정경우 on 2023/08/22.
//

import UIKit

//ViewController에서 연결
class EX1ViewController: UIViewController {

    let grayView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    } ()
   
    let topTextfield = {
        let textfield = UITextField()
        textfield.placeholder = ""
        textfield.textAlignment = .center
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.font = .systemFont(ofSize: 15)
        return textfield
    } ()
    
    let buttomTextfield = {
        let textfield = UITextField()
        textfield.placeholder = ""
        textfield.textAlignment = .center
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.font = .systemFont(ofSize: 15)
        return textfield
    } ()
    
    let whiteView = UIView()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(grayView)
        view.addSubview(topTextfield)
        view.addSubview(buttomTextfield)
        view.addSubview(whiteView)

        setupConstraints()
    
    }
    

    
    func setupConstraints() {
        grayView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(200)
        }
        
        topTextfield.snp.makeConstraints { make in
            make.topMargin.equalTo(grayView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(40)
            topTextfield.placeholder = "제목을 입력해주세요"
        }
        
        buttomTextfield.snp.makeConstraints { make in
            make.topMargin.equalTo(topTextfield.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(40)
            buttomTextfield.placeholder = "날짜을 입력해주세요"
        }
        
        whiteView.layer.borderWidth = 1
        whiteView.layer.borderColor = UIColor.black.cgColor
        
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(buttomTextfield.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view).inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    
    

}
