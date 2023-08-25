//
//  NetfilxLobbyViewController.swift
//  SeSSACWeek6
//
//  Created by 정경우 on 2023/08/24.
//

import UIKit

class NetfilxLobbyViewController: UIViewController {
    
    let nLogo = UIButton()
    let program = UIButton()
    let movie = UIButton()
    let pickedContent = UIButton()
    
    let checkImage = UIImageView()
    let checkLabel = UILabel()
    let playImage = UIImageView()
    let infoImage = UIImageView()
    let infoLabel = UILabel()
    
    let previewLabel = UILabel()
    
    let leftPreviewImage = {
        let left = NetflixMovieImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return left
    } ()
    let middlePreviewImage = {
        let view = NetflixMovieImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return view
    } ()
    let rightPreviewImage = {
        let view = NetflixMovieImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return view
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        [nLogo, program, movie, pickedContent, checkImage, checkLabel, playImage, infoImage, infoLabel, previewLabel, leftPreviewImage, middlePreviewImage, rightPreviewImage].forEach { view.addSubview($0) }

        setConstraints()
           
    }
    
    func setConstraints() {
        nLogo.setImage(UIImage(systemName: "doc"), for: .normal)
        nLogo.contentVerticalAlignment = .fill
        nLogo.contentHorizontalAlignment = .fill
        nLogo.tintColor = .white
        nLogo.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(20)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.size.equalTo(50)
        }
        program.setTitle("TV 프로그램", for: .normal)
        program.titleLabel?.textAlignment = .center
        program.setTitleColor(.white, for: .normal)
        program.snp.makeConstraints { make in
            make.leading.equalTo(nLogo.snp.trailing).offset(30)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
        
        movie.setTitle("영화", for: .normal)
        movie.titleLabel?.textAlignment = .center
        movie.setTitleColor(.white, for: .normal)
        movie.snp.makeConstraints { make in
            make.leading.equalTo(program.snp.trailing).offset(10)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
        
        pickedContent.setTitle("내가 찜한 컨텐츠", for: .normal)
        pickedContent.titleLabel?.textAlignment = .center
        pickedContent.setTitleColor(.white, for: .normal)
        pickedContent.snp.makeConstraints { make in
            make.leading.equalTo(movie.snp.trailing).offset(10)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
        
        
        checkImage.image = UIImage(systemName: "checkmark")
        checkImage.tintColor = .white
        checkImage.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.7)
        }
        
        checkLabel.text = "내가 찜한 콘텐츠"
        checkLabel.font = .systemFont(ofSize: 15)
        checkLabel.textColor = .white
        checkLabel.snp.makeConstraints { make in
            make.top.equalTo(checkImage.snp.bottom).offset(10)
            make.centerX.equalTo(checkImage)
        }
        
        playImage.image = UIImage(systemName: "play.rectangle")
        playImage.tintColor = .white
        playImage.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.72)
            make.centerX.equalTo(view)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }

        infoImage.image = UIImage(systemName: "info.circle")
        infoImage.tintColor = .white
        infoImage.snp.makeConstraints { make in
            make.trailing.equalTo(view).offset(-50)
            make.bottom.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.7)
        }
        
        infoLabel.text = "정보"
        infoLabel.font = .systemFont(ofSize: 15)
        infoLabel.textColor = .white
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(infoImage.snp.bottom).offset(10)
            make.centerX.equalTo(infoImage)
        }
        
        previewLabel.text = "미리보기"
        previewLabel.font = .boldSystemFont(ofSize: 18)
        previewLabel.textColor = .white
        previewLabel.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(10)
            make.bottom.equalTo(view).multipliedBy(0.75)
        }
        
        leftPreviewImage.snp.makeConstraints { make in
            make.size.equalTo(120)
            make.leading.equalTo(view).offset(10)
            make.top.equalTo(previewLabel.snp.bottom).offset(10)
        }
        
        middlePreviewImage.snp.makeConstraints { make in
            make.size.equalTo(120)
            make.leading.equalTo(leftPreviewImage.snp.trailing).offset(10)
            make.top.equalTo(leftPreviewImage)
        }
        
        rightPreviewImage.snp.makeConstraints { make in
            make.size.equalTo(120)
            make.leading.equalTo(middlePreviewImage.snp.trailing).offset(10)
            make.top.equalTo(leftPreviewImage)
        }
    }
    
}
