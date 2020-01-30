//
//  SceneViewController.swift
//  Example
//
//  Created by Nick Lockwood on 11/12/2018.
//  Copyright © 2018 Nick Lockwood. All rights reserved.
//

import Euclid
import SceneKit
import UIKit

class SceneViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // create a new scene
        let scene = SCNScene()

        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)

        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 3)

        // create some geometry using Euclid
        let start = CFAbsoluteTimeGetCurrent()
        let cube = Mesh.cube(size: 1.5, material: UIColor.red)
        
        /*
        let points = [Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.23366689682000003, 0.25247043371000005), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.23587751389000003, 0.25150114298000004), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.25046777725, 0.24962288141000002), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.26719170809000004, 0.24678832293000003), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.29889386892, 0.24925655127000002), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.38926696777, 0.20208930969000002), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.40499490499, 0.10593676567000002), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.38953459263000006, 0.041679441930000005), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.38678115606, 0.03481626511), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.37775522470000006, 0.017602920530000003), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.37529927492000004, 0.008846580980000001), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.35327547789, -0.029907226560000003), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.30819284916, -0.07761567831), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.25834113359000005, -0.09552890062000001), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.24907588959000002, -0.09345978498000002), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.24428045750000002, -0.09146887064), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.23319780827000003, -0.09222000837000001), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.22417795658000003, -0.09205657244000001), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.16853535175, -0.06898665428), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.10950005054, -0.0409040451), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.06903898716000001, -0.015104055400000002), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.06388723850000001, -0.011164188390000001), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.058735370640000006, -0.007225632670000001), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.055564522740000004, -0.0005205869700000001), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.050183534620000005, 0.005303144450000001), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.034917354580000004, 0.03483986855000001), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.031789064410000005, 0.04146218300000001), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.02795171738, 0.07294684649000001), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.027503609660000004, 0.07662320137), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.026386857030000002, 0.08578860760000001), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.026163816450000002, 0.08761739731000001), isCurved: false),
                      Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.23366689682000003, 0.25247043371000005), isCurved: false)]
        */
        
        //minimal set of points to reproduce problem
        let points = [
            Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.24907588959000002, -0.09345978498000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.23319780827000003, -0.09222000837000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.22417795658000003, -0.09205657244000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.06903898716000001, -0.015104055400000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.06388723850000001, -0.011164188390000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.058735370640000006, -0.007225632670000001), isCurved: false)
        ]
        
        let path = Path(points).closed()
        let mesh = cube.subtract(Mesh.extrude(path, depth: 1.6, faces: .default, material: UIColor.green))
        //let mesh = Mesh.fill(path, faces: .default, material: UIColor.green)
        
        print("Time:", CFAbsoluteTimeGetCurrent() - start)
        print("Polys:", mesh.polygons.count)

        // create SCNNode
        let geometry = SCNGeometry(mesh) {
            let material = SCNMaterial()
            material.diffuse.contents = $0 as? UIColor
            return material
        }
        let node = SCNNode(geometry: geometry)
        node.eulerAngles = SCNVector3(0, Double.pi / 2, 0)
        scene.rootNode.addChildNode(node)

        // configure the SCNView
        let scnView = view as! SCNView
        scnView.scene = scene
        scnView.autoenablesDefaultLighting = true
        scnView.allowsCameraControl = true
        scnView.showsStatistics = true
        scnView.backgroundColor = .white
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
