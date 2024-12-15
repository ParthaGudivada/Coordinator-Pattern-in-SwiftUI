//
//  ForgotPasswordView.swift
//  Coordinator
//
//  Created by Mayank Gupta on 15/07/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(Coordinator.self) private var coordinator: Coordinator

    @State private var viewModel: ForgotPasswordViewModel

    init(viewModel: ForgotPasswordViewModel) {
        _viewModel = .init(initialValue: viewModel)
    }

    var body: some View {
        VStack {
            Spacer()
            
            Text("Forgot Password")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            
            Image(systemName: "lock.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
                .padding(.bottom, 40)
            
            VStack(alignment: .leading) {
                Text("Email Address")
                    .font(.subheadline)
                    .padding(.bottom, 5)
                
                TextField("Enter your email address", text: $viewModel.email)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5)
                    .padding(.horizontal, 30)
            }
            .padding(.bottom, 20)
            
            Button(action: {
                coordinator.dismissSheet()
            }) {
                Text("Submit")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
            }
            .padding(.top, 30)
            
            Spacer()
            
            Button(action: {
                coordinator.dismissSheet()
            }) {
                Text("Go Back")
                    .foregroundColor(.blue)
            }
            .padding(.bottom, 20)
        }
        .background(Color(.systemGroupedBackground))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    @Previewable @State var coordinator = Coordinator()

    ForgotPasswordView(viewModel: ForgotPasswordViewModel())
        .environment(coordinator)
}
