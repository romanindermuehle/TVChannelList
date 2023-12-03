//
//  ChannelGenre.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 03.12.23.
//

import Foundation

enum ChannelGenre: String, Codable {
    case lvtn = "Lvtn"
    case r2ei = "R2Ei"
    case kewm = "keWM"
    case bv0t = "Bv0T"
    case nkki = "nKKI"
    case rfya = "rfya"
    case isb2 = "isb2"
    case jyfp = "jyfP"
    case cdef = "cDEF"
    case rlhi = "rlhi"
    case x2ht = "X2HT"
    case lc2f = "Lc2F"
    case ex5r = "Ex5r"
    case gtmd = "gtMd"
    case vx78 = "vx7B"
    case q1bm = "q1bm"
    case sysn = "SysN"
    case zrlf = "zRlf"
    case psug = "PSug"
    case fivebv3 = "5bV3"
    case u3c = "U3-c"
    case ajdg = "AjdG"
    case iw7 = "I_w7"
    case zvkp = "zvkP"
    case jtdr = "JtdR"
    case goq4 = "goq4"

    var name: String {
        switch self {
        case .lvtn: "Country"
        case .r2ei: "E-Sports"
        case .kewm: "Spezialkanal"
        case .bv0t: "Volksmusik & Schlager"
        case .nkki: "Weitere"
        case .rfya: "Lifestyle"
        case .isb2: "Filme & Serien"
        case .jyfp: "Klassik"
        case .cdef: "Hip Hop & RnB"
        case .rlhi: "UHD Sender"
        case .x2ht: "Religion & Kultur"
        case .lc2f: "Premium Sender"
        case .ex5r: "Hauptsender"
        case .gtmd: "Regionalsender"
        case .vx78: "Sender ohne Replay Werbung"
        case .q1bm: "Rock & Pop"
        case .sysn: "Jazz"
        case .zrlf: "Kultur"
        case .psug: "Info & Sport & Talk"
        case .fivebv3: "Dance & Electro"
        case .u3c: "Kinder"
        case .ajdg: "Sport"
        case .iw7: "Sender mit Replay Werbung"
        case .zvkp: "News & Doku"
        case .jtdr: "Musik"
        case .goq4: "Shopping"
        }
    }
}
