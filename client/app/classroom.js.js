$.ajaxPrefilter(function(options, originalOptions, xhr) {
  return xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
});

Ember.LOG_VERSION = false;

window.Training = Ember.Application.create();
