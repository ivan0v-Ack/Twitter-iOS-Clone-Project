//
//  RegisterController.swift
//  Twitter iOS Clone Project
//
//  Created by Ivan Ivanov on 6/12/21.
//

import UIKit


class RegistrationController: UIViewController {
    // MARK: - Propetries
    
    private let imagePicker = UIImagePickerController()
    
    
    private let PlusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleProfilePhoto), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var emailContrainterView: UIView = {
        let view = Utilities().inputContainterView(withImage: #imageLiteral(resourceName: "ic_mail_outline_white_2x-1"), textField: emailTextField)
     return view
    }()
    
    private lazy var passwordContrainterView: UIView = {
        let view = Utilities().inputContainterView(withImage: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passTextField)
        return view
    }()
    
    private lazy var userNameContrainterView: UIView = {
        let view = Utilities().inputContainterView(withImage: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: userNameTextField)
        return view
    }()
    
    private lazy var fullNameContrainterView: UIView = {
        let view = Utilities().inputContainterView(withImage: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: fullNameTextField)
        return view
    }()
    
    private let userNameTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "User Name", isSecure: false)
        return tf
    }()
    private let fullNameTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Full Name", isSecure: false)
        return tf
    }()
    private let emailTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Email", isSecure: false)
        return tf
    }()
    private let passTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Password", isSecure: true)
        return tf
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        
        return button
    }()
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = Utilities().attributedButton("Already have an account?", " Log in")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
        
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func handleSignUp() {
        print("DEBUG: SIGNED UP!")
    }
    
    @objc func handleProfilePhoto(){
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpres
    func configureUI () {
        view.backgroundColor = .twitterBlue
        
        imagePicker.delegate = self
        imagePicker.isEditing = true
        imagePicker.allowsEditing = true
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        
        
        view.addSubview(PlusPhotoButton)
        PlusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, centerX: view.centerXAnchor, size: CGSize(width: 128, height: 128), padding: .init(top: 32, left: 32, bottom: 0, right: 32))
        
        let stack = UIStackView(arrangedSubviews: [emailContrainterView, passwordContrainterView,userNameContrainterView,fullNameContrainterView,signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        view.addSubview(stack)
        stack.anchor(top: PlusPhotoButton.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 40, bottom: 0, right: 40))
    }
}

// MARK: - UIImagePickerControllerDelegate

extension RegistrationController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        PlusPhotoButton.layer.cornerRadius = 128 / 2
        PlusPhotoButton.layer.masksToBounds = true
        PlusPhotoButton.imageView?.contentMode = .scaleAspectFill
        PlusPhotoButton.imageView?.clipsToBounds = true
        PlusPhotoButton.layer.borderColor = UIColor.white.cgColor
        PlusPhotoButton.layer.borderWidth = 2.5
        
        self.PlusPhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        dismiss(animated: true, completion: nil)
    }
}
