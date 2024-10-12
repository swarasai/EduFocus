//
//  ViewController.swift
//  Edu_Focus
//
//  Created by Swarasai Mulagari on 10/12/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a SwiftUI view (HomeView) to display
        let homeView = HomeView()

        // Create a UIHostingController to host the SwiftUI view
        let hostingController = UIHostingController(rootView: homeView)

        // Add the hostingController as a child to the current ViewController
        addChild(hostingController)
        
        // Set the frame to match the parent view
        hostingController.view.frame = self.view.bounds
        
        // Add the SwiftUI view to the view hierarchy
        view.addSubview(hostingController.view)
        
        // Notify the hostingController that it has been moved to the parent
        hostingController.didMove(toParent: self)
    }
}
