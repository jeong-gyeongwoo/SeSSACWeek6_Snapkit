//
//  TextViewController.swift
//  SeSSACWeek6
//
//  Created by 정경우 on 2023/08/22.
//

import UIKit
import SnapKit

class TextViewController: UIViewController {
    
    let photoImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemMint
        view.contentMode = .scaleAspectFill
        return view
    } ()
    
    let titleTextfield = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "제목"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        
        return view
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.addSubview(photoImageView)
        //view.addSubview(titleTextfield)
        
        // ==
//        for item in [photoImageView, titleTextfield] {
//            view.addSubview(item)
//        }
        
        // ==
        [photoImageView, titleTextfield].forEach {
            view.addSubview($0)
        }
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        
        photoImageView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view).multipliedBy(0.3)
        }
        
        titleTextfield.snp.makeConstraints { make in
            // photoImageView 아래으로 만들어줘라
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            //  == make.leading.equalTo(view).inset(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
            
        }
        
        
    }
    
}
