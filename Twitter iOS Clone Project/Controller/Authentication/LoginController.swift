//
//  LoginController.swift
//  Twitter iOS Clone Project
//
//  Created by Ivan Ivanov on 6/12/21.
//
import UIKit

class LoginController: UIViewController {
    // MARK: - Propetries
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "TwitterLogo")
        return iv
    }()
    
    private lazy var emailContrainterView: UIView = {
        let image = #imageLiteral(resourceName: "ic_mail_outline_white_2x-1")
        let view = Utilities().inputContainterView(withImage: image, textField: emailTextField)
     return view
    }()
    
    private lazy var passwordContrainterView: UIView = {
        let view = Utilities().inputContainterView(withImage: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passTextField)
        return view
    }()
    
    private let emailTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Email", isSecure: false)
        return tf
    }()
    private let passTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Password", isSecure: true)
        return tf
    }()
    
    private let logginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleLoggin), for: .touchUpInside)
        
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = Utilities().attributedButton("Don't have an account?", " Sign Up")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
        
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc func handleShowSignUp() {
       let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func handleLoggin() {
        print("DEBUG: Clicked..!")
    }
    

    
    // MARK: - Helpres
    func configureUI () {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(logoImageView)
        logoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, centerX: view.centerXAnchor, size: CGSize(width: 150, height: 150), padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        
        let stack = UIStackView(arrangedSubviews: [emailContrainterView, passwordContrainterView,logginButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        view.addSubview(stack)
        stack.anchor(top: logoImageView.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 40, bottom: 0, right: 40))
        
    }
}
