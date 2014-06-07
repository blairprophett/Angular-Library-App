LibraryApp = angular.module("LibraryApp",
  [ "LibraryControllers"
])

LibraryControllers = angular.module("LibraryControllers", [])

// LibraryApp.controller("LibraryCtrl", ["$scope", "$http", ($scope, $http) ->
//   # console.log "inside controller"
//   $scope.books = []

//   $http.get('/books.json').success (data) ->
//     $scope.books = data

//   $scope.addBook = ->
//     # console.log "add book button clicked"
//     $http.post('/books.json', $scope.newBook).success (data) ->
//       # console.log "SAVED!"
//       $scope.newBook = {}
//       $scope.books.push(data)



LibraryControllers.controller "LibraryCtrl", ($scope) ->
  $scope.library = []
  $scope.addLibrary = ->
    $scope.library.push $scope.newLibrary
    $scope.newLibrary = {}

BooksControllers.controller "BooksCtrl", [ "$scope", ($scope) ->
  $scope.library.books = []
  $scope.addBook = ->
    $scope.library.books.push $scope.newBook
    $scope.newBook= {}
 ]




LibraryApp.config(["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])