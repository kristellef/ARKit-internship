//
//  ViewController.swift
//  ubanquity2
//
//  Created by kristelle on 7/6/17.
//  Copyright © 2017 Bloc. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import Foundation

class ViewController: UIViewController, ARSCNViewDelegate {

//    @IBOutlet var sceneView: ARSCNView!
    
    @IBOutlet weak var sceneView: ARSCNView!
    var treeNode: SCNNode!
    var colorNode: SCNNode!
    var scene: SCNScene!
    @IBOutlet weak var red: UIButton!
    @IBOutlet weak var blue: UIButton!
    @IBOutlet weak var undo: UIButton!
    @IBOutlet weak var yellow: UIButton!
    @IBOutlet weak var green: UIButton!
    @IBOutlet weak var Purple: UIButton!
    
    @IBOutlet weak var lamborghini: UIButton!
    @IBOutlet weak var chevrolet: UIButton!
    @IBOutlet weak var mini: UIButton!
    @IBOutlet weak var nissan: UIButton!
    
    
    
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    var node:SCNNode!
    @IBOutlet var pinchGesture: UIPinchGestureRecognizer!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        
        let scene = SCNScene(named: "art.scnassets/lamborghini/lamborghini.dae")!
       
        self.treeNode = scene.rootNode.childNode(withName: "body", recursively: true)
        self.treeNode?.position = SCNVector3(0, 0, -1)
        
        // Set the scene to the view
        sceneView.scene = scene
        
//        ship.setImage( UIImage.init(named: "images/rocket-ship.png"), for: .normal)
//        tree.setImage( UIImage.init(named: "images/tree-silhouette.png"), for: .normal)
//        plane.setImage( UIImage.init(named: "images/aeroplane.png"), for: .normal)
        
