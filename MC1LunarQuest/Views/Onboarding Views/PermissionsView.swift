//
//  PermissionsView.swift
//  LunarQuest
//
//  Created by Kevser on 21/10/23.
//

import SwiftUI
import AVFoundation



class CameraPermissionViewModel: ObservableObject {
    @Published var isCameraAuthorized = AVCaptureDevice.authorizationStatus(for: .video) == .authorized
    
    func requestCameraPermission() {
        AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
            DispatchQueue.main.async {
                self?.isCameraAuthorized = granted
            }
        }
    }
}


struct PermissionsView: View {
    
    @Binding var user : UserModel
    
    @ObservedObject var viewModel = CameraPermissionViewModel()
    @State private var isAlertPresented = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                Image("permissions")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black, Color.clear,Color.clear]),
                            startPoint: .bottom,
                            endPoint: .top
                        ))
                
                VStack {
                    Spacer(minLength: 500)
                    Text("Camera Access")
                        .font(.title).bold()
                        .foregroundColor(.white)
                    
                    Text("To unlock the full Augmented Reality adventure, grant us permission to access your camera. It's an essential component for an immersive and captivating experience.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .padding(.top, 1)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(Color.gray.opacity(0.6))
                            .frame(height: 50)
                            .padding(.horizontal)
                        
                        HStack {
                            ZStack {
                                Rectangle()
                                    .cornerRadius(4.0)
                                    .foregroundColor(.blue)
                                    .frame(width: 40, height: 30)
                                
                                Image(systemName: "camera.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(.white)
                                    .padding()
                            }.padding()
                            
                            Toggle("Allow Camera", isOn: $viewModel.isCameraAuthorized)
                                .foregroundColor(.white)
                                .font(.system(size: 18).weight(.semibold))
                                .padding()
                                .onChange(of: viewModel.isCameraAuthorized, { oldValue, newValue in
                                    if newValue {
                                        isAlertPresented = true
                                        viewModel.requestCameraPermission()
                                        }
                                    isAlertPresented = false
                                    user.hasCompletedSetup = true
                                    })
                            
                            Spacer(minLength: 10)
                                
                        }
                                
                    }
                    
                    HStack {

                        NavigationLink(destination: HomePageView(user: $user)) {
                            Label("Explore the Universe  ", systemImage: "arrowshape.forward.circle")
                                .padding(10)
                                .background(Color.UserSetup_grey.opacity(0.6))
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                            
                        }
                    }.padding()
                    
                    
                    Spacer()
                    
                }
                .blur(radius: isAlertPresented ? 3 : 0)
                
                
            }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        .accentColor(.purple)
    }
}

#Preview {
    
    PermissionsView(user: .constant(UserData().user))
}
