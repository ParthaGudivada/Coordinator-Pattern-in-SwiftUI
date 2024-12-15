//
//  SignupView.swift
//  Coordinator
//
//  Created by Mayank Gupta on 23/07/24.
//

import SwiftUI

struct SignupView: View {
    @Environment(Coordinator.self) private var coordinator: Coordinator

    @State private var viewModel: SignupViewModel

    init(viewModel: SignupViewModel) {
        _viewModel = .init(initialValue: viewModel)
    }

    var body: some View {
        VStack {
            Spacer()

            Text("Create Account")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)

            Image(systemName: "person.crop.circle.fill.badge.plus")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
                .padding(.bottom, 40)

            VStack(alignment: .leading) {
                Text("Username")
                    .font(.subheadline)
                    .padding(.bottom, 5)

                TextField("Enter your username", text: $viewModel.username)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5)
                    .padding(.bottom, 20)

                Text("Email Address")
                    .font(.subheadline)
                    .padding(.bottom, 5)

                TextField("Enter your email address", text: $viewModel.email)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5)
                    .padding(.bottom, 20)

                Text("Password")
                    .font(.subheadline)
                    .padding(.bottom, 5)

                HStack {
                    if viewModel.isSecure {
                        SecureField("Enter your password", text: $viewModel.password)
                    } else {
                        TextField("Enter your password", text: $viewModel.password)
                    }
                    Button(action: {
                        viewModel.isSecure.toggle()
                    }) {
                        Image(systemName: viewModel.isSecure ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5)
                .padding(.bottom, 20)

                Text("Confirm Password")
                    .font(.subheadline)
                    .padding(.bottom, 5)

                HStack {
                    if viewModel.isSecure {
                        SecureField("Confirm your password", text: $viewModel.confirmPassword)
                    } else {
                        TextField("Confirm your password", text: $viewModel.confirmPassword)
                    }

                    Button(action: {
                        viewModel.isSecure.toggle()
                    }) {
                        Image(systemName: viewModel.isSecure ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5)
            }
            .padding(.horizontal, 30)

            Button(action: {
                coordinator.dismissCover()
            }) {
                Text("Sign Up")
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
                coordinator.dismissCover()
            }) {
                Text("Already have an account?")
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

    SignupView(viewModel: SignupViewModel())
        .environment(coordinator)
}