        lamborghini.setImage( UIImage.init(named: "images/lamborghini.png"), for: .normal)
        nissan.setImage( UIImage.init(named: "images/Nissan-logo.png"), for: .normal)
        mini.setImage( UIImage.init(named: "images/audi_logo.png"), for: .normal)
        chevrolet.setImage( UIImage.init(named: "images/Dodge-logo.png"), for: .normal)
    }
    
    //place object on tap
    //use 4x4 matrix to place object + use of hitTest
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard let touch = touches.first else{return}
                let results = sceneView.hitTest(touch.location(in: sceneView), types: [ARHitTestResult.ResultType.featurePoint] )
            guard let anchor = results.last else {return}
                    let hitTransform = SCNMatrix4(anchor.worldTransform)
                    let hitPosition = SCNVector3Make(hitTransform.m41, hitTransform.m42, hitTransform.m43)
                        treeNode?.position = hitPosition
        }
    
    
    
    @IBAction func changeScene(_ sender: UIButton) {
        guard let button = sender as? UIButton else {
           return
       }
        switch button.tag{
//        case 7:
//            scene = SCNScene(named: "art.scnassets/ship.scn")!
//            self.treeNode = scene.rootNode.childNode(withName: "shipMesh", recursively: true)
//            self.treeNode?.position = SCNVector3(0, 0, -1)
//
//            self.colorNode = scene.rootNode.childNode(withName: "shipMesh", recursively: true)
//            self.colorNode?.position = SCNVector3(0, 0, -1)
//            // Set the scene to the view
//            sceneView.scene = scene
//        case 8:
//            scene = SCNScene(named: "art.scnassets/tree.dae")!
//            self.treeNode = scene.rootNode.childNode(withName: "Tree_lp_11", recursively: true)
//            self.treeNode?.position = SCNVector3(0, 0, -1)
//
//            self.colorNode = scene.rootNode.childNode(withName: "Tree_lp_11", recursively: true)
//            self.colorNode?.position = SCNVector3(0, 0, -1)
//            // Set the scene to the view
//            sceneView.scene = scene
//        case 9:
//            scene = SCNScene(named: "art.scnassets/piper_pa18.dae")!
//            self.treeNode = scene.rootNode.childNode(withName: "fuselage01", recursively: true)
//            self.treeNode?.position = SCNVector3(0, 0, -1)
//
//            self.colorNode = scene.rootNode.childNode(withName: "fuselage01", recursively: true)
//            self.colorNode?.position = SCNVector3(0, 0, -1)
//            // Set the scene to the view
//            sceneView.scene = scene
        
        case 11:
            scene = SCNScene(named: "art.scnassets/lamborghini/lamborghini.dae")!
            self.treeNode = scene.rootNode.childNode(withName: "node", recursively: true)
            self.treeNode?.position = SCNVector3(0, 0, -1)
            
            self.colorNode = scene.rootNode.childNode(withName:"node",recursively:true)
            self.colorNode?.position = SCNVector3(0, 0, -1)
            // Set the scene to the view
            sceneView.scene = scene
            
        case 12:
            scene = SCNScene(named: "art.scnassets/dodge/dodge.dae")!
            self.treeNode = scene.rootNode.childNode(withName: "node", recursively: true)
            self.treeNode?.position = SCNVector3(0, 0, -1)
            
            self.colorNode = scene.rootNode.childNode(withName: "node", recursively: true)
            self.colorNode?.position = SCNVector3(0, 0, -1)
            // Set the scene to the view
            sceneView.scene = scene
            
        case 13:
            scene = SCNScene(named: "art.scnassets/audiR8/audiR8.dae")!
            self.treeNode = scene.rootNode.childNode(withName: "node", recursively: true)
            self.treeNode?.position = SCNVector3(0, 0, -1)
            
            self.colorNode = scene.rootNode.childNode(withName: "node", recursively: true)
            self.colorNode?.position = SCNVector3(0, 0, -1)
            // Set the scene to the view
            sceneView.scene = scene
            
            
        case 14:
            scene = SCNScene(named: "art.scnassets/nissan/nissan.dae")!
            self.treeNode = scene.rootNode.childNode(withName: "node", recursively: true)
            self.treeNode?.position = SCNVector3(0, 0, -1)
            
            self.colorNode = scene.rootNode.childNode(withName: "node", recursively: true)
            self.colorNode?.position = SCNVector3(0, 0, -1)
            // Set the scene to the view
            sceneView.scene = scene
        default:
            print("car unknown")
            return
        }
    }
    
    
    @IBAction func changeColor(_ sender: UIButton) {
        guard let button = sender as? UIButton else {
            return
        }
        switch button.tag {
        case 1:
            colorNode.geometry = colorNode.geometry!.copy() as? SCNGeometry
            // Un-share the material, too
            colorNode.geometry?.firstMaterial = colorNode.geometry?.firstMaterial!.copy() as? SCNMaterial
            // Change node's material without changing parent and other childs:
            colorNode.geometry?.material(named:"body")?.diffuse.contents = UIColor(red:0.53, green:0.12, blue:0.17, alpha:1.0)
            print("case 1")
        case 2:
            colorNode.geometry = colorNode.geometry!.copy() as? SCNGeometry
            // Un-share the material, too
            colorNode.geometry?.firstMaterial = colorNode.geometry?.firstMaterial!.copy() as? SCNMaterial
            // Change node's material without changing parent and other childs:
            colorNode.geometry?.material(named:"body")?.diffuse.contents = UIColor(red:0.15, green:0.20, blue:0.41, alpha:1.0)
             print("case 2")
        case 3:
            colorNode.geometry = colorNode.geometry!.copy() as? SCNGeometry
            // Un-share the material, too
            colorNode.geometry?.firstMaterial = colorNode.geometry?.firstMaterial!.copy() as? SCNMaterial
            colorNode.geometry?.material(named:"body")?.diffuse.contents = UIColor(red:0.0,green:0.0,blue:0.0,alpha:1.0)
            print("case 3")
        case 4:
            colorNode.geometry = colorNode.geometry!.copy() as? SCNGeometry
            // Un-share the material, too
            colorNode.geometry?.firstMaterial = colorNode.geometry?.firstMaterial!.copy() as? SCNMaterial
            // Change node's material without changing parent and other childs:
            colorNode.geometry?.material(named:"body")?.diffuse.contents = UIColor(red:0.90, green:0.91, blue:0.22, alpha:1.0)
            print("case 4")
        case 5:
            colorNode.geometry = colorNode.geometry!.copy() as? SCNGeometry
            // Un-share the material, too
            colorNode.geometry?.firstMaterial = colorNode.geometry?.firstMaterial!.copy() as? SCNMaterial
            // Change node's material without changing parent and other childs:
            colorNode.geometry?.material(named:"body")?.diffuse.contents = UIColor(red:0.12, green:0.53, blue:0.48, alpha:1.0)
            print("case 5")
        case 6:
            colorNode.geometry = colorNode.geometry!.copy() as? SCNGeometry
            // Un-share the material, too
            colorNode.geometry?.firstMaterial = colorNode.geometry?.firstMaterial!.copy() as? SCNMaterial
            // Change node's material without changing parent and other childs:
            colorNode.geometry?.material(named:"body")?.diffuse.contents = UIColor(red:0.49, green:0.10, blue:0.45, alpha:1.0)
            print("case 6")
        default:
            print("color unknown")
            return
        }
    }
    
    @IBAction func panGesture(_ gestureRecognize: UIPanGestureRecognizer) {
        let translation = gestureRecognize.translation(in: gestureRecognize.view!)
        
        let x = Float(translation.x)
        let y = Float(-translation.y)
        
        let anglePan = sqrt(pow(x,2)+pow(y,2))*(Float)(Double.pi)/180.0
        
        var rotationVector = SCNVector4()
        rotationVector.x = -y
        rotationVector.y = x
        rotationVector.z = 0
        rotationVector.w = anglePan
        
        treeNode.rotation = rotationVector
        
    }
    
    
    
    @IBAction func pinchGesture(_ sender: UIPinchGestureRecognizer) {
        
        var pinchScale = round(sender.scale * 1000)/1000000
        
        treeNode?.runAction(.customAction(duration: 0, action: { node, progress in
            node.physicsBody = nil
            node.scale = SCNVector3(x: Float(pinchScale), y: Float(pinchScale), z: Float(pinchScale))
        }))
        
        print("pinch")
        
}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingSessionConfiguration()
        
        configuration.planeDetection = .horizontal
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        // This visualization covers only detected planes.
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        
        // Create a SceneKit plane to visualize the node using its position and extent.
        let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        let planeNode = SCNNode(geometry: plane)
        planeNode.position = SCNVector3Make(planeAnchor.center.x, 0, planeAnchor.center.z)
        
        // SCNPlanes are vertically oriented in their local coordinate space.
        // Rotate it to match the horizontal orientation of the ARPlaneAnchor.
        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
        
        // ARKit owns the node corresponding to the anchor, so make the plane a child node.
        node.addChildNode(planeNode)
    }
    
}
