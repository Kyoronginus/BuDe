//
//  PotatoData.swift
//  BuDe
//
//  Created by Gabriella Angelina Widjaja on 02/05/26.
//

import SwiftUI

enum PotatoHandlingTips {
    case healthy
    case blackScurf
    case commonScab
    case sprouted
    case greenSkin
    case rotten
    
    var handle: PotatoHandlingModel {
        switch self {
        case .healthy, .commonScab, .blackScurf:
            return PotatoHandlingModel(
                texts: ["Avoid direct sun", "Keep cool & dry", "Use breatheable storage"],
                images: [Image("avoid-direct-sun"), Image("keep-cool-&-dry"), Image("use-breatheable-storage")]
            )
        case .sprouted, .greenSkin, .rotten:
            return PotatoHandlingModel(
                texts: ["Cut damaged parts", "Use good parts", "Finish immediately"],
                images: [Image("cut-damaged-parts"), Image("use-good-parts"), Image("finish-immediately")]
            )
        }
    }
    
}

extension Potato {
    static let data: [Potato] = [
        Potato(
            name: "Healthy",
            action: "Safe to Eat",
            handle: PotatoHandlingTips.healthy.handle,
            storage: ["Simpan di tempat sejuk, gelap, kering", "Gunakan paper bag/keranjang berlubang"],
            isRecommended: true
        ),
        Potato(
            name: "Black Scurf",
            action: "Safe to Eat",
            handle: PotatoHandlingTips.blackScurf.handle,
            storage: ["Hindari menyimpan di suhu dengan kelembapan tinggi", "Simpan di tempat gelap, kering, dan sirkulasi baik", "Segera olah/gunakan kentang jenis ini"],
            isRecommended: true
        ),
        Potato(
            name: "Common Scab",
            action: "Safe to Eat",
            handle: PotatoHandlingTips.commonScab.handle,
            storage: ["Simpan di tempat sejuk, gelap, dan kering", "Jangan simpan saat kulit basah", "Segera olah/gunakan kentang jenis ini"],
            isRecommended: true
        ),
        Potato(
            name: "Sprouted",
            action: "Not recommended",
            handle: PotatoHandlingTips.sprouted.handle,
            storage: ["Simpan lebih dingin dan gelap total", "Hindari suhu panas dapur dan cahaya", "Cek secara rutin karena tunas cepat menyebar"],
            isRecommended: false
        ),
        Potato(
            name: "Green Skin",
            action: "Not recommended",
            handle: PotatoHandlingTips.greenSkin.handle,
            storage: ["Hindari cahaya dan suhu ruang secara langsung", "Gunakan box/paper bag tertutup", "Jangan taruh di meja terbuka"],
            isRecommended: false
        ),
        Potato(
            name: "Rotten",
            action: "Not recommended",
            handle: PotatoHandlingTips.rotten.handle,
            storage: ["Pisahkan segera dari stok sehat", "Bersihkan area simpan", "Gunakan sistem beli dulu pakai dulu"],
            isRecommended: false
        )]
}
