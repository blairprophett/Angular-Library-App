LibraryApp = angular.module("LibraryApp", [])

LibraryApp.controller("LibraryCtrl", ["$scope", "$http", ($scope, $http) ->

  $scope.libraries = []

  $http.get("/libraries.json").success (data) ->
    $scope.libraries = data

  $scope.addLibrary = (data) ->
    console.log("button clicked!!!")
    $http.post("/libraries.json", $scope.newLibrary).success (data) ->
    $scope.newLibrary = {}
    $scope.libraries.push(data)

  $scope.deleteLibrary = ->
    $scope.libraries.splice(@$index,1)

])

LibraryApp.controller("BooksCtrl", ["$scope", "$http", ($scope, $http) ->

  $scope.library.books = []

  $scope.addBook = ->
    $scope.library.books.push($scope.newBook) 
    $scope.newBook = {}

  $scope.deleteBook = ->
    $scope.library.books.splice(@$index,1)

])

# define config
LibraryApp.config(["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])