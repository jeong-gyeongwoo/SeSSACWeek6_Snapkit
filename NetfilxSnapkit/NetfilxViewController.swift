//
//  NetfilxViewController.swift
//  SeSSACWeek6
//
//  Created by 정경우 on 2023/08/24.
//

import UIKit
import SnapKit

class NetfilxViewController: UIViewController {

    let NetflixLabel = UILabel()
    let assignButton = UIButton()
    let infoInputLabel = UILabel()
    let redSwitch = UISwitch()
    
    let phoneEmailTextField = {
        let view = NetflixTextField()
        view.setupView()
        view.text = "이메일 주소 또는 전화번호"
        return view
    } ()
    let passwordTextField = {
        let view = NetflixTextField()
        view.setupView()
        view.text = "비밀번호"
        return view
    } ()
    let nickNameTextField = {
        let view = NetflixTextField()
        view.setupView()
        view.text = "닉네임"
        return view
    } ()
    let locationTextField = {
        let view = NetflixTextField()
        view.setupView()
        view.text = "위치"
        return view
    } ()
    let codeTextField = {
        let view = NetflixTextField()
        view.setupView()
        view.text = "추천코드"
        return view
    } ()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        [NetflixLabel, phoneEmailTextField, passwordTextField, nickNameTextField, locationTextField, codeTextField, assignButton, infoInputLabel, redSwitch ].forEach {
            view.addSubview($0)
        }

//        view.addSubview(NetflixLabel)
//        view.addSubview(phoneEmailTextField)
//        view.addSubview(passwordTextField)
//        view.addSubview(nickNameTextField)
//        view.addSubview(locationTextField)
//        view.addSubview(codeTextField)
//        view.addSubview(assignButton)
//        view.addSubview(infoInputLabel)
//        view.addSubview(redSwitch)
        
        setConstraints()
        
    }
    
    func setConstraints() {
        NetflixLabel.textColor = .red
        NetflixLabel.font = .boldSystemFont(ofSize: 60)
        NetflixLabel.text = "NETFLIX"
        NetflixLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        phoneEmailTextField.snp.makeConstraints { make in
            make.top.equalTo(NetflixLabel.snp.bottom).offset(200)
            make.horizontalEdges.equalTo(view).inset(50)
            make.height.equalTo(30)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneEmailTextField.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view).inset(50)
            make.height.equalTo(30)

        }
        nickNameTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view).inset(50)
            make.height.equalTo(30)

        }
        locationTextField.snp.makeConstraints { make in
            make.top.equalTo(nickNameTextField.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view).inset(50)
            make.height.equalTo(30)

        }
        codeTextField.snp.makeConstraints { make in
            make.top.equalTo(locationTextField.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view).inset(50)
            make.height.equalTo(30)

        }
        
        assignButton.setTitle("회원가입", for: .normal)
        assignButton.setTitleColor(.black, for: .normal)
        assignButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        assignButton.titleLabel?.textAlignment = .center
        assignButton.backgroundColor = .white
        assignButton.layer.cornerRadius = 8
        assignButton.snp.makeConstraints { make in
            make.top.equalTo(codeTextField.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view).inset(50)
            make.height.equalTo(50)
        }
    
        infoInputLabel.text = "추가 정보 입력"
        infoInputLabel.textColor = .white
        infoInputLabel.snp.makeConstraints { make in
            make.top.equalTo(assignButton.snp.bottom).offset(10)
            make.leading.equalTo(50)
            
        }
        
        redSwitch.onTintColor = .red
        redSwitch.backgroundColor = .white
        redSwitch.snp.makeConstraints({ make in
            make.top.equalTo(assignButton.snp.bottom).offset(10)
            make.trailing.equalTo(-50)
        })
        
    }
    
    
}
