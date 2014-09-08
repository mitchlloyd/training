import Ember from 'ember';

export default Ember.ArrayController.extend({
  needs: ['course'],
  sectionsBinding: 'controllers.course.sections',
  isSidebarActive: true
});
