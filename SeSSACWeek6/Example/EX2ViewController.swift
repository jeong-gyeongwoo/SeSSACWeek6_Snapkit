//
//  EX2ViewController.swift
//  SeSSACWeek6
//
//  Created by 정경우 on 2023/08/22.
//

import UIKit

class EX2ViewController: UIViewController {
    //변수 처리?
    let closeButton = UIButton()
    let topLeft1Image = UIImageView()
    let topLeft2Image = UIImageView()
    let topLeft3Image = UIImageView()
    
    let profileImage = UIImageView()
    let profileLabel = UILabel()
    let lineLable = UILabel()
    
    let buttomLeftImage = UIImageView()
    let buttomMiddleImage = UIImageView()
    let buttomRightImage = UIImageView()
    let buttomLeftLabel = UILabel()
    let buttomMiddleLabel = UILabel()
    let buttomRightLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        [topLeft1Image, topLeft2Image, topLeft3Image , profileImage, buttomLeftImage, buttomMiddleImage, buttomRightImage, closeButton, profileLabel, buttomLeftLabel, buttomMiddleLabel, buttomRightLabel, lineLable].forEach {
            view.addSubview($0)
        }
//        view.addSubview(profileLabel)
//        view.addSubview(topLeft1Image)
//        view.addSubview(topLeft2Image)
//        view.addSubview(topLeft3Image)
//        view.addSubview(closeButton)
//        view.addSubview(profileImage)
//        view.addSubview(lineLable)
//        view.addSubview(buttomLeftImage)
//        view.addSubview(buttomMiddleImage)
//        view.addSubview(buttomRightImage)
//        view.addSubview(buttomLeftLabel)
//        view.addSubview(buttomMiddleLabel)
//        view.addSubview(buttomRightLabel)
//
        setContraints()
        
    }
    
    
    func setContraints() {
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .white
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(20)
        }
        topLeft3Image.image = UIImage(systemName: "gearshape")
        topLeft3Image.tintColor = .white
        topLeft3Image.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(-20)
        }
        topLeft2Image.image = UIImage(systemName: "lasso")
        topLeft2Image.tintColor = .white
        topLeft2Image.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(-60)
        }
        
        topLeft1Image.image = UIImage(systemName: "paperplane")
        topLeft1Image.tintColor = .white
        topLeft1Image.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(-100)
        }
       
        profileImage.layer.cornerRadius = 40
        profileImage.backgroundColor = .white
        profileImage.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(150)
            make.size.equalTo(100)
        }
        
        profileLabel.text = "이름"
        profileLabel.textColor = .white
        profileLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(15)
            make.centerX.equalTo(profileImage)
            make.size.equalTo(30)
            
        }
        
        lineLable.layer.borderColor = UIColor.white.cgColor
        lineLable.layer.borderWidth = 1
        lineLable.snp.makeConstraints { make in
            make.top.equalTo(profileLabel.snp.bottom).offset(30)
            make.width.equalTo(view)
            make.height.equalTo(2)
        }
        
        buttomLeftImage.image = UIImage(systemName: "paperplane")
        buttomLeftImage.tintColor = .white
        buttomLeftImage.snp.makeConstraints { make in
            make.top.equalTo(lineLable.snp.bottom).offset(30)
            make.leading.equalTo(60)
            make.size.equalTo(30)
            
        }
        
        buttomMiddleImage.image = UIImage(systemName: "paperplane")
        buttomMiddleImage.tintColor = .white
        buttomMiddleImage.snp.makeConstraints { make in
            make.centerY.equalTo(buttomLeftImage)
            make.centerX.equalTo(profileLabel)
            make.size.equalTo(30)
            
        }

        buttomRightImage.image = UIImage(systemName: "paperplane")
        buttomRightImage.tintColor = .white
        buttomRightImage.snp.makeConstraints { make in
            make.centerY.equalTo(buttomLeftImage)
            make.trailing.equalTo(-60)
            make.size.equalTo(30)
            
        }
        
        buttomLeftLabel.text = "나와의 채팅"
        buttomLeftLabel.textColor = .white
        buttomLeftLabel.font = .systemFont(ofSize: 13)
        buttomLeftLabel.textAlignment = .center
        buttomLeftLabel.numberOfLines = 0
        buttomLeftLabel.snp.makeConstraints { make in
            make.top.equalTo(buttomLeftImage.snp.bottom).offset(10)
            make.centerX.equalTo(buttomLeftImage)
            make.height.equalTo(30)
            
        }
        
        buttomMiddleLabel.text = "프로필 편집"
        buttomMiddleLabel.textColor = .white
        buttomMiddleLabel.font = .systemFont(ofSize: 13)
        buttomMiddleLabel.textAlignment = .center
        buttomMiddleLabel.numberOfLines = 0
        buttomMiddleLabel.snp.makeConstraints { make in
            make.top.equalTo(buttomMiddleImage.snp.bottom).offset(10)
            make.centerX.equalTo(buttomMiddleImage)
            make.height.equalTo(30)
            
        }
        
        buttomRightLabel.text = "카카오스토리"
        buttomRightLabel.textColor = .white
        buttomRightLabel.font = .systemFont(ofSize: 13)
        buttomRightLabel.textAlignment = .center
        buttomRightLabel.numberOfLines = 0
        buttomRightLabel.snp.makeConstraints { make in
            make.top.equalTo(buttomRightImage.snp.bottom).offset(10)
            make.centerX.equalTo(buttomRightImage)
            make.height.equalTo(30)
            
        }
    }

  
}
