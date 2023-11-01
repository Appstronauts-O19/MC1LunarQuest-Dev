//
//  ContentView.swift
//  test-app
//
//  Created by Aleksandr Morozov on 23/10/23.
//

import SwiftUI
//AR Packages
import RealityKit
import ARKit


struct MissionView: View {
    
    @State private var isCameraPermissionGranted: Bool = false
    @ObservedObject var viewModel = MissionViewModel()
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationStack {
            ZStack{
                
                //AR View
                ARViewContainer(viewModel: viewModel).edgesIgnoringSafeArea(.all)
                
                //SwiftUI Overlay View
                AROverlayView(currentPage: $viewModel.currentPage)
                    .opacity(viewModel.isCoachingOverlayActive ? 0 : 1)
                    .animation(.easeInOut(duration: 1.2), value: viewModel.isCoachingOverlayActive)
                
                //End View, badge reveal, Badge append to the UserData
                ARMissionEndView()
                    .opacity(viewModel.missionIsOver ? 1 : 0)
                    .animation(.easeInOut(duration: 1.2), value: viewModel.missionIsOver)
                
                
            }
            .navigationBarBackButtonHidden(true)
            .toolbar(content: {
                ToolbarItem (placement: .navigationBarLeading)  {
                    
                    Button(action: {
                       presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrowshape.backward.circle.fill")
                            .resizable()
                            .shadow(radius: 4)
                            .frame(width: 35,height: 35)
                            .foregroundColor(Color.white)
                    })
                }
            })
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    @EnvironmentObject var userData: UserData
    
    let sessionDelegate : ARSessionDelegate
    let viewModel: MissionViewModel
    
    init(viewModel: MissionViewModel) {
        self.viewModel = viewModel
        self.sessionDelegate = ARSessionDelegate(viewModel: viewModel)
    }

    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        
        //Configuring ARView
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        config.environmentTexturing = .automatic
        
        //Check if User has LiDAR, if so, make tracking more accurate.
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        
        //🕺 Add User Body Segmentation
        if ARWorldTrackingConfiguration.supportsFrameSemantics(.personSegmentationWithDepth) {
            config.frameSemantics.insert(.personSegmentationWithDepth)
        } else if ARWorldTrackingConfiguration.supportsFrameSemantics(.personSegmentation) {
            config.frameSemantics.insert(.personSegmentation)
        }
        
        arView.session.run(config)
        
        
        // Load your Reality Composer scene
        let anchor = try! Experience.loadScene()
        arView.scene.anchors.append(anchor)
    

        
        //Implementing ARCoachingView
        let coachingOverlay = ARCoachingOverlayView()
        arView.session.delegate = sessionDelegate
        
        // Make sure it rescales if the device orientation changes.
        coachingOverlay.autoresizingMask = [
          .flexibleWidth, .flexibleHeight
        ]
        
        arView.addSubview(coachingOverlay)
        
        coachingOverlay.session = arView.session
        coachingOverlay.activatesAutomatically = true
        coachingOverlay.goal = .horizontalPlane
        
        // Assign coaching overlay to the custom delegate.
        // This is done in order to controll when is ARCoachingOverlay visible.
        sessionDelegate.coachingOverlay = coachingOverlay
        
        
        //Loading Event Listeners
        anchor.actions.sampleTaken.onAction = firstInput(_:)
        anchor.actions.roverInfo.onAction = secondInput(_:)
        anchor.actions.missionEnded.onAction = thirdInput(_:)


        
        return arView
        
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
    
    
    //First Infromation Changer Implementation
    func firstInput(_ entity: Entity?){
        print("💚 First Event was Triggered")
        viewModel.currentPage = 1
    }
    
    //Second Infromation Changer Implementation
    func secondInput(_ entity: Entity?){
        print("💚 Second Event was Triggered")
        viewModel.currentPage = 2
    }
    
    //Th Infromation Changer Implementation
    func thirdInput(_ entity: Entity?){
        print("💚 Third Event was Triggered")
        viewModel.missionIsOver = true
        
        //Check if the badge has not been already earned, if it wasn't add it to badges list.
        if !userData.user.badges.contains("Badge1") {
                userData.user.badges.insert("Badge1", at: 0)
            }
        
        print("userData updated with the badge")
        print(viewModel.missionIsOver)
    
    }
}


//Handle ARSession Events
class ARSessionDelegate: NSObject, ARKit.ARSessionDelegate {
    
    weak var coachingOverlay: ARCoachingOverlayView?
    weak var viewModel: MissionViewModel?
    
    
    //View Model Event Listener Handler
    init(viewModel: MissionViewModel) {
        self.viewModel = viewModel
    }
    
    //Rest

    func session(_ session: ARSession, didFailWithError error: Error) {
        // Handle session failure, e.g., show an alert to the user
        print("Session failed with error: \(error.localizedDescription)")
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Handle session interruption, e.g., pause AR experience
        print("Session was interrupted")
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Handle end of session interruption
        print("Session interruption ended")
    }
    
    
    
    //This method is called whenever there's a change in the tracking state of the AR session. This method allows us to handle various tracking states, such as when the tracking is normal, not available, or limited for specific reasons.
    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        // Handle changes in camera tracking state
        switch camera.trackingState {
            
        case .notAvailable:
            coachingOverlay?.setActive(true, animated: true)
            viewModel?.isCoachingOverlayActive = true
            print("‼️ Tracking not available")
            
        case .limited(let reason):
            coachingOverlay?.setActive(true, animated: true)
            viewModel?.isCoachingOverlayActive = true

            switch reason {
                case .excessiveMotion:
                    print("🚨 Limited tracking: excessive motion")
                case .initializing:
                    print("🚨 Limited tracking: initializing")
                case .insufficientFeatures:
                    print("🚨 Limited tracking: insufficient features")
                case .relocalizing:
                    print("🚨 Limited tracking: relocalizing")
                @unknown default:
                    print("‼️ Unknown tracking state")
            }
            
        case .normal:
            coachingOverlay?.setActive(false, animated: true)
            viewModel?.isCoachingOverlayActive = false
            print("💚 Tracking is normal")
        }
    }
    
    //Specifically called when there's a tracking failure, and ARKit is asking whether it should try to relocalize (i.e., attempt to recover the tracking state).
    func session(_ session: ARSession, shouldAttemptRelocalizationAfterFailure error: Error) -> Bool {
            // Decide whether to attempt relocalization or not
            let error = error as NSError
            
            if error.domain == ARErrorDomain {
                switch ARError.Code(rawValue: error.code) {
                case .cameraUnauthorized:
                    print("Camera access is not authorized.")
                    // You might want to show an alert or update the UI here.
                    return false
                case .sensorFailed, .sensorUnavailable:
                    print("Sensor issue.")
                    // You might want to show an alert or update the UI here.
                    return false
                case .worldTrackingFailed:
                    print("World tracking has failed.")
                    coachingOverlay?.setActive(true, animated: true) // Activate coaching overlay.
                    return true // You can attempt to relocalize in case of world tracking failure.
                default:
                    return false
                }
            }
            return false
        }
}


#Preview {
    MissionView()
        .environmentObject(UserData())
}
