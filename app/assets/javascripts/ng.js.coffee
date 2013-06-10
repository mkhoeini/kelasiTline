
@resourcesCtrl = ['$scope', '$http', ($scope, $http) ->
  token = $("meta[name='csrf-token']").attr("content")
  $http.defaults.headers.common["X-CSRF-Token"] = token

  $scope.loggedInUser =
    picture: 'assets/user.png'
    notifications: 0

  $http.get("/users.json").success (data) ->
    $scope.users = {}
    for user in data
      $scope.users[user.id.toString()] = user
      $scope.users[user.id.toString()].notifications = 0

  $http.get("/posts.json").success (data) ->
    $scope.posts = data

  $scope.userLogin = (userId) ->
    $http.post('/login.json', {name: $scope.users[userId].name})
      .success (data) ->
        return unless data.id == userId

        $scope.loggedInUser = data
        elm = $('#user-'+userId)
        elm.parents('section.section').siblings().find('a').removeClass('selected')
        elm.addClass 'selected'
]
