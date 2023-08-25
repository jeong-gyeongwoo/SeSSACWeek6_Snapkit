//
//  TextViewController.swift
//  SeSSACWeek6
//
//  Created by 정경우 on 2023/08/22.
//

import UIKit
import SnapKit

class TextViewController: UIViewController {
    
    //카메라 1. 인스턴스 생성
    let picker = UIImagePickerController()
    
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
        
        view.backgroundColor = .white
        
        //view.addSubview(photoImageView)
        //view.addSubview(titleTextfield)
        // == 위랑 같음
//        for item in [photoImageView, titleTextfield] {
//            view.addSubview(item)
//        }
        // == 위랑 같음
        [photoImageView, titleTextfield].forEach {
            view.addSubview($0)
        }
        setupConstraints()
  
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //카메라 2. 접근 가능한지 확인, 갤러리를 읽는 권한은 물어보지 않아도 된다
        // 위치에서 if CLLocationManager.locationServicesEnabled()와 동일
        //.photoLibrary
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("갤러리 사용 불가, 사용자에게 토스트/얼럿")
            return
        }
        picker.delegate = self
        //어떤 스타일의 뷰를 띄워줄건지
        picker.sourceType = .camera //.photoLibrary
        //사진 촬영 후 편집
        picker.allowsEditing = true
        
       // let picker =  UIColorPickerViewController()  UIFontPickerViewController()
        
        present(picker, animated: true)
        
        
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

//UINavigationControllerDelegate -> 앨범에서 네비게이션으로 화면 전환 할 때
extension TextViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //취소 버튼 클릭 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print(#function)
        dismiss(animated: true)
    }
    
    // 사진을 선택하거나 카메라 촬영 직후 호출
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.photoImageView.image = image
            dismiss(animated: true)
        }
    }
    
}
