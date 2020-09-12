// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class AllCityQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query AllCity {
      allCity {
        __typename
        name
        longitude
        latitude
      }
    }
    """

  public let operationName: String = "AllCity"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("allCity", type: .nonNull(.list(.nonNull(.object(AllCity.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allCity: [AllCity]) {
      self.init(unsafeResultMap: ["__typename": "Query", "allCity": allCity.map { (value: AllCity) -> ResultMap in value.resultMap }])
    }

    public var allCity: [AllCity] {
      get {
        return (resultMap["allCity"] as! [ResultMap]).map { (value: ResultMap) -> AllCity in AllCity(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: AllCity) -> ResultMap in value.resultMap }, forKey: "allCity")
      }
    }

    public struct AllCity: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CityData"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("longitude", type: .nonNull(.scalar(Double.self))),
          GraphQLField("latitude", type: .nonNull(.scalar(Double.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, longitude: Double, latitude: Double) {
        self.init(unsafeResultMap: ["__typename": "CityData", "name": name, "longitude": longitude, "latitude": latitude])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var longitude: Double {
        get {
          return resultMap["longitude"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "longitude")
        }
      }

      public var latitude: Double {
        get {
          return resultMap["latitude"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "latitude")
        }
      }
    }
  }
}
