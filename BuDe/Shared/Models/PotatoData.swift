//
//  PotatoData.swift
//  BuDe
//
//  Created by Gabriella Angelina Widjaja on 02/05/26.
//

import SwiftUI

extension Potato {
    static let data: [Potato] = [
        Potato(
            name: "Healthy Potato",
            action: "Safe to Eat",
            handle: ["Cuci hanya sebelum digunakan", "Potong noda ringan sebelum masak", "Kupas tipis jika ada bercak kecil"],
            storage: ["Simpan di tempat sejuk, gelap, kering", "Gunakan paper bag/keranjang berlubang"],
            isRecommended: true
        ),
        Potato(
            name: "Black Scurf Potato",
            action: "Safe to Eat",
            handle: ["Sikat/cuci kuat permukaan", "Kupas kulit tebal pada area terinfeksi", "Aman dimakan jika bagian dalam keras dan normal"],
            storage: ["Hindari menyimpan di suhu dengan kelembapan tinggi", "Simpan di tempat gelap, kering, dan sirkulasi baik", "Segera olah/gunakan kentang jenis ini"],
            isRecommended: true
        ),
        Potato(
            name: "Common Scab Potato",
            action: "Safe to Eat",
            handle: ["Kupas area scab lebih dalam", "Buang bagian keriput atau retak besar", "Aman dimakan jika bagian dalam keras dan normal"],
            storage: ["Simpan di tempat sejuk, gelap, dan kering", "Jangan simpan saat kulit basah", "Segera olah/gunakan kentang jenis ini"],
            isRecommended: true
        ),
        Potato(
            name: "Sprouted Potato",
            action: "Not Recommended",
            handle: ["Jika ada tunas kecil, potong sampai akar mata tunas", "Jika tunas banyak dan keriput, jangan dimakan", "Jika pahit setelah dikupas, buang segera"],
            storage: ["Simpan lebih dingin dan gelap total", "Hindari suhu panas dapur dan cahaya", "Cek secara rutin karena tunas cepat menyebar"],
            isRecommended: false
        ),
        Potato(
            name: "Green Skin Potato",
            action: "Not Recommended",
            handle: ["Hijau tipis: kupas sangat tebal", "Hijau luas: segera buang", "Jangan dikonsumsi jika terasa pahit"],
            storage: ["Hindari cahaya dan suhu ruang secara langsung", "Gunakan box/paper bag tertutup", "Jangan taruh di meja terbuka"],
            isRecommended: false
        ),
        Potato(
            name: "Rotten Potato",
            action: "Not Recommended",
            handle: ["Langsung buang seluruh kentang", "Cek kentang lain di sekitarnya", "Jangan potong sebagian untuk diselamatkan"],
            storage: ["Pisahkan segera dari stok sehat", "Bersihkan area simpan", "Gunakan sistem beli dulu pakai dulu"],
            isRecommended: false
        )]
}
