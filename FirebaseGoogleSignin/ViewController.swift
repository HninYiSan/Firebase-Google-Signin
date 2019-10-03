//
//  ViewController.swift
//  FirebaseGoogleSignin
//
//  Created by Hnin Yi on 10/3/19.
//  Copyright © 2019 Hnin Yi San. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UITableViewController {
//@IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            // ...
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                // ...
                return
            }
            // User is signed in
            // ...
        }
        // ...
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.uiDelegate = self as! GIDSignInUIDelegate
        GIDSignIn.sharedInstance().signIn()
        
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }


}

