//
//  HowCrowdedView.swift
//  Bizzy
//
//  Created by Henry Warren on 6/1/20.
//  Copyright © 2020 Bizzy Inc. All rights reserved.
//

import SwiftUI

struct HowCrowded: View {
    var body: some View {
        VStack {
            Text("How busy?")
                .font(.custom("Avenir Next", size: 50))
                .padding(.vertical,80)
            Button(action: {print("not busy")})
                {
            VStack {
                HStack (alignment: .top){
                    Spacer()
                Text("Not busy")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.primary)
                Spacer()
                }.padding(.vertical,50)
                    .clipShape(RoundedRectangle(cornerRadius: 40).stroke(Color.red))
                    
                Spacer()
                    }

            }
        }
    }
}

struct HowCrowded_Previews: PreviewProvider {
    static var previews: some View {
        HowCrowded()
    }
}
