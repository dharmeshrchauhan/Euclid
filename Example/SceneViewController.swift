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
        let cube = Mesh.cube(size: Vector(0.075, 1.5, 1.5), material: UIColor.lightGray)
        
        //First set of points to reproduce reproduce
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
            Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.24907588959000002, -0.09345978498000002), isCurved: true),
            Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.23319780827000003, -0.09222000837000001), isCurved: true),
            Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.22417795658000003, -0.09205657244000001), isCurved: true),
            Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.06903898716000001, -0.015104055400000002), isCurved: true),
            Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.06388723850000001, -0.011164188390000001), isCurved: true),
            Euclid.PathPoint(Euclid.Vector(0.027999856950000002, -0.058735370640000006, -0.007225632670000001), isCurved: true)
        ]
        
        //Third set of points to reproduce reproduce
        /*
        let points = [
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.19459629059000003, 0.29052138329000005), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.19459629059000003, 0.29052138329000005), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.15527081490000003, 0.27815639973), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.15223777294000002, 0.27161765099), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.14919781685000003, 0.26506328583000005), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.14590322971000003, 0.26110351086), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.13906097412, 0.25578868389000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.12914800644000002, 0.24388027191000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.12229430676000001, 0.23855483532000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.11543881893, 0.23322820663000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.10858166218000001, 0.22790038586000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.10172307491000002, 0.22257065773), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.09861195087, 0.21593451500000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.09903800488000002, 0.21062576771000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.09591495991000001, 0.20395731926000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.09257566929000001, 0.19994580746), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.08923327923, 0.19593060017000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.08588778973000001, 0.19191169739000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.08314609528000001, 0.17982089520000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.07998764515000001, 0.17308020592), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.07682180405000001, 0.16632354259), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.07741773129000001, 0.15816783905), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.07463252544000001, 0.14589464664000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.0716354847, 0.13631093502000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.06484162807, 0.12811493874000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.05859351158000001, 0.11156964302000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.059341907500000006, 0.10039734840000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.056287050250000005, 0.09063458443000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.05303680897000001, 0.08365833759), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.05358815193000001, 0.07516789436), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.05414235592, 0.06663751602000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.05451285839000001, 0.06092870235000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.05525803566, 0.04945731163000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.05563187599, 0.043695211410000004), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.05600750446, 0.037914991380000006), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.056384205820000005, 0.03211605549), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.05657279491000001, 0.029210090640000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.06082713604000001, 0.021804571150000004), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.07291233540000001, 0.011164426800000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.08490347862000001, 0.0033845901500000005), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.09302663803000001, -0.0028305053700000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.10119926929, -0.009082913400000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.1094224453, -0.015374422070000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.11793839931000001, -0.02472615242), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.1260201931, -0.028073072430000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.13032841682000001, -0.03279292583000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.13873362541, -0.039228200910000004), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.14773082733, -0.05186033249000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.15681374073, -0.06461191177), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.16627120972, -0.08062303066000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.17975258827, -0.09544420242000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.19371092319000002, -0.11364877224000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.20786190033000002, -0.1321041584), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.21751832962000003, -0.14564085007000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.23165106773000002, -0.16123199463000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.24153304100000003, -0.17506372929000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.25597321987000005, -0.19101202488000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.26120865345000005, -0.1997538805), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.27059388161000003, -0.20715951920000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.28458499908, -0.21664583683000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.29412162304, -0.22416555882000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.30329656601000005, -0.22827661037000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.31251740456000004, -0.23240756989000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.32178318501000003, -0.23655927181000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.33109557629, -0.24073171616000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.33576846123000004, -0.24282550812000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.34045362473, -0.24492454529000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.34985899925, -0.24913859367000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.35931098461000005, -0.25337350368), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.36783218384000005, -0.25055682659), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.38113689423, -0.24985659122000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.39930582047, -0.25128495693), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.41274416447000006, -0.25058352947), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.43600022793000004, -0.25416886806000005), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.45395493507000007, -0.25203990936000004), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.47756171227000005, -0.25565719604000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.50014507771, -0.25207769871), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.51337647438, -0.24775505066000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5259943008400001, -0.23981642723000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5392729044000001, -0.23547399044000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5423887968100001, -0.22683274746), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5505816936500001, -0.22034454346000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5536758899700001, -0.21173882484000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.55234527588, -0.20461213589000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5503580570200001, -0.19396996498000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5490392446500001, -0.18690717220000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.54772496223, -0.179869771), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5457624197000001, -0.16936087608000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.54445981979, -0.16238582134000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.54251503944, -0.15197002888000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.54058051109, -0.14161002636), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5392963886300001, -0.13473379612000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.53737878799, -0.12446510792000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5354714393600001, -0.11425042152), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.53420507908, -0.10747039318000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5329439640000001, -0.10071480274000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.53105986118, -0.09062504768000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5291854143100001, -0.08058822155), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5279414653800001, -0.07392644882), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5260832309700001, -0.06397676468), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5242350101500001, -0.05407917500000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.52239608765, -0.044232368470000005), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5253937244400001, -0.03624403477), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.528383255, -0.028277158740000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5295200347900001, -0.010638594630000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.53187298775, 0.00046014786000000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5294257402400001, 0.013240933420000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5269944667800001, 0.025936007500000004), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5293326377900001, 0.03685414791), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5275182724, 0.04627001286000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.52571296692, 0.05563771725), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5239175558100001, 0.06495833397), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5221298933, 0.07423174381000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5209434032400001, 0.08038854599), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5144982338, 0.09118807316000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5092573165900001, 0.0958327055), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5034641027500001, 0.10348820686000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.50289201736, 0.10651350021000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.50175082684, 0.11254882812000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.50061333179, 0.11856389046000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.49834918976000003, 0.13053441048), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.49554026127000006, 0.14538681507), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.49674832821000003, 0.16156327724000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.49906313419000004, 0.17178952694000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5059130191800001, 0.18051290512), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.50820207596, 0.19066751003000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.51559233665, 0.19645869732000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.51900064945, 0.20079684258000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.51785540581, 0.20655715466000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.51728498936, 0.20943033695000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.51614546776, 0.21516287327000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5150103569000001, 0.22087693214), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.51444387436, 0.22372710705), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5133142471300001, 0.22941315174000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5121883153900001, 0.23508083820000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.50657808781, 0.24210131168000001), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.5009992122700001, 0.24908304214000002), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.49599516392000004, 0.25323498249000004), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.4954504966700001, 0.25602674484000004), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.48993229866000004, 0.26293253899), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.48832130432000004, 0.27124130726), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.48285079002000003, 0.27807080746), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.47251605988000006, 0.28889262676000005), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.46712779999000004, 0.29562449455), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.46126055717000003, 0.30502223969000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.45113480091, 0.31560516357), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.44061493874, 0.32874882221), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.4269298315, 0.33769822121000004), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.41291642189000005, 0.34917509556000004), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.39535880089000003, 0.35911118984), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.38210892677, 0.36777210236), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.36940479279000005, 0.37379872799), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.36085379124000005, 0.37863790989), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.35235178471000006, 0.38344919682000006), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.33988809586, 0.38935565948000006), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.32752203941, 0.39521586895000005), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.31525206566, 0.40103006363000004), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.30736970901000005, 0.40322673321), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.29916083813000005, 0.40788805485), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.29099905491000005, 0.41252315044000004), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.2832275629, 0.41467887163000006), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.27935409546, 0.41575324535), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.27163159847, 0.41789543629000003), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.26394104958000003, 0.42002874613), isCurved: false),
            Euclid.PathPoint(Euclid.Vector(0.03800008446000001, 0.24865531921000003, 0.42426872253000003), isCurved: false)]
        */
        
        let path = Path(points).closed()
        let meshForSubtraction = Mesh.extrude(path, depth: 1.6, faces: .default, material: UIColor.green)
        //meshForSubtraction = meshForSubtraction.merge(meshForSubtraction.inverted())
        let mesh = cube.union(meshForSubtraction)
        //mesh = mesh.union(mesh.inverted())
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
        //scnView.debugOptions = .showWireframe
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
