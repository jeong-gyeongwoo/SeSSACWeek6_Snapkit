//
//  ViewController.swift
//  SeSSACWeek6
//
//  Created by 정경우 on 2023/08/21.
//

import UIKit

// 객체 얹고, 레이아웃 잡고, 아웃렛 연결, 속성 조절
//1. 뷰객체 프로퍼티 선언(클래스 인스턴스 생성)
//2. 명시적으로 루트뷰에 추가(그룹관계 포함) + translatesAutoresizingMaskIntoConstraints
//3. 크기와 위치 정의
//4. 속성 정의
// -> Frame 한계
// => AutoResizingMask, AutoLayout => 스토리보드 대응
// => NSLayoutConstraints -> NSLayoutAnchor -> SnapKit => 코드베이스 대응
// NSLayoutConstraints - 1.isActive = true  2.addConstraints 3.visualFormat

class ViewController: UIViewController {
    //1.
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //2.
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        // AutoResizingMask, AutoLayout 같이 못 쓴다, 원리만 알기
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        //3.
        emailTextField.frame = CGRect(x: 50, y: 80, width: UIScreen.main.bounds.width - 100, height: 50)
        //4.
        emailTextField.backgroundColor = .lightGray
        emailTextField.isSecureTextEntry = true
        emailTextField.keyboardType = .numberPad
        emailTextField.placeholder = "닉네임을 입력해주세요"
        
        setLayoutAnchor()
        
        //        NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50).isActive = true
        //        //레이아웃 활성화
        //
        //        NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50).isActive = true
        //
        //        NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60).isActive = true
        //
        //        NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50).isActive = true
        //
        
        //addConstraints
        let leading =  NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50)
        
        
        let trailing = NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50)
        
        let height = NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60)
        
        let top =  NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50)
        
        
        view.addConstraints([leading, trailing, height, top])
        
        
        
        passwordTextField.backgroundColor = .black
    }
    
    func setLayoutAnchor() {
        view.addSubview(signButton)
        signButton.translatesAutoresizingMaskIntoConstraints = false
        
        signButton.backgroundColor = .blue
        signButton.addTarget(self, action: #selector(singButtonClicked), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            signButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signButton.widthAnchor.constraint(equalToConstant: 300),
            signButton.heightAnchor.constraint(equalToConstant: 50),
            signButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
    @objc
    func singButtonClicked() {
        let vc = LocationViewController()
        // vc. -> 값전달 가능
        //let nav = UINavigationController(rootViewController: vc)
        present(vc, animated: true)
        
    }
    
}

