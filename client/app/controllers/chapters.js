import Ember from 'ember';

export default Ember.ObjectController.extend({
  needs: ['course'],
  sectionsBinding: 'controllers.course.sections',
  isSidebarActive: true
});
