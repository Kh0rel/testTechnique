//
//  APIError.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 07/03/2021.
//

import Foundation

enum APIError: String, Error {
   case urlNotConform = "Erreur lors de la création de l'url"
   case decodableError = "Error lors du parsing json"
   case noData = "Aucune données disponible"
   case serverError = "Erreur lors de la récupération des données, vérifiez votre connexion"
}
