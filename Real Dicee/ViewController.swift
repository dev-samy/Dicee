//
//  ViewController2.swift
//   Dicee
//
//  Created by Abdelrahman Samy on 28.02.2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//


import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self

        sceneView.autoenablesDefaultLighting = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = .horizontal
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    //MARK: - Dice Rendring methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            
            let touchLocation = touch.location(in: sceneView)
            
            let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingExtent)
            
            if let hitResult = results.first {

               addDice(atLocation: hitResult)
                
            }
            
        }
    }
    
    func addDice(atLocation location : ARHitTestResult) {
        
        // Create a new scene
                       let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!

                       if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {

                           diceNode.position = SCNVector3(
                               x: location.worldTransform.columns.3.x,
                               y: location.worldTransform.columns.3.y + diceNode.boundingSphere.radius,
                               z: location.worldTransform.columns.3.z
                           )

                           sceneView.scene.rootNode.addChildNode(diceNode)
                           
                           let randomX = Float((arc4random_uniform(4) + 1)) * (Float.pi/2)
                           //        let randomY = Double((arc4random_uniform(10) + 11)) * (Double.pi/2)
                           let randomZ = Float((arc4random_uniform(4) + 1)) * (Float.pi/2)
                           
                           diceNode.runAction(SCNAction.rotateBy(x: CGFloat(randomX * 5), y: 0, z: CGFloat(randomZ * 5), duration: 0.5))

                       }
        
    }
    
    
    
    // MARK: - ARSCNViewDelegate
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        if anchor is ARPlaneAnchor {
            
            print("plane detected")
            
            let planeAnchor = anchor as! ARPlaneAnchor

            let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
            
            let gridMaterial = SCNMaterial()
            gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/sas.png")
            plane.materials = [gridMaterial]
            
            let planeNode = SCNNode()

            planeNode.geometry = plane
            planeNode.position = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
            planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
            
            node.addChildNode(planeNode)
            
        } else {
            return
        }
        
        //guard let planeAnchor = anchor as? ARPlaneAnchor else {return}
    }


}
