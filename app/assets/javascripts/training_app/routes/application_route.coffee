Training.ApplicationRoute = Ember.Route.extend
  actions:
    flash: (message, status) ->
      @controllerFor('flash').add(message, status)

  redirect: ->
    courseID = window.course_id || 4
    @transitionTo("/courses/#{courseID}/chapters")

